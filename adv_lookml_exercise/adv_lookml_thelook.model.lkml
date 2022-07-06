connection: "looker-private-demo"
include: "/adv_lookml_exercise/*.view.lkml"
include: "/adv_lookml_exercise/*.dashboard.lookml"
include: "/adv_lookml_exercise/customer_behavior_dashboard.dashboard.lookml"


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

  join: order_facts {
    type: left_outer
    relationship: one_to_one
    view_label: "Order Items"
    sql_on: ${order_items.order_id} = ${order_facts.order_id} ;;
  }

  join: user_order_facts {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${user_order_facts.user_id}  ;;
  }

  join: repeated_order_facts {
    relationship: many_to_one
    type: full_outer
    sql_on: ${order_items.order_id} = ${repeated_order_facts.order_id} ;;
  }

}
