# If necessary, uncomment the line below to include explore_source.
# include: "ab_swap.model.lkml"

view: user_facts {
  derived_table: {
    explore_source: order_items {
      column: id { field: users.id }
      column: first_order_time {}
    }
  }
  dimension: id {
    type: number
  }
  dimension_group: first_order_time {
    type: time
  }
}
