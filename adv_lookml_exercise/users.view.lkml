# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.thelook.users`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tiers {
    type: tier
    style: integer
    tiers: [15, 26, 36, 51, 66]
    sql: ${age} ;;
    value_format: "#,##0"
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: is_new {
    description: "user created in the last 90 days"
    type: yesno
    sql: date_diff( CURRENT_DATE(), ${created_date}, day) < 91 ;;
  }

  #DATE_DIFF(DATE '2010-07-07', DATE '2008-12-25', DAY) AS days_diff;

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    group_label: "Location Details"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }


  dimension: approx_location {
    group_label: "Location Details"
    type: location
    sql_latitude: round(${latitude},1) ;;
    sql_longitude: round(${longitude},1) ;;
    link: {
      label: "Google Directions from {{ distribution_centers.name._value }}"
      url: "{% if distribution_centers.location._in_query %}https://www.google.com/maps/dir/'{{ distribution_centers.latitude._value }},{{ distribution_centers.longitude._value }}'/'{{ approx_latitude._value }},{{ approx_longitude._value }}'{% endif %}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.google.com"
    }
    drill_fields: [location, city, country, products.category]
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: months_since_signup {
    view_label: "Order Items"
    type: number
    sql: date_diff(date( ${order_items.created_raw}), date(${created_raw}), month);;
  }

  dimension: days_since_signup {
    view_label: "Order Items"
    type: number
    sql: date_diff(date( ${order_items.created_raw}), date(${created_raw}), day);;
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

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  measure: total_latitude {
    type: sum
    sql: ${latitude} ;;
  }

  measure: average_latitude {
    type: average
    sql: ${latitude} ;;
  }

  measure: total_longitude {
    type: sum
    sql: ${longitude} ;;
  }

  measure: average_longitude {
    type: average
    sql: ${longitude} ;;
  }

  measure: number_of_users_returning_items {
    description: "Number of users who have returned an item at some point"
    type: count
    filters: [order_items.status: "Returned"]
  }

  measure: percentage_of_users_with_returns {
    description: "Number of Customer Returning Items / total number of customers"
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${number_of_users_returning_items} / NULLIF( ${count}, 0);;
  }

  measure: average_spend_per_customer {
    description: "Total Sale Price / total number of customers"
    type: number
    value_format_name: usd
    sql: 2.0 * ${order_items.total_sale_price}/ NULLIF(${count},0) ;;
  }

  measure: average_number_of_days_since_signup {
    view_label: "Order Items"
    type: average
    sql: ${days_since_signup} ;;
  }

  measure: average_number_of_months_since_signup {
    view_label: "Order Items"
    type: average
    sql: ${months_since_signup} ;;
  }




  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      order_items.count,
      events.count,
      orders.count
    ]
  }
}
