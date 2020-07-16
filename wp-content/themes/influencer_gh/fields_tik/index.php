<?php
defined( 'ABSPATH' ) or exit;

if ( is_admin() ) {
	define( 'FIELDS_TIK_DIR', get_template_directory() . '/fields_tik' );
	define( 'FIELDS_TIK_URI', get_template_directory_uri() . '/fields_tik' );

	include FIELDS_TIK_DIR . '/Fields_Tik.php';
}


/**
 * @param string $key
 * @param null|string|int $post_id
 * @param mixed $default
 *
 * @return mixed|null|string|array
 */
function get_field_tik( $key, $post_id = null, $default = null ) {
	if ( is_admin() && ! $post_id && isset( $GLOBALS['id_fields_tik'] ) ) {
		$post_id = $GLOBALS['id_fields_tik'];
	}

	$post_id = $post_id ? $post_id : get_the_ID();

	if ( ! $post_id || $post_id == '_' ) {
		return $default;
	}

	if ( (int) $post_id > 0 ) {
		$data = get_post_meta( (int) $post_id, $key, true );
	} elseif ( $post_id === 'option' ) {
		$data_arr = get_option( '_fields_tik_option', array() );
		$data     = isset( $data_arr[ $key ] ) ? $data_arr[ $key ] : '';
	} elseif ( strpos( $post_id, 'tax_' ) === 0 ) {
		$tag_id = (int) substr( $post_id, 4 );
		$data   = get_term_meta( $tag_id, $key, true );
	} elseif ( strpos( $post_id, 'user_' ) === 0 ) {
		$user_id = (int) substr( $post_id, 5 );
		$data    = get_user_meta( $user_id, $key, true );
	} elseif ( preg_match( '/^(widget_.*)-(\d+)$/', $post_id, $matches ) ) {
		$id       = (int) $matches[2];
		$data_arr = get_option( $matches[1], array() );
		$data     = isset( $data_arr[ $id ], $data_arr[ $id ][ $key ] ) ? $data_arr[ $id ][ $key ] : '';
	} else {
		return $default;
	}

	return $data != '' ? $data : $default;
}

