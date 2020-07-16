<?php

trait Input_Tik {

	/**
	 * @param string $name
	 * @param array $attr
	 *
	 * @return string
	 */
	function input( $name, $attr = array() ) {
		$type = isset( $attr['type'] ) ? $attr['type'] : 'text';
		switch ( $type ) {
			case 'date':
			case 'datepicker':
				wp_enqueue_script( 'jquery-ui-datepicker' );
				wp_enqueue_style( 'jquery-ui' );
				wp_enqueue_script( 'fields_tik' );
				$attr['class'] = isset( $attr['class'] ) ? $attr['class'] : '';
				$attr['class'] .= ' datepicker-input-tik';
				$type          = 'text';
				break;
			case 'color':
			case 'colorpicker':
				wp_enqueue_script( 'wp-color-picker' );
				wp_enqueue_script( 'fields_tik' );
				$attr['class'] = isset( $attr['class'] ) ? $attr['class'] : '';
				$attr['class'] .= ' colorpicker-input-tik';
				$type          = 'text';
				break;
			case 'checkbox':
				return $this->checkbox( $name, $attr );
			case 'file':
			case 'image':
				return $this->file( $name, $attr );

		}
		$attr = $this->normalizeAttr( $attr, $name );

		$_name = $this->normalizeName( $name );

		ob_start();
		$this->beforeInput( $attr );
		?>
        <input type="<?php esc_attr_e( $type ) ?>" name="<?php esc_attr_e( $_name ) ?>"
               value="<?php esc_attr_e( $attr['value'] ) ?>"
               class="<?php esc_attr_e( $attr['class'] ) ?>"/>

		<?php
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}