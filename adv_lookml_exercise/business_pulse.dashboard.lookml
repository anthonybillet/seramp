- dashboard: business_pulse
  title: Business Pulse
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: lIWJx3Elv5jOiYvbekt1I1
  elements:
  - title: ''
    name: ''
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_revenue, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 2 days ago for 2 days
    sorts: [order_items.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "${order_items.total_gross_revenue}\
          \ / offset(${order_items.total_gross_revenue}, 1) -1", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Yesterday's Total Revenue
    value_format: ''
    comparison_label: vs. 2 days ago
    conditional_formatting: [{type: greater than, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [order_items.created_date]
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 1
    col: 0
    width: 5
    height: 4
  - title: ''
    name: " (2)"
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [order_items.gross_margin_percentage, order_items.previous_period]
    filters:
      order_items.previous_period_filter: 30 days
    sorts: [order_items.gross_margin_percentage desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "${order_items.gross_margin_percentage}\
          \ / offset(${order_items.gross_margin_percentage}, 1) -1", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Gross Margin % Over Past 30 Days
    comparison_label: vs. Previous Period
    defaults_version: 1
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 1
    col: 5
    width: 7
    height: 4
  - title: ''
    name: " (3)"
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [users.average_spend_per_customer, order_items.previous_period]
    filters:
      order_items.previous_period_filter: 30 days
    sorts: [order_items.previous_period desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "${users.average_spend_per_customer}\
          \ / offset(${users.average_spend_per_customer}, 1) -1", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Spend per Customer Over Past 30 Days
    comparison_label: vs. Previous Period
    defaults_version: 1
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 1
    col: 16
    width: 8
    height: 4
  - title: Yearly Trends
    name: Yearly Trends
    model: adv_lookml_thelook
    explore: order_items
    type: looker_line
    fields: [order_items.total_gross_revenue, order_items.created_year, order_items.created_month_num]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_year, order_items.created_month_num]
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year, order_items.total_gross_revenue desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_gross_revenue,
            id: 2020 - order_items.total_gross_revenue, name: '2020'}, {axisId: order_items.total_gross_revenue,
            id: 2019 - order_items.total_gross_revenue, name: '2019'}, {axisId: order_items.total_gross_revenue,
            id: 2018 - order_items.total_gross_revenue, name: '2018'}, {axisId: order_items.total_gross_revenue,
            id: 2017 - order_items.total_gross_revenue, name: '2017'}], showLabels: true,
        showValues: true, valueFormat: '0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Month of the Year
    defaults_version: 1
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 5
    col: 0
    width: 12
    height: 9
  - title: Monthly Revenue and Profit Last 12 Months
    name: Monthly Revenue and Profit Last 12 Months
    model: adv_lookml_thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_revenue, order_items.total_gross_margin_amount,
      order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_date: 12 months
    sorts: [order_items.created_month]
    limit: 500
    query_timezone: America/Los_Angeles
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_gross_revenue,
            id: order_items.total_gross_revenue, name: Total Gross Revenue}, {axisId: order_items.total_gross_margin_amount,
            id: order_items.total_gross_margin_amount, name: Total Gross Margin Amount}],
        showLabels: true, showValues: true, valueFormat: '0, "K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: '[>=1000000]$0.00,,"M";[>=1000]$0,"K";$0'
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 5
    col: 12
    width: 12
    height: 9
  - title: 'Daily User Additions (This Month vs Last Month) '
    name: 'Daily User Additions (This Month vs Last Month) '
    model: adv_lookml_thelook
    explore: order_items
    type: looker_line
    fields: [users.count, users.created_day_of_month, users.created_month]
    pivots: [users.created_month]
    fill_fields: [users.created_day_of_month, users.created_month]
    filters:
      users.created_date: before 0 days ago
      users.created_month: 2 months
    sorts: [users.created_month desc, users.created_day_of_month]
    limit: 500
    column_limit: 50
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: users.count, id: 2020-04
              - users.count, name: 2020-04}, {axisId: users.count, id: 2020-05 - users.count,
            name: 2020-05}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Signup Day of Month
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      2022-11 - users.count: "#c4c4c4"
      2022-12 - users.count: "#1A73E8"
    series_labels:
      2022-12 - users.count: This Month
      2022-11 - users.count: Last Month
    label_color: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 14
    col: 0
    width: 12
    height: 9
  - title: Gross Revenue Share from Age and Gender Demographics
    name: Gross Revenue Share from Age and Gender Demographics
    model: adv_lookml_thelook
    explore: order_items
    type: looker_donut_multiples
    fields: [users.age_tiers, order_items.total_gross_revenue, users.gender]
    pivots: [users.age_tiers]
    fill_fields: [users.age_tiers]
    filters:
      users.gender: "-NULL"
    sorts: [users.age_tiers, users.gender]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 25
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_colors: {}
    series_labels:
      Below 15 - 0 - order_items.total_gross_revenue: 'Age: Below 15'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 66 or Above - 5 - order_items.total_gross_revenue,
            id: 66 or Above - 5 - order_items.total_gross_revenue, name: 66 or Above},
          {axisId: 51 to 65 - 4 - order_items.total_gross_revenue, id: 51 to 65 -
              4 - order_items.total_gross_revenue, name: 51 to 65}, {axisId: 36 to
              50 - 3 - order_items.total_gross_revenue, id: 36 to 50 - 3 - order_items.total_gross_revenue,
            name: 36 to 50}, {axisId: 26 to 35 - 2 - order_items.total_gross_revenue,
            id: 26 to 35 - 2 - order_items.total_gross_revenue, name: 26 to 35}, {
            axisId: 15 to 25 - 1 - order_items.total_gross_revenue, id: 15 to 25 -
              1 - order_items.total_gross_revenue, name: 15 to 25}, {axisId: Below
              15 - 0 - order_items.total_gross_revenue, id: Below 15 - 0 - order_items.total_gross_revenue,
            name: 'Age: Below 15'}], showLabels: true, showValues: true, valueFormat: '[>=1000000]$0,,"M";[>=1000]$0,"K";$0',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    label_value_format: '[>=1000000]$0.00,,"M";[>=1000]$0,"K";$0'
    series_types: {}
    point_style: circle
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: ''
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      order_items.total_gross_revenue:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hide_totals: false
    hide_row_totals: false
    interpolation: linear
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 14
    col: 12
    width: 12
    height: 9
  - title: New Customer Total Gross Revenue
    name: New Customer Total Gross Revenue
    model: adv_lookml_thelook
    explore: order_items
    type: looker_area
    fields: [users.is_new, order_items.total_gross_revenue, order_items.created_week]
    pivots: [users.is_new]
    fill_fields: [users.is_new, order_items.created_week]
    filters:
      order_items.created_date: 90 days ago for 90 days
    sorts: [users.is_new, order_items.created_week desc]
    limit: 500
    column_limit: 50
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: false
    series_types: {}
    series_colors: {}
    series_labels:
      No - order_items.total_gross_revenue: Existing Customers
      Yes - order_items.total_gross_revenue: New Customers
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 23
    col: 0
    width: 12
    height: 7
  - title: Revenue Source Comparison
    name: Revenue Source Comparison
    model: adv_lookml_thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_revenue, users.traffic_source, users.is_new]
    pivots: [users.is_new]
    fill_fields: [users.is_new]
    filters:
      order_items.created_date: 90 days ago for 90 days
    sorts: [order_items.total_gross_revenue desc 0, users.is_new]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_gross_revenue,
            id: No - order_items.total_gross_revenue, name: Existing Customers}, {
            axisId: order_items.total_gross_revenue, id: Yes - order_items.total_gross_revenue,
            name: New Customers}], showLabels: true, showValues: true, valueFormat: '0,
          "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      Yes - order_items.total_gross_revenue: New Customers
      No - order_items.total_gross_revenue: Existing Customers
    show_dropoff: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 23
    col: 12
    width: 12
    height: 7
  - title: Profitability by Location
    name: Profitability by Location
    model: adv_lookml_thelook
    explore: order_items
    type: looker_map
    fields: [users.approx_location, order_items.total_gross_margin_amount, users.city,
      users.country]
    sorts: [order_items.total_gross_margin_amount desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: metric
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map_latitude: 39.00104307544137
    map_longitude: -95.4210662841797
    map_zoom: 4
    map_marker_radius_min: 0
    map_marker_radius_max: 50
    map_marker_color: []
    map_value_colors: [orange]
    map_value_scale_clamp_min: 0
    map_value_scale_clamp_max: 45000
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [users.city, users.country]
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 30
    col: 0
    width: 12
    height: 9
  - title: New Users
    name: New Users
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [users.created_date, users.count]
    fill_fields: [users.created_date]
    filters:
      users.created_date: 2 days ago for 2 days
    sorts: [users.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "${users.count}\
          \ / offset(${users.count}, 1)-1", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Yesterday's New Users
    comparison_label: vs. 2 days ago
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 1
    col: 12
    width: 4
    height: 4
  - title: Top 10 Brands by Gross Margin %
    name: Top 10 Brands by Gross Margin %
    model: adv_lookml_thelook
    explore: order_items
    type: looker_grid
    fields: [products.brand, order_items.gross_margin_percentage, order_items.total_gross_revenue]
    filters:
      order_items.gross_margin_percentage: NOT NULL
      order_items.created_date: 12 months
    sorts: [of_total_gross_revenue desc]
    limit: 5000
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_total_gross_revenue, label: "% of total\
          \ gross revenue", expression: "${order_items.total_gross_revenue} / sum(${order_items.total_gross_revenue})",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    series_types: {}
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
    hidden_fields:
    hidden_points_if_no: []
    series_labels: {}
    lowColor: "#F36254"
    midColor: "#FCF758"
    highColor: "#4FBC89"
    listen:
      City: users.city
      Traffic Source: users.traffic_source
    row: 30
    col: 12
    width: 12
    height: 9
  - name: Year over year via dynamic merge
    title: Year over year via dynamic merge
    merged_queries:
    - model: adv_lookml_thelook
      explore: order_items
      type: table
      fields: [order_items.created_month, order_items.created_month_name, order_items.total_gross_revenue]
      filters:
        order_items.created_month: before 11 months ago,before 25 months ago
      sorts: [order_items.created_month desc]
      limit: 12
      column_limit: 50
      query_timezone: user_timezone
      join_fields: []
    - model: adv_lookml_thelook
      explore: order_items
      type: table
      fields: [order_items.created_month_name, order_items.created_month, order_items.total_gross_revenue]
      filters:
        order_items.created_month: 13 months
      sorts: [order_items.created_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: order_items.created_month_name
        source_field_name: order_items.created_month_name
    hidden_fields: [order_items.created_month, q1_order_items.created_month]
    type: looker_line
    series_types: {}
    column_limit: 50
    row: 39
    col: 0
    width: 17
    height: 8
  - name: 'Top Line Key Performance Indicators '
    type: text
    title_text: 'Top Line Key Performance Indicators '
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 1
  filters:
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: adv_lookml_thelook
    explore: order_items
    listens_to_filters: []
    field: users.city
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: adv_lookml_thelook
    explore: order_items
    listens_to_filters: []
    field: users.traffic_source
