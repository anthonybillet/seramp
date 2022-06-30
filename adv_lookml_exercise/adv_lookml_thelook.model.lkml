connection: "looker-private-demo"
include: "/adv_lookml_exercise/*.view.lkml"
include: "/adv_lookml_exercise/*.dashboard.lookml"


explore: order_items {

  join: inventory_items {
    type: full_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} =  ${users.id}  ;;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
  }

  join: distribution_centers {
    type: left_outer
    relationship: many_to_one
    sql_on:  ${inventory_items.product_distribution_center_id} = ${distribution_centers.id};;
  }

}
