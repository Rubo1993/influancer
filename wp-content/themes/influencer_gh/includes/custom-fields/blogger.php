<?php

add_action('blogger_template_fields_tik', function () {
    global $fields_tik;
    $you_will_get = $fields_tik->input('you_will_get_title', array(
        'label' => __('You will get title', 'influencer'),
    ));
    $you_will_get .= $fields_tik->repeater('you_will_get_items', array(
        'label' => __('You will get items', 'influencer'),
    ), function ($fields_tik) {
        $items = $fields_tik->file('itm_img', array(
            'label' => __('Item image', 'influencer'),
        ));
        $items .= $fields_tik->input('item_title', array(
            'label' => __('Item title', 'influencer'),
            'rows' => '2',
            'width' => 'half'

        ));
        $items .= $fields_tik->textarea('item_text', array(
            'label' => __('Item text', 'influencer'),
            'width' => 'half',
            'rows' => '3'
        ));

        return $items;
    });
    $how_it_works = $fields_tik->input('how_it_works_title', array(
        'label' => __('How it works title', 'influencer'),
        'width' => 'half',
    ));
    $how_it_works .= $fields_tik->repeater('how_it_works_items', array(
        'label' => __('How it works items', 'influencer'),
    ), function ($fields_tik) {
        $items = $fields_tik->input('itm_icon', array(
            'label' => __('Item icon', 'influencer'),
        ));
        $items .= $fields_tik->input('item_title', array(
            'label' => __('Item title', 'influencer'),
            'rows' => '2',
            'width' => 'half'
        ));

        return $items;
    });
    $register_if = $fields_tik->input('register_if_title', array(
        'label' => __('Register if part title', 'influencer'),
        'width' => 'half'
    ));
    $register_if.= $fields_tik->repeater('register_if_items', array(
        'label' => __('Register if items', 'influencer'),
    ), function ($fields_tik) {
        $items = $fields_tik->file('itm_img', array(
            'label' => __('Item image', 'influencer'),
        ));
        $items .= $fields_tik->input('item_title', array(
            'label' => __('Item title', 'influencer'),
            'rows' => '2',
            'width' => 'half'
        ));

        return $items;
    });

    echo $fields_tik->tab(array(
        __('You will get', 'influencer') => $you_will_get,
        __('How it works', 'influencer') => $how_it_works,
        __('Register if', 'influencer') => $register_if
    ));

});