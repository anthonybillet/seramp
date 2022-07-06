- dashboard: customer_behavior_dashboard
  title: Customer Behavior Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Low Repeated Purchase by Brand
    name: Low Repeated Purchase by Brand
    model: adv_lookml_thelook
    explore: order_items
    type: looker_grid
    fields: [products.brand, user_order_facts.repeat_purchase_rate, order_items.total_gross_revenue,
      order_items.count]
    sorts: [user_order_facts.repeat_purchase_rate]
    limit: 500
    column_limit: 50
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
    column_order: ["$$$_row_numbers_$$$", products.brand, user_order_facts.repeat_purchase_rate,
      order_items.total_gross_revenue, order_items.count, order_items.item_returned_rate,
      order_items.number_of_items_returned]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      user_order_facts.repeat_purchase_rate:
        is_active: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
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
      Date: order_items.created_date
    row: 31
    col: 0
    width: 13
    height: 6
  - title: Category with Low Repeated Purchase Rate
    name: Category with Low Repeated Purchase Rate
    model: adv_lookml_thelook
    explore: order_items
    type: looker_grid
    fields: [user_order_facts.repeat_purchase_rate, order_items.total_gross_revenue,
      order_items.count, products.category]
    sorts: [user_order_facts.repeat_purchase_rate]
    limit: 500
    column_limit: 50
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
    column_order: [products.category, user_order_facts.repeat_purchase_rate, order_items.total_gross_revenue,
      order_items.count]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      user_order_facts.repeat_purchase_rate:
        is_active: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
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
      Date: order_items.created_date
    row: 31
    col: 13
    width: 11
    height: 6
  - name: Low Repeated Purchase Rate
    type: text
    title_text: Low Repeated Purchase Rate
    row: 29
    col: 0
    width: 24
    height: 2
  - title: "% Revenue by Cohorts"
    name: "% Revenue by Cohorts"
    model: adv_lookml_thelook
    explore: order_items
    type: looker_area
    fields: [users.months_since_signup, order_items.total_gross_revenue]
    filters: {}
    sorts: [users.months_since_signup]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: total, label: "% Total", expression: "${order_items.total_gross_revenue}\
          \ / ${order_items.total_gross_revenue:total}", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}]
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
    y_axes: [{label: "% Total  Revenue", orientation: left, series: [{axisId: total,
            id: total, name: "% Total Revenue"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      total: "% Total Revenue"
    trend_lines: [{color: "#000000", label_position: center, period: 12, regression_type: average,
        series_index: 1, show_label: true, label_type: string, label: Moving Average
          Trend Line}]
    defaults_version: 1
    hidden_fields: [order_items.total_gross_revenue]
    ordering: none
    show_null_labels: false
    note_state: expanded
    note_display: hover
    note_text: with Moving Average Trend Line
    listen:
      Date: order_items.created_date
    row: 43
    col: 0
    width: 10
    height: 10
  - title: Total Spent by Customer Cohort
    name: Total Spent by Customer Cohort
    model: adv_lookml_thelook
    explore: order_items
    type: looker_area
    fields: [users.created_month, users.months_since_signup, order_items.total_gross_revenue]
    pivots: [users.created_month]
    fill_fields: [users.created_month]
    filters:
      users.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [users.created_month desc, users.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: total_gross_revenue, label: Total gross revenue,
        expression: "if(\nis_null(${order_items.total_gross_revenue})\n,null\n,running_total(${order_items.total_gross_revenue}))",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [order_items.total_gross_revenue]
    listen:
      Date: order_items.created_date
    row: 39
    col: 10
    width: 14
    height: 10
  - name: Customer Cohort
    type: text
    title_text: Customer Cohort
    row: 37
    col: 0
    width: 24
    height: 2
  - title: YoY Cohort Value
    name: YoY Cohort Value
    model: adv_lookml_thelook
    explore: order_items
    type: looker_line
    fields: [users.created_year, order_items.total_gross_revenue, users.created_month_num]
    pivots: [users.created_year]
    fill_fields: [users.created_year, users.created_month_num]
    filters:
      users.created_year: 2 years
    sorts: [users.created_year 0, users.created_month_num]
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
    interpolation: linear
    series_types: {}
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date: order_items.created_date
    row: 39
    col: 0
    width: 10
    height: 4
  - title: New Users by Traffic Source
    name: New Users by Traffic Source
    model: adv_lookml_thelook
    explore: order_items
    type: looker_area
    fields: [users.traffic_source, users.count, users.created_month]
    pivots: [users.traffic_source]
    fill_fields: [users.created_month]
    filters:
      users.created_month: 12 months
    sorts: [users.traffic_source 0, users.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: of_total, label: "% of Total", expression: "${order_items.total_gross_revenue}/${order_items.total_gross_revenue:row_total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    hidden_series: []
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: order_items.created_date
    row: 49
    col: 10
    width: 14
    height: 9
  - title: "% of Active Users by Traffic Source"
    name: "% of Active Users by Traffic Source"
    model: adv_lookml_thelook
    explore: order_items
    type: looker_line
    fields: [users.months_since_signup, users.count, users.traffic_source]
    pivots: [users.traffic_source]
    filters:
      users.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [users.months_since_signup, users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: total_gross_revenue, label: Total gross revenue,
        expression: "if(\nis_null(${order_items.total_gross_revenue})\n,null\n,running_total(${order_items.total_gross_revenue}))",
        value_format: !!null '', value_format_name: usd_0, is_disabled: true, _kind_hint: dimension,
        _type_hint: 'null'}, {table_calculation: total_customers, label: Total Customers,
        expression: "if(\nis_null(${users.count})\n,null\n,running_total(${users.count}))",
        value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: measure, _type_hint: number}, {table_calculation: of_customers,
        label: "% of customers", expression: "${users.count}/ max(${users.count})",
        value_format: !!null '', value_format_name: percent_1, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 1ebd8493-ebcc-4e57-a4ff-ab3e6111da24
      options:
        steps: 5
    hidden_series: [2019-10 - No - of_customers, 2019-09 - No - of_customers, 2020-02
        - No - of_customers, 2020-01 - No - of_customers, 2019-08 - No - of_customers,
      2019-12 - No - of_customers, 2019-07 - No - of_customers, 2019-11 - No - of_customers,
      2019-06 - No - of_customers]
    hide_legend: false
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [users.count]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Date: order_items.created_date
    row: 53
    col: 0
    width: 10
    height: 12
  - title: "% Active Users by Cohorts"
    name: "% Active Users by Cohorts"
    model: adv_lookml_thelook
    explore: order_items
    type: looker_grid
    fields: [users.months_since_signup, user_order_facts.percentage_of_active_users,
      users.created_month, users.count]
    pivots: [users.months_since_signup]
    fill_fields: [users.created_month]
    filters:
      users.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [users.months_since_signup, users.created_month]
    column_limit: 50
    dynamic_fields: [{table_calculation: active_users, label: "% Active users", expression: "${users.count}\
          \ / ${users.count:row_total}", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number, is_disabled: true}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      users.created_month: 93
    series_cell_visualizations:
      user_order_facts.percentage_of_active_users:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users, id: No
              - active_users, name: No - % Active users}, {axisId: active_users, id: Yes
              - active_users, name: Yes - % Active users}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: users.count,
            id: No - users.count, name: No - Users Users Count}, {axisId: users.count,
            id: Yes - users.count, name: Yes - Users Users Count}, {axisId: users.count,
            id: Row Total - users.count, name: Row Total - Users Users Count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    hidden_series: [No - active_users, No - users.count, Yes - users.count]
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: [users.count]
    value_labels: legend
    label_type: labPer
    listen:
      Date: order_items.created_date
    row: 58
    col: 10
    width: 14
    height: 7
  - title: Lifetime Order Tiers
    name: Lifetime Order Tiers
    model: adv_lookml_thelook
    explore: order_items
    type: looker_donut_multiples
    fields: [user_order_facts.lifetime_orders_tiers, users.gender, users.count]
    pivots: [user_order_facts.lifetime_orders_tiers]
    filters:
      user_order_facts.lifetime_orders_tiers: "-Below 1"
    sorts: [user_order_facts.lifetime_orders_tiers, users.gender]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: of_total, label: "% of Total", expression: "${users.count}/${users.count:total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 13
    hide_legend: false
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: users.count, id: users.count,
            name: Users}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: of_total, id: of_total, name: "% of Total"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [of_total]
    listen:
      Date: order_items.created_date
    row: 2
    col: 4
    width: 7
    height: 6
  - title: Average Lifetime Orders and Revenue
    name: Average Lifetime Orders and Revenue
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [user_order_facts.average_lifetime_revenue, user_order_facts.average_lifetme_orders]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: of_total, label: "% of Total", expression: "${users.count}/${users.count:total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Lifetime Revenue
    comparison_label: Average Lifetime Orders
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels: {}
    series_cell_visualizations:
      user_order_facts.average_lifetime_revenue:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    show_value_labels: true
    font_size: 13
    hide_legend: false
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: users.count, id: users.count,
            name: Users}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: of_total, id: of_total, name: "% of Total"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [user_order_facts.average_lifetme_orders]
    hidden_points_if_no: []
    listen:
      Date: order_items.created_date
    row: 8
    col: 0
    width: 4
    height: 6
  - title: Lifetime Revenue Tiers
    name: Lifetime Revenue Tiers
    model: adv_lookml_thelook
    explore: order_items
    type: looker_donut_multiples
    fields: [users.gender, user_order_facts.average_lifetme_orders, user_order_facts.lifetime_revenue_tiers]
    pivots: [user_order_facts.lifetime_revenue_tiers]
    filters:
      user_order_facts.lifetime_revenue_tiers: "-Below 0"
    sorts: [users.gender, user_order_facts.lifetime_revenue_tiers]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 13
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels: {}
    series_cell_visualizations:
      user_order_facts.average_lifetime_revenue:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_legend: false
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: users.count, id: users.count,
            name: Users}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: of_total, id: of_total, name: "% of Total"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: []
    listen:
      Date: order_items.created_date
    row: 8
    col: 4
    width: 7
    height: 6
  - title: Average Lifetime Orders
    name: Average Lifetime Orders
    model: adv_lookml_thelook
    explore: order_items
    type: single_value
    fields: [user_order_facts.average_lifetme_orders]
    filters:
      user_order_facts.lifetime_revenue_tiers: "-Below 0"
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels: {}
    series_cell_visualizations:
      user_order_facts.average_lifetime_revenue:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_value_labels: true
    font_size: 13
    hide_legend: false
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: users.count, id: users.count,
            name: Users}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: of_total, id: of_total, name: "% of Total"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: []
    listen:
      Date: order_items.created_date
    row: 2
    col: 0
    width: 4
    height: 6
  - name: Customer Behavior
    type: text
    title_text: Customer Behavior
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Monthly Revenue by Lifetime Order Tiers
    name: Monthly Revenue by Lifetime Order Tiers
    model: adv_lookml_thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_revenue, order_items.created_month, user_order_facts.lifetime_orders_tiers]
    pivots: [user_order_facts.lifetime_orders_tiers]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 months
      user_order_facts.lifetime_orders_tiers: "-Below 1"
    sorts: [order_items.created_month desc, user_order_facts.lifetime_orders_tiers]
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: order_items.created_date
    row: 2
    col: 11
    width: 13
    height: 6
  - title: Monthly Revenue by Lifetime Revenue Tiers
    name: Monthly Revenue by Lifetime Revenue Tiers
    model: adv_lookml_thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_revenue, order_items.created_month, user_order_facts.lifetime_revenue_tiers]
    pivots: [user_order_facts.lifetime_revenue_tiers]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 months
      user_order_facts.lifetime_revenue_tiers: "-Undefined"
    sorts: [order_items.created_month desc, user_order_facts.lifetime_revenue_tiers]
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: order_items.created_date
    row: 8
    col: 11
    width: 13
    height: 6
  - title: Active Users by Lifetime Revenue Tier
    name: Active Users by Lifetime Revenue Tier
    model: adv_lookml_thelook
    explore: order_items
    type: looker_bar
    fields: [user_order_facts.lifetime_revenue_tiers, users.gender, user_order_facts.active_users_count]
    pivots: [users.gender]
    fill_fields: [user_order_facts.lifetime_revenue_tiers]
    filters:
      order_items.created_month: 12 months
    sorts: [user_order_facts.lifetime_revenue_tiers, users.gender]
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
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: user_order_facts.active_users_count,
            id: user_order_facts.active_users_count, name: Active Users Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Date: order_items.created_date
    row: 16
    col: 0
    width: 7
    height: 7
  - title: Active Users by Lifetime Order Tiers
    name: Active Users by Lifetime Order Tiers
    model: adv_lookml_thelook
    explore: order_items
    type: looker_bar
    fields: [user_order_facts.active_users_count, user_order_facts.lifetime_orders_tiers,
      users.gender]
    pivots: [users.gender]
    filters:
      user_order_facts.lifetime_orders_tiers: "-Below 1"
    sorts: [user_order_facts.lifetime_orders_tiers, users.gender]
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
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: user_order_facts.active_users_count,
            id: user_order_facts.active_users_count, name: Active Users Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Date: order_items.created_date
    row: 16
    col: 7
    width: 7
    height: 7
  - title: Repeated Customers by Traffic Source
    name: Repeated Customers by Traffic Source
    model: adv_lookml_thelook
    explore: order_items
    type: looker_bar
    fields: [users.traffic_source, users.count, user_order_facts.is_repeated_customer]
    pivots: [user_order_facts.is_repeated_customer]
    fill_fields: [user_order_facts.is_repeated_customer]
    sorts: [users.count desc 0, user_order_facts.is_repeated_customer, users.traffic_source]
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
    stacking: normal
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: No - users.count,
            id: No - users.count, name: 'No'}, {axisId: Yes - users.count,
            id: Yes - users.count, name: 'Yes'}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Date: order_items.created_date
    row: 16
    col: 14
    width: 10
    height: 7
  - name: Active and Repeated Customer Behavior
    type: text
    title_text: Active and Repeated Customer Behavior
    row: 14
    col: 0
    width: 24
    height: 2
  - title: Days Between Orders
    name: Days Between Orders
    model: adv_lookml_thelook
    explore: order_items
    type: looker_scatter
    fields: [repeated_order_facts.days_between_orders, order_items.count, users.gender]
    pivots: [users.gender]
    filters:
      repeated_order_facts.days_between_orders: ">0"
      user_order_facts.is_repeated_customer: 'Yes'
    sorts: [repeated_order_facts.days_between_orders, users.gender]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.count,
            id: Female - order_items.count, name: Female}, {axisId: order_items.count,
            id: Male - order_items.count, name: Male}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_types: {}
    reference_lines: []
    trend_lines: []
    swap_axes: false
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      order_items.count:
        is_active: false
        value_display: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Orders
    comparison_label: vs. All Orders
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Date: order_items.created_date
    row: 23
    col: 0
    width: 12
    height: 6
  - title: Days Between Purchase by Traffic Source
    name: Days Between Purchase by Traffic Source
    model: adv_lookml_thelook
    explore: order_items
    type: looker_line
    fields: [repeated_order_facts.days_between_orders, users.traffic_source, user_order_facts.repeat_customers]
    pivots: [users.traffic_source]
    filters:
      user_order_facts.average_lifetme_orders: ''
      repeated_order_facts.days_between_orders: ">0"
    sorts: [repeated_order_facts.days_between_orders, users.traffic_source]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.count,
            id: Display - order_items.count, name: Display - Order Items Order
              Count}, {axisId: order_items.count, id: Email - order_items.count,
            name: Email - Order Items Order Count}, {axisId: order_items.count,
            id: Facebook - order_items.count, name: Facebook - Order Items Order
              Count}, {axisId: order_items.count, id: Organic - order_items.count,
            name: Organic - Order Items Order Count}, {axisId: order_items.count,
            id: Search - order_items.count, name: Search - Order Items Order
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}, {label: '', orientation: right, series: [{axisId: order_items.total_gross_revenue,
            id: Display - order_items.total_gross_revenue, name: Display - Order Items
              Total Gross Revenue}, {axisId: order_items.total_gross_revenue, id: Email
              - order_items.total_gross_revenue, name: Email - Order Items Total Gross
              Revenue}, {axisId: order_items.total_gross_revenue, id: Facebook - order_items.total_gross_revenue,
            name: Facebook - Order Items Total Gross Revenue}, {axisId: order_items.total_gross_revenue,
            id: Organic - order_items.total_gross_revenue, name: Organic - Order Items
              Total Gross Revenue}, {axisId: order_items.total_gross_revenue, id: Search
              - order_items.total_gross_revenue, name: Search - Order Items Total
              Gross Revenue}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    series_types: {}
    series_labels:
      No - order_items.count: Not Active
      Yes - order_items.count: Active
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Date: order_items.created_date
    row: 23
    col: 12
    width: 12
    height: 6
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: adv_lookml_thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
