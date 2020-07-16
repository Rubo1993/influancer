<?php

class PostTypeFields_Tik {
	public function __construct() {
		add_action( 'add_meta_boxes', array( $this, 'registerMetaBoxes' ), 10, 2 );
		add_action( 'save_post', array( $this, 'savePostFields' ) );
	}

	public function registerMetaBoxes( $post_type, $post ) {
		$post_type_obj = get_post_type_object( $post_type );

		if ( $this->postTypeAction( $post ) ) {
			remove_meta_box( 'postcustom', $post_type, 'normal' );
			add_meta_box( $post_type . '_fields_tik', $post_type_obj->labels->singular_name,
				array( $this, 'metaBoxes' ), $post_type );
		}

		if ( $this->postAction( $post ) ) {
			remove_meta_box( 'postcustom', $post_type, 'normal' );
			add_meta_box( 'post_fields_tik', $post_type_obj->labels->singular_name,
				array( $this, 'metaBoxes' ), $post_type );
		}

		if ( $this->frontPageAction( $post ) ) {
			remove_meta_box( 'postcustom', $post_type, 'normal' );
			add_meta_box( 'front_page_fields_tik', __( 'Home Page', 'fields-tik' ),
				array( $this, 'metaBoxes' ), $post_type );
		}

		if ( $post_template = get_page_template_slug( $post->ID ) ) {
			$post_template = pathinfo( $post_template, PATHINFO_FILENAME );
			if ( has_action( $post_template . '_template_fields_tik' ) ) {
				remove_meta_box( 'postcustom', $post_type, 'normal' );
				add_meta_box( $post_template . '_fields_tik', $post_type_obj->labels->singular_name,
					array( $this, 'metaBoxes' ), $post_type );
			}
		}


	}

	private function frontPageAction( $post ) {
		return $post->ID == get_option( 'page_on_front' ) && has_action( 'front_page_fields_tik' );
	}


	private function postAction( $post ) {
		return $post->post_type === 'post' && has_action( 'post_fields_tik' );
	}

	private function postTypeAction( $post ) {
		return has_action( $post->post_type . '_post_fields_tik' );
	}


	public function metaBoxes( $post ) {
		if ( $this->postTypeAction( $post ) ) {
			do_action( $post->post_type . '_post_fields_tik', $post );
		}

		if ( $this->postAction( $post ) ) {
			do_action( 'post_fields_tik', $post );
		}

		if ( $this->frontPageAction( $post ) ) {
			do_action( 'front_page_fields_tik', $post );
		}

		if ( $post_template = get_page_template_slug() ) {
			$post_template = pathinfo( $post_template, PATHINFO_FILENAME );
			do_action( $post_template . '_template_fields_tik', $post );
		}
	}

	public function savePostFields( $post_id ) {
		$data = isset( $_POST['fields_tik'] ) ? $_POST['fields_tik'] : false;
		if ( is_array( $data ) ) {
			foreach ( $data as $key => $val ) {
				update_post_meta( $post_id, $key, $val );
			}
		}
	}
}

