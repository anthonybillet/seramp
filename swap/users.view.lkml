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
    sql: ${TABLE}.ID;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.AGE;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.GENDER;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: distance_from_distribution_center {
    type: distance
    start_location_field: distribution_centers.location
    end_location_field: location
    units: miles
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.TRAFFIC_SOURCE;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.ZIP;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, order_items.count]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_age {
    type: sum
    hidden: yes
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    hidden: yes
    sql: ${age} ;;
  }

  measure: total_latitude {
    type: sum
    hidden: yes
    sql: ${latitude} ;;
  }

  measure: average_latitude {
    type: average
    hidden: yes
    sql: ${latitude} ;;
  }

  measure: total_longitude {
    type: sum
    hidden: yes
    sql: ${longitude} ;;
  }

  measure: average_longitude {
    type: average
    hidden: yes
    sql: ${longitude} ;;
  }
}
