connection: "looker-private-demo"
label: "Z) Admin"
include: "/basic_sql_test/*.view.lkml"
# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: order_items {
  label: "Basic SQL: Ecomm"
  view_label: "Order Items"
  view_name: order_items
  fields: [orders*,inventory_items*, users*, products*, order_items.id,order_items.order_id,order_items.sale_price,order_items.inventory_item_id,order_items.returned_at]

  join: orders {
    view_label: "Orders"
    fields: [orders.order_id, orders.created_at,orders.user_id,orders.status]
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }

  join: inventory_items {
    view_label: "Inventory Items"
    fields: [inventory_items.id,inventory_items.product_id,inventory_items.created_at,inventory_items.sold_at,inventory_items.cost]
    type: full_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }

  join: users {
    view_label: "Users"
    fields: [users.id,users.email,users.first_name,users.last_name,users.gender, users.created_at,users.zip,users.country,users.state,users.city,users.age]
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users.id} ;;
  }

  join: products {
    view_label: "Products"
    fields: [products.id, products.category,products.name, products.retail_price, products.department, products.sku, products.brand]
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }

}

# }
