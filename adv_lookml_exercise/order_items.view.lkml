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
    sql: ${TABLE}.id ;;
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
      month_num,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  filter: this_period_filter {
    type: date
    description: "Use this filter to define the current and previous period for analysis"
    sql: ${period} IS NOT NULL ;;
  }

  dimension: period {
    type: string
    description: "The reporting period as selected by the This Period Filter"
    sql:
      CASE
        WHEN {% date_start this_period_filter %} is not null AND {% date_end this_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_raw} >= {% date_start this_period_filter %}
                AND ${created_raw} <= {% date_end this_period_filter %}
                THEN 'This Period'
              WHEN ${created_raw} >= date_add(day,-1*date_diff(day,{% date_start this_period_filter %}, {% date_end this_period_filter %} ) + 1, date_add(day,-1,{% date_start this_period_filter %} ) )
                AND ${created_raw} <= date_add(day,-1,{% date_start this_period_filter %} ) + 1
                THEN 'Previous Period'
            END
        END ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_at ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_sale_price {
    type: sum
    #hidden: yes
    sql: ${sale_price} ;;
  }

  measure: average_sale_price {
    type: average
    #hidden: yes
    sql: ${sale_price} ;;
  }

  measure: cumulative_total_sales {
    description: "Cumulative total sales from items sold (also known as a running total) "
    type: running_total
    value_format_name: usd_0
    sql: ${sale_price};;
    drill_fields: [detail*]
  }

  measure: total_gross_revenue {
    description: "Total revenue from completed sales (cancelled and returned orders excluded)"
    type: sum
    sql: ${sale_price};;
    filters: [status: "-Cancelled, -Returned"]
    value_format_name: usd_0
    drill_fields: [users.gender, users.age_tiers, users.first_name, users.last_name, inventory_items.product_name]
  }

  measure: total_gross_margin_amount {
    description: "Total difference between the total revenue from completed sales and the cost of the goods that were sold"
    type: number
    value_format_name: usd_0
    sql: ${total_gross_revenue} - ${inventory_items.total_cost};;
    drill_fields: [detail*]
  }

  measure: average_gross_margin_amount {
    description: "Average difference between the total revenue from completed sales and the cost of the goods that were sold"
    type: number
    value_format_name: usd_0
    sql: 1.0 * ${total_gross_margin_amount} / NULLING(${count},0);;
    drill_fields: [detail*]
  }

  measure: gross_margin_percentage {
    description: "Total Gross Margin Amount / Total Gross Revenue"
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${total_gross_margin_amount}/NULLIF (${total_gross_revenue},0) ;;
    drill_fields: [detail*]
  }

  measure: number_of_items_returned {
    description: "Number of items that were returned by dissatisfied customers"
    type: count
    filters: [status: "Returned"]
    drill_fields: [detail*]
  }

  measure: item_returned_rate {
    description: "Number of Items Returned / total number of items sold"
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${number_of_items_returned} / NULLIF(${count} ,0) ;;
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name,
      orders.order_id
    ]
  }
}
