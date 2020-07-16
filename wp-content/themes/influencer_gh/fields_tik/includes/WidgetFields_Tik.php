<?php

class WidgetFields_Tik {
	public function __construct() {
		add_filter( 'widget_update_callback', array( $this, 'saveWidget' ) );
		add_filter( 'widget_form_callback', array( $this, 'setWidgetId' ), 10, 2 );
	}


	public function setWidgetId( $instance, $widget ) {
		$GLOBALS['id_fields_tik'] = 'widget_' . $widget->id;

		return $instance;
	}

	public function saveWidget( $instance ) {
		$fields_tik = isset( $_POST['fields_tik'] ) ? $_POST['fields_tik'] : null;
		if ( $fields_tik ) {
			$instance = array_merge( $instance, $fields_tik );
		}

		return $instance;
	}
}
