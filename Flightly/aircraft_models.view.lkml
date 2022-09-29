# The name of this view in Looker is "Aircraft Models"
view: aircraft_models {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.flightstats.aircraft_models`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Aircraft Category ID" in Explore.

  dimension: aircraft_category_id {
    type: number
    sql: ${TABLE}.aircraft_category_id ;;
  }

  dimension: aircraft_engine_type_id {
    type: number
    sql: ${TABLE}.aircraft_engine_type_id ;;
  }

  dimension: aircraft_model_code {
    type: string
    sql: ${TABLE}.aircraft_model_code ;;
  }

  dimension: aircraft_type_id {
    type: number
    sql: ${TABLE}.aircraft_type_id ;;
  }

  dimension: amateur {
    type: number
    sql: ${TABLE}.amateur ;;
  }

  dimension: engines {
    type: number
    sql: ${TABLE}.engines ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: seats {
    type: number
    sql: ${TABLE}.seats ;;
  }

  dimension: speed {
    type: number
    sql: ${TABLE}.speed ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_amateur {
    type: sum
    hidden: yes
    sql: ${amateur} ;;
  }

  measure: average_amateur {
    type: average
    hidden: yes
    sql: ${amateur} ;;
  }

  measure: total_engines {
    type: sum
    hidden: yes
    sql: ${engines} ;;
  }

  measure: average_engines {
    type: average
    hidden: yes
    sql: ${engines} ;;
  }

  measure: total_seats {
    type: sum
    hidden: yes
    sql: ${seats} ;;
  }

  measure: average_seats {
    type: average
    hidden: yes
    sql: ${seats} ;;
  }

  measure: total_speed {
    type: sum
    hidden: yes
    sql: ${speed} ;;
  }

  measure: average_speed {
    type: average
    hidden: yes
    sql: ${speed} ;;
  }

  measure: total_weight {
    type: sum
    hidden: yes
    sql: ${weight} ;;
  }

  measure: average_weight {
    type: average
    hidden: yes
    sql: ${weight} ;;
  }
}
