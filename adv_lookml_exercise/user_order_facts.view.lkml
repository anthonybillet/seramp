view: user_order_facts {
  derived_table: {
    sql: select users.id  AS user_id
        , COUNT(DISTINCT order_id ) AS lifetime_order_count
        , SUM(CASE WHEN (status  NOT IN ('Cancelled', 'Returned') ) THEN sale_price ELSE NULL END) AS lifetime_gross_revenue
        , CAST(MIN(order_items.created_at)  AS TIMESTAMP) AS first_order
        , CAST(MAX(order_items.created_at)  AS TIMESTAMP)  AS latest_order
      FROM thelook.users AS users
      LEFT JOIN thelook.order_items  AS order_items ON  users.id= order_items.user_id
      WHERE {% condition age_filter %} users.age {% endcondition %}
      GROUP BY 1
      ORDER BY 2
       ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_total_order_count {
    type: number
    sql: ${TABLE}.lifetime_order_count ;;
  }

  dimension: lifetime_orders_tiers{
    style: integer
    type: tier
    tiers: [1, 2, 3, 6, 10]
    sql: ${lifetime_total_order_count} ;;
  }

  dimension: lifetime_total_gross_revenue {
    type: number
    value_format_name: usd
    sql: ${TABLE}.lifetime_gross_revenue ;;
  }

  dimension: lifetime_revenue_tiers {
    type: tier
    style: integer
    tiers: [5, 20, 50, 100, 500, 1000]
    value_format_name: usd_0
    sql: ${lifetime_total_gross_revenue} ;;
  }

  dimension_group: first_order {
    type: time
    timeframes: [raw, date, week, week_of_year, month, year]
    sql: ${TABLE}.first_order ;;
  }

  dimension_group: latest_order {
    type: time
    timeframes: [raw, date, week, week_of_year, month, year]
    sql: ${TABLE}.latest_order ;;
  }

  dimension_group: since_lastest_order {
    description: "The number of days since a customer placed his or her most recent order on the website"
    type: duration
    intervals: [day]
    sql_start: ${latest_order_date};;
    sql_end: CURRENT_DATE ;;
  }

  dimension: is_active {
    description: "Identifies whether a customer is active or not (has purchased from the website within the last 90 days)"
    type: yesno
    sql: ${days_since_lastest_order} <= 90 ;;
  }

  dimension: is_repeated_customer {
    description: "Identifies whether a customer was a repeat customer or not"
    type: yesno
    sql: ${lifetime_total_order_count} > 1 ;;
  }

  dimension: is_paying_customer {
    description: "Identifies whether a customer made 1+ orders "
    type: yesno
    sql: ${lifetime_total_order_count} > 0 ;;
  }


  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  measure: average_lifetme_orders {
    description: "The average number of orders that a customer places over the course of their lifetime as a customer."
    type: average
    value_format_name: decimal_1
    sql: ${lifetime_total_order_count};;
  }

  measure: average_lifetime_revenue {
    description: "The average amount of revenue that a customer brings in over the course of their lifetime as a customer."
    type: average
    value_format_name: usd_0
    sql: ${lifetime_total_gross_revenue} ;;
  }

  measure: average_days_since_last_order {
    description: "The average number of days since customers have placed their most recent orders on the website"
    type: average
    value_format_name: decimal_1
    sql: ${days_since_lastest_order} ;;
  }

  measure: repeat_customers {
    description: "repeat customers is true"
    type: count
    filters: [is_repeated_customer: "Yes"]
  }

  measure: paying_customers {
    description: "paying customer is true"
    type: count
    filters: [is_paying_customer: "Yes"]
  }

  measure: active_users_count{
    description: "is active = true"
    type: count
    filters: [is_active: "Yes"]
  }

  measure: percentage_of_active_users {
    description: "active users / total users"
    type: number
    sql: 1.0 * ${active_users_count} / NULLIF(${count},0);;
    value_format_name: percent_0
  }

  measure: repeat_purchase_rate {
    description: "total customers who have made 2+ orders / total paying customers who made 1+ orders "
    type: number
    sql:  1.0 * ${repeat_customers} / NULLIF ( ${paying_customers},0) ;;
    value_format_name: percent_2
  }

  measure: total_lifetime_orders {
    type: sum
    sql: ${lifetime_total_order_count} ;;
  }

  measure: total_lifetime_revenue {
    type: sum
    sql: ${lifetime_total_gross_revenue} ;;
  }

  ### Key use case 4 ###

  parameter: metric_selector  {
    view_label: "Z) Key Use Case 4"
    type: string
    allowed_value: {
      value: "Average Lifetime Orders"
    }
    allowed_value: {
      value: "Total Lifetime Orders"
    }
    allowed_value: {
      value: "Total Lifetime Revenue"
    }
    default_value: "Total Lifetime Orders"
  }
  # Dynamic Measure 1 and 2 are two ways of doing the same thing""
  measure: dynamic_measure {
    view_label: "Z) Key Use Case 4"
    label_from_parameter: metric_selector
    value_format_name: decimal_0
    type: number
    sql: {% if user_order_facts.metric_selector._parameter_value == "'Average Lifetime Orders'" %}
            ${average_lifetme_orders}
         {% elsif user_order_facts.metric_selector._parameter_value == "'Total Lifetime Revenue'" %}
            ${total_lifetime_revenue}
         {% elsif user_order_facts.metric_selector._parameter_value == "'Total Lifetime Orders'" %}
            ${total_lifetime_orders}
         {% else %}
            ${total_lifetime_orders}
         {% endif %}
         ;;
  }

  measure: dynamic_measure_2 {
    view_label: "Z) Key Use Case 4"
    label_from_parameter: metric_selector
    value_format_name: decimal_0
    type: number
    sql: CASE
          WHEN {% parameter metric_selector %} = 'Average Lifetime Orders' THEN ${average_lifetme_orders}
          WHEN {% parameter metric_selector %} = 'Total Lifetime Revenue' THEN  ${total_lifetime_revenue}
          WHEN {% parameter metric_selector %} = 'Total Lifetime Orders' THEN   ${total_lifetime_orders}
          ELSE ${total_lifetime_orders}
         END
         ;;
  }

  filter: age_filter {
    view_label: "Z) Key Use Case 4"
    type: number
    sql: {% condition age_filter %} ${users.age} {% endcondition %}  ;;
  }


  set: detail {
    fields: [user_id, lifetime_total_gross_revenue, lifetime_total_order_count, first_order_date, latest_order_date]
  }
}
