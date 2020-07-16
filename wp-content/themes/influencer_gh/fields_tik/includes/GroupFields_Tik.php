<?php

class GroupFields_Tik {

	private $name;
	private $key;


	public function __construct( $name ) {
		$this->name = $name;
	}

	public function __call( $method, $args ) {
		global $fields_tik;

		if ( method_exists( $fields_tik, $method ) ) {

			$args = $this->normalizeArgs( $args );

			return call_user_func_array( array( $fields_tik, $method ), $args );
		} else {
			throw new Exception( "Call to undefined method FieldsTik::{$method}()" );
		}
	}

	public function normalizeArgs( $args ) {
		$args[1] = ! empty( $args[1] ) && is_array( $args[1] ) ? $args[1] : array();
		$post_id = isset( $args[1]['post_id'] ) ? $args[1]['post_id'] : null;
		$data    = get_field_tik( $this->name, $post_id, array() );
		if ( isset( $data[ $this->key ], $data[ $this->key ][ $args[0] ] ) ) {
			$args[1]['values'] = $data[ $this->key ][ $args[0] ];
		} elseif ( isset( $data[ $args[0] ] ) ) {
			$args[1]['values'] = $data[ $args[0] ];
		}

		$args[1]['post_id'] = '_';

		return $args;
	}

	public function setKey( $key ) {
		$this->key = (int) $key;
	}
}

