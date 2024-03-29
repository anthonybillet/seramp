# The name of this view in Looker is "Regions"
view: regions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.flightstats.regions`
    ;;
  drill_fields: [region_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: region_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.region_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Region Name" in Explore.

  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }

  dimension: region_shape {
    type: string
    sql: ${TABLE}.region_shape ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [region_id, region_name]
  }
}

# These sum and average measures are hidden by default.
# If you want them to show up in your explore, remove hidden: yes.
