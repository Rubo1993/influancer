<?php
class TaxonomyFields_Tik {
	public function __construct() {
		add_action( 'init', array( $this, 'init' ), 999999 );

		add_action( 'admin_init', array( $this, 'saveTaxonomyFields' ) );
	}

	public function init() {
		$taxonomies = get_taxonomies();

		foreach ( $taxonomies as $tax ) {
			if ( has_action( $tax . '_tax_fields_tik' ) ) {
				add_action( $tax . '_edit_form_fields', array( $this, 'taxonomyFields' ) );
			}
		}
	}

	public function taxonomyFields( $tax ) {
		$GLOBALS['id_fields_tik'] = 'tax_' . $tax->term_id;
		?>
        <tr class="form-field term-group-wrap taxonomy-tik">
            <td colspan="2">
				<?php do_action( $tax->taxonomy . '_tax_fields_tik', $tax ); ?>
                <div>
					<?php wp_nonce_field( 'save-taxonomy-tik', '_taxonomy-tik' ); ?>
                    <input name="taxonomy-tik-save" type="hidden" value="1"/>
                </div>
            </td>
        </tr>
		<?php
	}

	public function saveTaxonomyFields() {
		if ( empty( $_POST['taxonomy-tik-save'] ) ) {
			return;
		}
		$fields_tik    = isset( $_POST['fields_tik'] ) ? $_POST['fields_tik'] : null;
		$term_id = isset( $_POST['tag_ID'] ) ? (int) $_POST['tag_ID'] : null;
		$nonce   = isset( $_POST['_taxonomy-tik'] ) ? $_POST['_taxonomy-tik'] : null;
		unset( $_POST['_taxonomy-tik'] );

		if ( ! $term_id || empty( $fields_tik ) ) {
			return;
		}
		if ( ! current_user_can( 'manage_categories' ) ) {
			return;
		}
		if ( ! wp_verify_nonce( $nonce, 'save-taxonomy-tik' ) ) {
			return;
		}

		foreach ( $fields_tik as $key => $val ) {
			update_term_meta( $term_id, $key, $val );
		}
	}
}
