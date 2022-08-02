# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.thelook.order_items`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DELIVERED_AT;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.INVENTORY_ITEM_ID;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.ORDER_ID;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.RETURNED_AT;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.SALE_PRICE;;
    value_format_name: usd
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.SHIPPED_AT;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.USER_ID;;
  }

  #easy cohorting, assumes they already track signup date
  dimension_group: since_signup {
    type: duration
    sql_start: ${users.created_raw} ;;
    sql_end: ${created_raw} ;;
  }

  dimension: gross_margin {
    type: number
    sql: ${sale_price} - ${inventory_items.cost} ;;
    value_format_name: usd
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: total_gross_margin {
    type: sum
    sql: ${gross_margin} ;;
    value_format_name: usd
  }

  measure: count_orders {
    label: "# of Orders"
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: first_order_time {
    type: date_time
    sql: MIN(${created_raw}) ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.last_name,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
