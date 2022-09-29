# The name of this view in Looker is "Rental"
view: rental {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.video_store.rental`
    ;;
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: rental_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.rental_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer ID" in Explore.

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: inventory_id {
    type: number
    sql: ${TABLE}.inventory_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_update {
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
    sql: ${TABLE}.last_update ;;
  }

  dimension_group: rental {
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
    sql: ${TABLE}.rental_date ;;
  }

  dimension_group: return {
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
    sql: ${TABLE}.return_date ;;
  }

  dimension: is_returned {
    type: string
    case: {
      when: {
        sql: ${return_date} IS NOT NULL ;;
        label: "Returned"
      }
      else: "With Customer"
    }
  }

  dimension_group: rental_length {
    type: duration
    sql_start: ${rental_raw} ;;
    sql_end: COALESCE(${return_raw}, CURRENT_TIMESTAMP()) ;;
  }

  dimension: is_late {
    type: string
    case: {
      when: {
        sql: ${days_rental_length} > 7 ;;
        label: "Late"
      }
      else: "On Time"
    }
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.
  drill_fields: [rental_id, customer.last_name, customer.first_name, customer.email]

  measure: count {
    label: "# of Rentals"
    type: count
  }

  measure: count_late_rentals {
    label: "# of Late Rentals"
    type: count
    filters: [is_late: "Late"]
  }

  measure: percent_late_rentals {
    label: "% Late Rentals"
    type: number
    value_format_name: percent_2
    sql: 1.0* ${count_late_rentals} / NULLIF(${count},0) ;;
  }
}

# These sum and average measures are hidden by default.
# If you want them to show up in your explore, remove hidden: yes.
