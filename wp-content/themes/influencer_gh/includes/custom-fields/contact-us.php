<?php

add_action( 'contact-us_template_fields_tik', function () {
	global $fields_tik;
	$html = $fields_tik->repeater( 'contact', array(
		'label' => __( 'Social Links', 'building_tik' ),
	), function ( $fields_tik ) {
		$html = $fields_tik->input( 'title', array(
			'label' => __( 'Title', 'building_tik' ),
			'width' => 'half',
		) );
		$html .= $fields_tik->fontAwesome( 'icon', array(
			'label' => __( 'Icon', 'building_tik' ),
			'width' => 'half'
		) );
		$html .= $fields_tik->wpEditor( 'text', array(
			'label' => __( 'Text', 'building_tik' ),
			'textarea_rows' => 2,
		) );
		return $html;
	} );

	$html .= $fields_tik->input( 'map-iframe', array(
		'label'       => __( 'Map Iframe', 'building_tik' ),
		'description' => sprintf( '<a target="_blank" href="https://yandex.com/map-constructor/">%s</a>', __( 'Generate Map', 'building' ) )
	) );

	echo $html;
} );