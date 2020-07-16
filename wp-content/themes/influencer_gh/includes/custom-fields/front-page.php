<?php

add_action('front_page_fields_tik', function ($post) {
    global $fields_tik;

    $software = $fields_tik->input('software_title', array(
        'label' => __('Software title', 'influencer'),
    ));
    $software .= $fields_tik->repeater('software', array(
        'label' => __('Software', 'influencer'),
    ), function ($fields_tik) {
        $html = $fields_tik->input('software_icon', array(
            'label' => __('Software icon', 'influencer'),
        ));
        $html .= $fields_tik->input('software_menu_itm', array(
            'label' => __('Software menu item', 'influencer'),
        ));


        $html .= $fields_tik->input('software_desc_title', array(
            'label' => __('Software description title', 'influencer'),
        ));
        $html .= $fields_tik->textarea('software_description', array(
            'label' => __('Prioriti description', 'influencer'),
            'width' => 'half',
        ));
        $html .= $fields_tik->file('software_img', array(
            'label' => __('Software image', 'influencer'),
            'width' => 'half',
        ));
        return $html;
    }
    );


    $auto_pay = $fields_tik->file('auto_pay_img', array(
        'label' => __('Auto pay image', 'influencer'),
    ));
    $auto_pay .= $fields_tik->input('auto_pay_title', array(
        'label' => __('Auto pay title', 'influencer'),
    ));
    $auto_pay .= $fields_tik->textarea('auto_pay_text', array(
        'label' => __('Auto pay text', 'influencer'),
    ));

    $secure_transactions = $fields_tik->input('secure_transactions_title', array(
        'label' => __('Secure transactions title', 'influencer'),

    ));
    $secure_transactions .= $fields_tik->repeater('secure_transactions_itms', array(
        'label' => __('Secure transactions items', 'influencer'),
    ), function ($fields_tik) {
        $html = $fields_tik->input('secure_transactions_icon', array(
            'label' => __('Secure transactions icon', 'influencer'),
            'width' => 'half',
        ));
        $html .= $fields_tik->input('secure_transactions_name', array(
            'label' => __('Secure transactions name', 'influencer'),
            'width' => 'half',
        ));
        return $html;
    }
    );
    $secure_transactions .= $fields_tik->textarea('secure_transactions_text', array(
        'label' => __('Secure transactions text', 'influencer'),
    ));
    $demo = $fields_tik->input('demo_part_title', array(
            'label' => __('Demo part title', 'influencer'),
        )
    );
    $demo .= $fields_tik->textarea('demo_part_text', array(
            'label' => __('Demo part text', 'influencer'),
        )
    );
    echo $fields_tik->tab(array(
        __('Software', 'influencer') => $software,
        __('Auto pay', 'influencer') => $auto_pay,
        __('Secure transactions', 'influencer') => $secure_transactions,
        __('Demo part', 'influencer') => $demo,
    ));
});