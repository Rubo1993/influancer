<?php
class UserFields_Tik {

	public function __construct() {
		add_action( 'show_user_profile', array( $this, 'userFields' ), 10 );
		add_action( 'edit_user_profile', array( $this, 'userFields' ), 10 );

		add_action( 'personal_options_update', array( $this, 'saveUserFields' ) );
		add_action( 'edit_user_profile_update', array( $this, 'saveUserFields' ) );
	}

	public function userFields( $user ) {
		if ( has_action( 'user_fields_tik' ) ) {
			$GLOBALS['id_fields_tik'] = 'user_' . $user->ID;

			echo '<div class="user-tik">';
			do_action( 'user_fields_tik', $user );
			wp_nonce_field( 'save-user-tik', '_user-tik' );
			echo '</div>';
		}
	}

	public function saveUserFields( $user_id ) {
		$data  = isset( $_POST['fields_tik'] ) ? $_POST['fields_tik'] : null;
		$nonce = isset( $_POST['_user-tik'] ) ? $_POST['_user-tik'] : null;
		unset( $_POST['_user-tik'] );

		if ( empty( $data ) ) {
			return;
		}

		if ( ! current_user_can( 'edit_user', $user_id ) ) {
			return;
		}

		if ( ! wp_verify_nonce( $nonce, 'save-user-tik' ) ) {
			return;
		}

		foreach ( $data as $key => $val ) {
			update_user_meta( $user_id, $key, $val );
		}

	}
}
