- dashboard: brand_dashboard
  title: Brand Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Sales Performance Trends
    name: Sales Performance Trends
    model: adv_lookml_thelook
    explore: order_items
    type: looker_area
    fields: [order_items.total_sale_price_selected_brand, order_items.total_sale_price_similar_brand,
      order_items.total_sale_price_other_brands, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 months
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price_selected_brand,
            id: order_items.total_sale_price_selected_brand, name: Total Sales - Selected
              Brand}, {axisId: order_items.total_sale_price_similar_brand, id: order_items.total_sale_price_similar_brand,
            name: Total Sales - Similar Brand}, {axisId: order_items.total_sale_price_other_brands,
            id: order_items.total_sale_price_other_brands, name: Total Sales - Other
              Brands}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      order_items.total_sale_price_selected_brand:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Similar Brands
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Brand: products.brand_comparison_filter
      Order Date: order_items.created_date
    row: 4
    col: 12
    width: 12
    height: 9
  - title: Similar Brands Performance
    name: Similar Brands Performance
    model: adv_lookml_thelook
    explore: order_items
    type: looker_grid
    fields: [products.brand, order_items.total_gross_revenue, order_items.average_sale_price,
      order_items.gross_margin_percentage, order_items.item_returned_rate, user_order_facts.active_users_count,
      user_order_facts.repeat_purchase_rate, products.similar_categories_brands_comparison,
      user_order_facts.average_lifetime_revenue, user_order_facts.average_lifetme_orders]
    filters:
      order_items.created_month: 12 months
      products.similar_categories_brands_comparison: "-%(2)%"
    sorts: [order_items.total_gross_revenue desc]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      order_items.total_sale_price_selected_brand:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price_selected_brand,
            id: order_items.total_sale_price_selected_brand, name: Total Sales - Selected
              Brand}, {axisId: order_items.total_sale_price_similar_brand, id: order_items.total_sale_price_similar_brand,
            name: Total Sales - Similar Brand}, {axisId: order_items.total_sale_price_other_brands,
            id: order_items.total_sale_price_other_brands, name: Total Sales - Other
              Brands}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Similar Brands
    defaults_version: 1
    hidden_fields: [products.similar_categories_brands_comparison]
    listen:
      Brand: products.brand_comparison_filter
      Order Date: order_items.created_date
    row: 13
    col: 0
    width: 24
    height: 9
  - title: Total Orders
    name: Total Orders
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_orders_selected_brand, order_items.count]
    sorts: [order_items.total_orders_selected_brand desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Orders
    comparison_label: vs. All Orders
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Brand: products.brand_comparison_filter
      Order Date: order_items.created_date
    row: 0
    col: 0
    width: 8
    height: 4
  - title: Sales
    name: Sales
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price_selected_brand, order_items.total_sale_price]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Sales
    comparison_label: vs. Total Sales
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Brand: products.brand_comparison_filter
      Order Date: order_items.created_date
    row: 0
    col: 8
    width: 8
    height: 4
  - title: Customers
    name: Customers
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_users_selected_brand, users.count]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Customers
    comparison_label: vs. All Customers
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Brand: products.brand_comparison_filter
      Order Date: order_items.created_date
    row: 0
    col: 16
    width: 8
    height: 4
  - title: Sales Performance by Categories
    name: Sales Performance by Categories
    model: adv_lookml_thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price_selected_brand, order_items.total_sale_price_similar_brand,
      order_items.total_sale_price_other_brands, products.category]
    filters:
      order_items.created_month: 12 months
      order_items.total_sale_price_selected_brand: ">0"
    sorts: [order_items.total_sale_price_selected_brand desc]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price_selected_brand,
            id: order_items.total_sale_price_selected_brand, name: Total Sales - Selected
              Brand}, {axisId: order_items.total_sale_price_similar_brand, id: order_items.total_sale_price_similar_brand,
            name: Total Sales - Similar Brand}, {axisId: order_items.total_sale_price_other_brands,
            id: order_items.total_sale_price_other_brands, name: Total Sales - Other
              Brands}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    reference_lines: []
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      order_items.total_sale_price_selected_brand:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Similar Brands
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Brand: products.brand_comparison_filter
      Order Date: order_items.created_date
    row: 4
    col: 0
    width: 12
    height: 9
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: adv_lookml_thelook
    explore: order_items
    listens_to_filters: []
    field: products.brand_comparison_filter
  - name: Order Date
    title: Order Date
    type: field_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    model: adv_lookml_thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
