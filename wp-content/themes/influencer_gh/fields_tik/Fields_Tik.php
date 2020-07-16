<?php
defined( 'ABSPATH' ) or exit;
include FIELDS_TIK_DIR . '/components/Input_Tik.php';
include FIELDS_TIK_DIR . '/components/Checkbox_Tik.php';
include FIELDS_TIK_DIR . '/components/File_Tik.php';
include FIELDS_TIK_DIR . '/components/FontAwesome_Tik.php';
include FIELDS_TIK_DIR . '/components/Group_Tik.php';
include FIELDS_TIK_DIR . '/components/Link_Tik.php';
include FIELDS_TIK_DIR . '/components/Location_Tik.php';
include FIELDS_TIK_DIR . '/components/Repeater_Tik.php';
include FIELDS_TIK_DIR . '/components/Select_Tik.php';
include FIELDS_TIK_DIR . '/components/SelectAjax_Tik.php';
include FIELDS_TIK_DIR . '/components/Tab_Tik.php';
include FIELDS_TIK_DIR . '/components/Textarea_Tik.php';
include FIELDS_TIK_DIR . '/components/WpEditor_Tik.php';

include FIELDS_TIK_DIR . '/includes/GroupFields_Tik.php';

include FIELDS_TIK_DIR . '/includes/AdminFields_Tik.php';
include FIELDS_TIK_DIR . '/includes/AjaxQueryFields_Tik.php';
include FIELDS_TIK_DIR . '/includes/OptionsFields_Tik.php';
include FIELDS_TIK_DIR . '/includes/PostTypeFields_Tik.php';
include FIELDS_TIK_DIR . '/includes/TaxonomyFields_Tik.php';
include FIELDS_TIK_DIR . '/includes/UserFields_Tik.php';
include FIELDS_TIK_DIR . '/includes/WidgetFields_Tik.php';



class Fields_Tik {
	static $isInit;
	use Checkbox_Tik;
	use File_Tik;
	use Input_Tik;
	use FontAwesome_Tik;
	use Group_Tik;
	use Link_Tik;
	use Location_Tik;
	use Repeater_Tik;
	use Select_Tik;
	use SelectAjax_Tik;
	use Tab_Tik;
	use Textarea_Tik;
	use WpEditor_Tik;


	private function normalizeAttr( $attr = array(), $name = '' ) {
		$post_id = isset( $attr['post_id'] ) ? $attr['post_id'] : null;

		$values = isset( $attr['values'] ) ? $attr['values'] : get_field_tik( $name, $post_id, '' );

		if ( ! wp_is_numeric_array( $values ) ) {
			$values = array( $values );
		}


		$_attr = array(
			'label'       => isset( $attr['label'] ) ? $attr['label'] :
				ucfirst( str_replace( array( '-', '_' ), ' ', $name ) ),
			'class'       => isset( $attr['class'] ) ? $attr['class'] : '',
			'id'          => isset( $attr['id'] ) ? $attr['id'] : '',
			'description' => isset( $attr['description'] ) ? $attr['description'] : '',
			'required'    => isset( $attr['required'] ) ? true : false,
			'values'      => $values,
			'value'       => $values[0],
			'allow_null'  => isset( $attr['allow_null'] ) ? $attr['allow_null'] : true,
			'real_name'   => $name,
		);


		return array_merge( (array) $attr, $_attr );
	}


	private function normalizeData( $data ) {
		if ( empty( $data ) ) {
			return array();
		}
		if ( isset( $data[0] ) && is_object( $data[0] ) ) {
			$n_data = array();
			switch ( get_class( $data[0] ) ) {
				case 'WP_Post':
					foreach ( $data as $post ) {
						$n_data[ $post->ID ] = $post->ID . '. ' . $post->post_title;
					}
					break;
				case 'WP_Term' :
					foreach ( $data as $term ) {
						$n_data[ $term->term_id ] = $term->term_id . '. ' . $term->name;
					}
					break;
				case 'WP_User':
					foreach ( $data as $user ) {
						$n_data[ $user->ID ] = $user->ID . '. ' . $user->data->display_name .
						                       ' ( ' . $user->data->user_login . ' )';
					}
					break;
			}

			return $n_data;

		}

		return $data;
	}

	private function normalizeName( $name ) {
		if ( strpos( $name, '[' ) !== false ) {
			return preg_replace( '/^([^\[]+)(.+)/is', 'fields_tik[$1]$2', $name );
		}

		return "fields_tik[{$name}]";
	}


	private function beforeInput( $attr ) {
		wp_enqueue_style( 'fields_tik' );
		wp_enqueue_script( 'fields_tik' );

		?>
        <div class="row-tik <?php echo isset( $attr['width'] ) ? $attr['width'] : '' ?>"
        data-name="<?php esc_attr_e( $attr['real_name'] ) ?>">
        <div class="label">
        <div class="input-label">
			<?php esc_html_e( $attr['label'] ) ?>
			<?php echo $attr['required'] ? '<span class="required">*</span>' : ''; ?>
        </div>
        <div class="input-wrapper">
		<?php
	}

	private function afterInput( $attr ) {
		?>
        </div>
        </div>
		<?php if ( ! empty( $attr['description'] ) ): ?>
            <div class="description"><?php echo $attr['description'] ?></div>
		<?php endif; ?>
        </div>
		<?php
	}

}

$fields_tik = new Fields_Tik();

new AdminFields_Tik();
new AjaxQueryFields_Tik();
new OptionsFields_Tik();
new PostTypeFields_Tik();
new TaxonomyFields_Tik();
new UserFields_Tik();
new WidgetFields_Tik();

