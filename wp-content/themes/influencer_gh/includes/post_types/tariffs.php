<?php
add_action('init', function () {
    $labels = array(
        'name' => _x('Тariffs', 'Post type general name', 'influencer'),
        'singular_name' => _x('Тariffs', 'Post type singular name', 'influencer'),
        'menu_name' => _x('Тariffs', 'Admin Menu text', 'influencer'),
        'name_admin_bar' => _x('Тariffs', 'Add New on Toolbar', 'influencer'),
        'add_new' => __('Add Тariffs', 'influencer'),
        'add_new_item' => __('Add Тariffs', 'influencer'),
        'new_item' => __('New Тariffs', 'influencer'),
        'edit_item' => __('Edit Тariffs', 'influencer'),
        'view_item' => __('View Тariffs', 'influencer'),
        'all_items' => __('All Тariffs', 'influencer')
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'query_var' => true,
        'rewrite' => array('slug' => 'tariffs'),
        'capability_type' => 'page',
        "exclude_from_search" => true,
        'has_archive' => true,
        'show_in_nav_menus' => true,
        'hierarchical' => false,
        'menu_position' => 22,
        'menu_icon' => 'dashicons-calendar-alt',
        'supports' => array('title', 'page-attributes', 'thumbnail', 'comments', 'editor'),
    );

    register_post_type('tariffs', $args);
});
add_action('tariffs_post_fields_tik', function () {
    global $fields_tik;
//    $main = $fields_tik->checkbox( 'is_main', array(
//        'label' => __( 'is main', 'influencer' ),
//    ) );
    $data = $fields_tik->file('tariffs_tokens_img', array(
        'label' => __('Tariff tokens img', 'influencer'),
    ));
    $data .= $fields_tik->input('tariff_tokens_count', array(
        'label' => __('Tariff tokens count', 'influencer'),
        'type' => 'number',
        "width" => "half"
    ));


    $data .= $fields_tik->input('tariff_tokens_title', array(
        'label' => __('Tariff tokens title', 'influencer'),
        "width" => "half"
    ));

    $data .= $fields_tik->input('tariff_item_description', array(
        'label' => __('Tariff item description', 'influencer'),
        "width" => "half"
    ));

    $data .= $fields_tik->input('1_token_cost', array(
        'label' => __('The cost of 1 token', 'influencer'),
        'width' => 'half',
        'rows' => 1
    ));
    $data .= $fields_tik->input('the_cost_text', array(
        'label' => __('The cost text', 'influencer'),
        'width' => 'half',
        'rows' => 1
    ));
    $data .= $fields_tik->input('price_to', array(
        'label' => __('Price to', 'influencer'),
        'width' => 'half',
    ));
    $data .= $fields_tik->wpEditor('tariffs_item_desc', array(
        'label' => __('Tariffs item description', 'influencer'),
        'textarea_rows' => '3'
    ));

    $data .= $fields_tik->input('tariffs_cost', array(
        'label' => __('Tariffs cost', 'influencer'),
        'width' => 'half',
    ));
    $data .= $fields_tik->input('tariffs_economy', array(
        'label' => __('Tariffs economy', 'influencer'),
        'width' => 'half',
    ));
    echo $fields_tik->tab(array(
//        __( 'Is main', 'influencer' )    => $main,
        __('Тariffs date', 'influencer') => $data,
    ));
});
