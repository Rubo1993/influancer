<?php
add_action('init', function () {
    $labels = array(
        'name' => _x('Bloggers', 'Post type general name', 'influencer'),
        'singular_name' => _x('Bloggers', 'Post type singular name', 'influencer'),
        'menu_name' => _x('Bloggers', 'Admin Menu text', 'influencer'),
        'name_admin_bar' => _x('Bloggers', 'Add New on Toolbar', 'influencer'),
        'add_new' => __('Add Bloggers', 'influencer'),
        'add_new_item' => __('Add Bloggers', 'influencer'),
        'new_item' => __('New Bloggers', 'influencer'),
        'edit_item' => __('Edit Bloggers', 'influencer'),
        'view_item' => __('View Bloggers', 'influencer'),
        'all_items' => __('All Bloggers', 'influencer')
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'query_var' => true,
        'rewrite' => array('slug' => 'bloggers'),
        'capability_type' => 'page',
        "exclude_from_search" => true,
        'has_archive' => true,
        'show_in_nav_menus' => true,
        'hierarchical' => false,
        'menu_position' => 22,
        'menu_icon' => 'dashicons-smiley',
        'supports' => array('title', 'page-attributes', 'thumbnail', 'comments', 'editor'),
    );

    register_post_type('bloggers', $args);
});
add_action('bloggers_post_fields_tik', function () {
    global $fields_tik;
    $data = $fields_tik->group('user_itm', array(
        'label' => __('Header user item', 'influencer'),
    ), function ($fields_tik) {
        $html = $fields_tik->input('country', array(
            'label' => __('Country', 'influencer'),
            'width' => 'half',
        ));
        $html .= $fields_tik->input('city', array(
            'label' => __('City', 'influencer'),
            'width' => 'half',
        ));
        $html .= $fields_tik->input('year', array(
            'label' => __('Year', 'influencer'),
            'width' => 'half',
            'type' => 'number',
        ));
        $html .= $fields_tik->input('followers', array(
            'label' => __('Followers', 'influencer'),
            'width' => 'half',
            'type' => 'number',
        ));
        $html .= $fields_tik->input('coverage', array(
            'label' => __('Coverage', 'influencer'),
            'width' => 'half',
            'type' => 'number',
        ));

        $html .= $fields_tik->input('itm_like_count', array(
            'label' => __('Item like count', 'influencer'),
            'width' => 'half',
            'type' => 'number',
        ));
        $html .= $fields_tik->input('itm_comment_count', array(
            'label' => __('Item comment count', 'influencer'),
            'width' => 'half',
            'type' => 'number',
        ));

        $html .= $fields_tik->input('itm_percent', array(
            'label' => __('Item percent', 'influencer'),
            'width' => 'half',
        ));
        $html .= $fields_tik->textarea('itm_payback_text', array(
            'label' => __('Item payback text', 'influencer'),
            'width' => 'half',
            'rows'=>3,
        ));
        $html .= $fields_tik->input('bloggers_view_count', array(
            'label' => __('Bloggers view count', 'influencer'),
            'width' => 'half',
            'type'=>'number',
        ));
        $html .= $fields_tik->input('directly__card__price',array(
            'label' => __('Directly card price', 'influencer'),
            'width' => 'half',
        ));
        $html .= $fields_tik->input('agency__card__price',array(
            'label' => __('Agency card price', 'influencer'),
            'width' => 'half',
        ));
        $html .= $fields_tik->input('influencer__card__price',array(
            'label' => __('Influencer card price', 'influencer'),
            'width' => 'half',
        ));
        return $html;
    });
    echo $data;
});
