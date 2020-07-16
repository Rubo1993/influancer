<?php

add_action( 'option_fields_tik', function () {
	global $fields_tik;
	$main = $fields_tik->file( 'logo', array(
		'label' => __( 'Logo ', 'influencer' ),
		'type'  => 'image',
		'width' => 'half',
	) );

	$main .= $fields_tik->input( 'phone', array(
		'label' => __( 'Phone', 'influencer' ),
		'width' => 'half',
	) );

	$main .= $fields_tik->fontAwesome( 'phone_icon', array(
		'label' => __( 'Phone Icon', 'influencer' ),
		'width' => 'half',

	) );

	$social = $fields_tik->repeater( 'social', array(
		'label' => __( 'Social Links', 'influencer' ),
	), function ( $fields_tik ) {
		$html = $fields_tik->link( 'url', array(
			'label' => __( 'URL', 'influencer' ),
			'width' => 'half',
			'type'  => 'url'
		) );
		$html .= $fields_tik->fontAwesome( 'icon', array(
			'label' => __( 'Icon', 'influencer' ),
			'width' => 'half'
		) );

		return $html;
	} );
    $header_banner = $fields_tik->input('header_title', array(
        'label' => __('Title', 'influencer'),
    ));

    $header_banner .= $fields_tik->textarea('header_text', array(
        'label' => __('Text', 'influencer'),
        'rows'=>3,
    ));
    $header_banner .= $fields_tik->group('blogers', array(
        'label' => __('Blogers', 'ghost'),

    ), function ($fields_tik) {
        $bloger = $fields_tik->selectAjax('bloger_1', array(
            'label' => __('Bloger 1', 'influencer'),
            'width' => 'half'
        ), array(
            'call' => 'WP_Query',
            'post_type' => 'bloggers',
        ));
        $bloger .= $fields_tik->selectAjax('bloger_2', array(
            'label' => __('Bloger 2', 'influencer'),
            'width' => 'half'
        ), array(
            'call' => 'WP_Query',
            'post_type' => 'bloggers',
        ));
        $bloger .= $fields_tik->selectAjax('bloger_3', array(
            'label' => __('Bloger 3', 'influencer'),
            'width' => 'half'
        ), array(
            'call' => 'WP_Query',
            'post_type' => 'bloggers',
        ));
        $bloger .= $fields_tik->selectAjax('bloger_4', array(
            'label' => __('Bloger 4', 'influencer'),
            'width' => 'half'
        ), array(
            'call' => 'WP_Query',
            'post_type' => 'bloggers',
        ));
        $bloger .= $fields_tik->selectAjax('bloger_5', array(
            'label' => __('Bloger 5', 'influencer'),
            'width' => 'half'
        ), array(
            'call' => 'WP_Query',
            'post_type' => 'bloggers',
        ));

        return $bloger;
    });

	echo $fields_tik->tab( array(
		__( 'Header banner', 'influencer' )   => $header_banner,
		__( 'Main', 'influencer' )   => $main,
		__( 'Social', 'influencer' ) => $social,
	) );
} );