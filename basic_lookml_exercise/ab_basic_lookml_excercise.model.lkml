connection: "looker-private-demo"

include: "/basic_lookml_exercise/*.view.lkml"

#4 hr cache definiton
datagroup: 4_hr_cache {
  max_cache_age: "4 hours"
}


#An Explore that is cached for 4 hours
#An Explore that uses the ‘always_filter’ parameter
explore: order_items {
  persist_with: 4_hr_cache

  #include this for the admin exercise part of exit module Advanced LookML/Admin Test
  # access_filter: {
  #   user_attribute: brand
  #   field: products.brand
  # }

  always_filter: {
    filters: [order_items.created_date: "last 30 days"]
  }
  #A join that uses the ‘view_label’ parameter
  join: inventory_items {
    view_label: "Inventory"
    type: full_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }
  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }
  join: distribution_centers {
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    relationship: many_to_one
  }
}

# An Explore that uses the ‘sql_always_where’ parameter
explore: users {
  sql_always_where: ${created_date} >= '2020-01-01' ;;
  description: "Investigate demographic counts"
}

explore: inventory_items {
  #A join that is an INNER join
  join: products {
    type: inner
    relationship: many_to_one
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }
  #A join that uses the ‘fields’ parameter
  join: distribution_centers {
    fields: [location,name,count]
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    relationship: many_to_one
  }
}


# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
