connection: "looker-private-demo"
label: "Z) Admin"
include: "/swap/*.view.lkml"

explore: order_items {

  label: "AB (1) Orders, Items and Users"
  view_name: order_items

  always_filter: {
    filters: [order_items.created_date: "Last 30 days"]
  }

  access_filter: {
    field: products.brand
    user_attribute: brand
  }

  join: inventory_items {
    view_label: "Inventory Items"
    #Left Join only brings in items that have been sold as order_item
    type: full_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }
  join: users {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }
  join: products {
    view_label: "Products"
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }
  join: distribution_centers {
    view_label: "Distribution Center"
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    view_label: "Users"
    type: left_outer
    relationship: one_to_one
    sql_on: ${user_facts.id} = ${users.id} ;;
  }
}
