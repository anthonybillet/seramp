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

  # A dimension of type number
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  # A dimension using case
  dimension: age_group {
    type: string
    case: {
      when: {
        sql: ${age} <= 12 ;;
        label: "Child"
      }
    }
    case: {
      when: {
        sql: ${age} > 12 AND ${age} <18 ;;
        label: "Teen"
      }
    }
    case: {
      when: {
        sql: ${age} >= 18 AND ${age} < 65 ;;
        label: "Adult"
      }
    }
    case: {
      when: {
        sql: ${age} >= 65 ;;
        label: "Senior"
      }
    }
  }

  #dimension of type tier
  dimension: age_tier {
    type: tier
    tiers: [0,10,20,30,40,50,60,70]
    style: interval
    sql: ${age} ;;
  }

  #dimesnion of type yesno
  dimension: is_adult {
    type: yesno
    sql: ${age} >= 18 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    # dimension drill path
    drill_fields: [state, city]
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
    sql: ${TABLE}.created_at ;;
  }

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

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
    drill_fields: [city]
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  # dimension of type zipcode
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    label: "Users"
    type: count
    drill_fields: [detail*]
  }

  #measure of type min
  measure: min_age {
    type: min
    sql: ${age} ;;
  }

  #measure of type max
  measure: max_age {
    type: max
    sql: ${age} ;;
  }

#measure of type average
  measure: avg_age {
    type: average
    sql: ${age} ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      orders.count,
      events.count,
      order_items.count
    ]
  }
}
