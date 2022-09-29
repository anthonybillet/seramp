view: repeated_order_facts {
  derived_table: {
    sql:
      select
      a.order_id
      , a.created_at
      , COUNT(DISTINCT(b.order_id)) AS subsequent_orders
      , MIN(b.created_at) AS next_order_date
      , MIN(b.order_id) as next_order_id
      from thelook.order_items as a
      left join thelook.order_items as b on a.user_id = b.user_id and a.created_at < b.created_at
      group by 1, 2
      ;;
  }
#
  measure: count {
    type: count
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: created_at {
    type: time
    hidden: yes
    sql: ${TABLE}.created_at ;;
  }

  dimension: subsequent_orders {
    type: number
    sql: ${TABLE}.subsequent_orders ;;
  }

  dimension_group: next_order {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.next_order_date ;;
  }

  dimension: next_order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.next_order_id ;;
  }

  dimension: has_subsequent_orders{
    type: yesno
    sql: ${next_order_id} > 0 ;;
  }

  dimension: days_between_orders {
    description: "The number of days between one order and the next order"
    type: number
    sql: DATE_DIFF( date(${next_order_raw}), date(${order_items.created_raw}), day)  ;;
  }

  dimension: repeat_orders_within_60d {
    type: yesno
    view_label: "Repeat Purchase Facts"
    sql: ${days_between_orders} <= 60 ;;
  }

  measure: repeat_purchase_within_60d_count {
    type: count_distinct
    view_label: "Repeat Purchase Facts"
    filters: [repeat_orders_within_60d: "Yes"]
  }

  measure: 60_day_repeat_purchase_rate {
    description: "The percentage of customers who purchase again within 30 days"
    view_label: "Repeat Purchase Facts"
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${repeat_purchase_within_60d_count} / (CASE WHEN ${count} = 0 THEN NULL ELSE ${count} END) ;;
  }


  measure: average_days_between_orders {
    type: average
    sql: ${days_between_orders} ;;
  }
  }
