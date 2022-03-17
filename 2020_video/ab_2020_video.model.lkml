connection: "looker-private-demo"

include: "/2020_video/*.view.lkml"

explore: rental {
  join: inventory {
    relationship: many_to_one
    sql_on: ${rental.inventory_id}=${inventory.inventory_id} ;;
  }
  join: film {
    relationship: many_to_one
    sql_on: ${inventory.film_id}=${film.film_id} ;;
  }
  join: film_category {
    view_label: "Film"
    relationship: one_to_one
    sql_on: ${film.film_id}=${film_category.film_id} ;;
  }
  join: category {
    view_label: "Film"
    relationship: many_to_one
    sql_on: ${film_category.category_id}=${category.category_id} ;;
  }
  join: customer {
    relationship: many_to_one
    sql_on: ${rental.customer_id}=${customer.customer_id} ;;
  }
  join: staff_list {
    relationship: many_to_one
    sql_on: ${rental.staff_id}=${staff_list.sid} ;;
  }
  join: payment {
    relationship: one_to_one
    type: left_outer
    sql_on: ${rental.rental_id} = ${payment.rental_id} ;;
  }
}
