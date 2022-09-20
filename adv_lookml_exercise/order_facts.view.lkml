include: "/adv_lookml_exercise/*.model.lkml"

#include: "/views/**/*.view"

  view: order_facts {
    derived_table: {
      explore_source: order_items {
        column: order_id {}
        column: created_time {}
        column: order_item_count {field: order_items.count}
        column: total_sale_price {}
        column: order_cost { field: inventory_items.total_cost }
        column: id { field: users.id }
        column: created_time { field: users.created_time }
        derived_column: order_sequence_number { sql: RANK() OVER(PARTITION BY user_id order by created_at)  ;; }
      }
    }

    dimension: order_id {
      type: number
      hidden: yes
    }

    dimension: created_time {
      type: date_time
      hidden: yes
    }

    dimension: order_cost {
      type: number
      hidden: yes
    }

    dimension: order_sequence_number {
      type: number
      sql:  ${TABLE}.order_sequence_number;;
    }

    dimension: is_first_order {
      type: yesno
      sql: ${order_sequence_number} = 1 ;;
    }

    dimension: order_item_count {
      type: number
    }

    dimension: total_sale_price {
      description: "Total sales from items sold"
      value_format: "$#,##0.00"
      type: number
    }

    dimension: id {
      value_format: "0"
      type: number
      hidden: yes
    }

    dimension: users_created_time {
      label: "User Created "
      type: date_time
      hidden: yes
    }
  }
