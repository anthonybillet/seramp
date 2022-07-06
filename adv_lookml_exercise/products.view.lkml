# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.thelook.products`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  filter: brand_comparison_filter {
    view_label: "Product Comparsion"
    suggest_dimension: brand
  }

  filter: category_comparison_filter {
    view_label: "Product Comparsion"
    suggest_dimension: category
  }

  dimension: brand_comparison {
    view_label: "Product Comparsion"
    description: "Compare a selected brand vs. all other brands"
    sql: CASE
      WHEN  {% condition brand_comparison_filter %} rtrim(ltrim(brand)) {% endcondition %}
      THEN concat('(1) ',${brand})
      ELSE '(2) Other Brands'
      END
       ;;
  }

  dimension: category_comparison {
    view_label: "Product Comparsion"
    description: "Compare a selected category vs. all other categories"
    sql: CASE
      WHEN  {% condition category_comparison_filter %} rtrim(ltrim(category)) {% endcondition %}
      THEN concat('(1) ',${category})
      ELSE '(2) Other Categories'
      END
       ;;
  }

  dimension: similar_categories_brands_comparison {
    view_label: "Product Comparsion"
    description: "Compare a selected brand vs. all other brands with similar categories"
    sql: CASE WHEN ${category} in (SELECT distinct(category) FROM thelook.products WHERE {% condition brand_comparison_filter %} rtrim(ltrim(brand)) {% endcondition %})
        THEN concat('(1) ',${brand})
        ELSE '(2) Not Similar Brands'
        END
        ;;
    }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    drill_fields: [detail*]

  link: {
    label: "{{value}} Analytics Dashboard"
    url: "/dashboards-next/adv_lookml_thelook::brand_dashboard?Brand={{ value | encode_uri }}"
    icon_url: "https://www.seekpng.com/png/full/138-1386046_google-analytics-integration-analytics-icon-blue-png.png"
  }
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_cost {
    type: sum
    hidden: yes
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    hidden: yes
    sql: ${cost} ;;
  }

  measure: total_retail_price {
    type: sum
    hidden: yes
    sql: ${retail_price} ;;
  }

  measure: average_retail_price {
    type: average
    hidden: yes
    sql: ${retail_price} ;;
  }

  set: detail {
    fields: [name
      , category
      , cost
      , order_items.order_item_count
      , inventory_items.count
      , order_items.total_sales
      , order_items.total_gross_revenue
    ]
  }
}
