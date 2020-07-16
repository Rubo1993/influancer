<?php
class OptionsFields_Tik {

	public function __construct() {
		add_action( 'admin_menu', array( $this, 'registerOptionsPage' ) );
		add_action( 'admin_init', array( $this, 'saveOptionFields' ) );
	}

	public function registerOptionsPage() {
		if ( has_action( 'option_fields_tik' ) ) {
			add_submenu_page(
				'themes.php',
				__( 'Theme Options', 'fields-tik' ),
				__( 'Theme Options', 'fields-tik' ),
				'manage_options',
				'options-tik',
				array( $this, 'optionsPage' )
			);
		}
	}


	public function optionsPage() {
		$GLOBALS['id_fields_tik'] = 'option';
		$current_theme            = wp_get_theme();
		?>
        <h1 class="wp-heading-inline">
			<?php echo $current_theme->get( 'Name' ) ?>
			<?php _e( 'Options', 'fields-tik' ) ?>
        </h1>
        <div class="options-tik">
            <form action="?page=options-tik" method="post">
				<?php do_action( 'option_fields_tik', '' ) ?>
                <div>
					<?php wp_nonce_field( 'save-options-tik', '_options-tik' ); ?>
                    <input name="options-tik-save" type="submit" class="button button-primary button-large"
                           value="<?php _e( 'Save', 'fields-tik' ) ?>">
                </div>
            </form>
        </div>
		<?php
	}

	public function saveOptionFields() {
		if ( ! isset( $_POST['options-tik-save'] ) ) {
			return;
		}

		if ( ! current_user_can( 'edit_theme_options' ) ) {
			return;
		}

		$nonce = isset( $_POST['_options-tik'] ) ? $_POST['_options-tik'] : null;
		unset( $_POST['_options-tik'] );
		if ( ! wp_verify_nonce( $nonce, 'save-options-tik' ) ) {
			return;
		}

		$fields_tik = isset( $_POST['fields_tik'] ) ? $_POST['fields_tik'] : false;
		if ( $fields_tik ) {
			update_option( '_fields_tik_option', $fields_tik );
		}
	}
}


