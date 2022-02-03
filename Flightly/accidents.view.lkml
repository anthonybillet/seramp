# The name of this view in Looker is "Accidents"
view: accidents {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.flightstats.accidents`
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
  # This dimension will be called "Accident Number" in Explore.

  dimension: accident_number {
    type: string
    sql: ${TABLE}.accident_number ;;
  }

  dimension: air_carrier {
    type: string
    sql: ${TABLE}.air_carrier ;;
  }

  dimension: aircraft_category {
    type: string
    sql: ${TABLE}.aircraft_category ;;
  }

  dimension: aircraft_damage {
    type: string
    sql: ${TABLE}.aircraft_damage ;;
  }

  dimension: airport_code {
    type: string
    sql: ${TABLE}.airport_code ;;
  }

  dimension: airport_name {
    type: string
    sql: ${TABLE}.airport_name ;;
  }

  dimension: amateur_built {
    type: yesno
    sql: ${TABLE}.amateur_built ;;
  }

  dimension: broad_phase_of_flight {
    type: string
    sql: ${TABLE}.broad_phase_of_flight ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: engine_type {
    type: string
    sql: ${TABLE}.engine_type ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event {
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
    sql: ${TABLE}.event_date ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: far_description {
    type: string
    sql: ${TABLE}.far_description ;;
  }

  dimension: injury_severity {
    type: string
    sql: ${TABLE}.injury_severity ;;
  }

  dimension: investigation_type {
    type: string
    sql: ${TABLE}.investigation_type ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: number_of_engines {
    type: number
    sql: ${TABLE}.number_of_engines ;;
  }

  dimension: number_of_fatalities {
    type: number
    sql: ${TABLE}.number_of_fatalities ;;
  }

  dimension: number_of_minor_injuries {
    type: number
    sql: ${TABLE}.number_of_minor_injuries ;;
  }

  dimension: number_of_serious_injuries {
    type: number
    sql: ${TABLE}.number_of_serious_injuries ;;
  }

  dimension: number_of_uninjured {
    type: number
    sql: ${TABLE}.number_of_uninjured ;;
  }

  dimension_group: publication {
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
    sql: ${TABLE}.publication_date ;;
  }

  dimension: purpose_of_flight {
    type: string
    sql: ${TABLE}.purpose_of_flight ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: report_status {
    type: string
    sql: ${TABLE}.report_status ;;
  }

  dimension: schedule {
    type: string
    sql: ${TABLE}.schedule ;;
  }

  dimension: weather_condition {
    type: string
    sql: ${TABLE}.weather_condition ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, airport_name]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

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

  measure: total_number_of_engines {
    type: sum
    hidden: yes
    sql: ${number_of_engines} ;;
  }

  measure: average_number_of_engines {
    type: average
    hidden: yes
    sql: ${number_of_engines} ;;
  }

  measure: total_number_of_fatalities {
    type: sum
    hidden: yes
    sql: ${number_of_fatalities} ;;
  }

  measure: average_number_of_fatalities {
    type: average
    hidden: yes
    sql: ${number_of_fatalities} ;;
  }

  measure: total_number_of_minor_injuries {
    type: sum
    hidden: yes
    sql: ${number_of_minor_injuries} ;;
  }

  measure: average_number_of_minor_injuries {
    type: average
    hidden: yes
    sql: ${number_of_minor_injuries} ;;
  }

  measure: total_number_of_serious_injuries {
    type: sum
    hidden: yes
    sql: ${number_of_serious_injuries} ;;
  }

  measure: average_number_of_serious_injuries {
    type: average
    hidden: yes
    sql: ${number_of_serious_injuries} ;;
  }

  measure: total_number_of_uninjured {
    type: sum
    hidden: yes
    sql: ${number_of_uninjured} ;;
  }

  measure: average_number_of_uninjured {
    type: average
    hidden: yes
    sql: ${number_of_uninjured} ;;
  }
}
