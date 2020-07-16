<?php

class AdminFields_Tik {

	public function __construct() {
		add_action( 'admin_enqueue_scripts', array( $this, 'adminScriptsAndStyles' ) );

		add_action( 'after_setup_theme', array( $this, 'textDomain' ) );
	}

	public function textDomain() {
		load_theme_textdomain( 'fields-tik', FIELDS_TIK_DIR . '/languages' );
	}

	public function adminScriptsAndStyles() {
		$min = defined( 'DEV_TIK' ) && DEV_TIK ? '' : '.min';

		wp_register_style( 'font-awesome', FIELDS_TIK_URI . '/assets/styles/font-awesome.min.css',
			array(), 'v4.7.0' );
		wp_register_style( 'jquery-ui', FIELDS_TIK_URI . "/assets/styles/jquery-ui{$min}.css",
			array(), 'v1.12.1' );
		wp_register_style( 'select2', FIELDS_TIK_URI . "/assets/styles/select2{$min}.css",
			array( 'fields_tik' ), 'v4.0.5' );
		wp_register_style( 'fields_tik', FIELDS_TIK_URI . "/assets/styles/style{$min}.css",
			array( 'font-awesome', ), 'v1.3.1' );

		wp_register_script( 'select2', FIELDS_TIK_URI . "/assets/scripts/select2.full{$min}.js",
			array(), 'v4.0.5', true );
		wp_register_script( 'placepicker_tik', FIELDS_TIK_URI . "/assets/scripts/placepicker{$min}.js",
			array( 'jquery' ), 'v1.3.1', true );
		wp_register_script( 'fields_tik', FIELDS_TIK_URI . "/assets/scripts/script{$min}.js",
			array( 'jquery', 'jquery-ui-sortable', ), 'v1.3.1', true );
		wp_localize_script( 'fields_tik', 'fieldsTik', array(
			'siteUrl'      => get_site_url(),
			'ajaxUrl'      => admin_url( 'admin-ajax.php' ),
			'mimeTypeIcon' => includes_url( 'images/media/default.png' ),
			'i18n'         => array(
				'Are you sure you want to delete this element?' => __( 'Are you sure you want to delete this element?', 'field-tik' ),
				'Select'                                        => __( 'Select', 'field-tik' ),
				'Max Allowed Size Limit'                        => __( 'Max Allowed Size Limit', 'field-tik' ),
				'Min Allowed Size Limit'                        => __( 'Min Allowed Size Limit', 'field-tik' ),
			),
		) );
	}
}

