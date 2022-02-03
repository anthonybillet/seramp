connection: "looker-private-demo"

include: "/Flightly/*.view.lkml"


explore: flights {

  sql_always_where: ${arr_year} BETWEEN 2000 and 2001 ;;

  join: origin_airport {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${origin_airport.code} = ${flights.origin} ;;
  }
  join: destination_airport {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${destination_airport.code} = ${flights.destination} ;;
  }
}
