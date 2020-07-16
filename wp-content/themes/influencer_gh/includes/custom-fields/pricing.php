<?php

add_action('pricing_template_fields_tik', function () {
    global $fields_tik;

    $tariffs_card = $fields_tik->input('tariffs_part_title', array(
        'label' => __('Tariffs part title', 'influencer'),
        'width' => 'half'
    ));

    $tariffs_tokens = $fields_tik->repeater('tariffs_tokens_card', array(
        'label' => __('Tariffs tokens card', 'influencer'),
    ), function ($fields_tik) {
        $html = $fields_tik->file('tariffs_card_img', array(
            'label' => __('Tariffs card image', 'influencer'),
        ));
        $html .= $fields_tik->input('tariffs_card_title', array(
            'label' => __('Tariffs card title', 'influencer'),
            'rows' => '2'
        ));
        $html .= $fields_tik->textarea('tariffs_card_text', array(
            'label' => __('Tariffs card text', 'influencer'),
        ));

        return $html;
    });
    $tariffs_tokens .= $fields_tik->input('tarriff_message_title', array(
        'label' => __('Tariffs message title', 'influencer'),

    ));
    $tariffs_tokens .= $fields_tik->textarea('tarriff_message_text', array(
        'label' => __('Tariffs message text', 'influencer'),
        'rows' => 2
    ));

    $feel_the_difference = $fields_tik->input('feel_the_difference_title', array(
        'label' => __('Feel the differenc part title', 'influencer'),
    ));
    $feel_the_difference .= $fields_tik->selectAjax('blogers_p', array(
        'label' => __('Bloger', 'influencer'),
        'width' => 'half'
    ), array(
        'call' => 'WP_Query',
        'post_type' => 'bloggers',
    ));
    $feel_the_difference .= $fields_tik->textarea('difference_footer_message', array(
        'label' => __('Fifference footer message', 'influencer'),
        'rows' => '3'
    ));

    echo $fields_tik->tab(array(
        __('Tariffs card', 'influencer') => $tariffs_card,
        __('Tariffs tokens', 'influencer') => $tariffs_tokens,
        __('Feel the differenc', 'influencer') => $feel_the_difference
    ));

});