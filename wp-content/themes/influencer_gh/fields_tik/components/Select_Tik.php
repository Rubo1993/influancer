<?php

trait Select_Tik {

	/**
	 * @param string $name
	 * @param array $attr
	 * @param array $data
	 *
	 * @return string
	 */
	public function select( $name, $attr, $data ) {
		wp_enqueue_script( 'select2' );
		wp_enqueue_style( 'select2' );
		$attr = $this->normalizeAttr( $attr, $name );
		$data = $this->normalizeData( $data );
		$name = $this->normalizeName( $name );

		ob_start();
		$this->beforeInput( $attr );
		?>

        <select name="<?php esc_attr_e( $name ) ?>"
                class="select2-tik <?php echo $attr['class'] ?>"
			<?php echo $attr['allow_null'] ? 'data-allow-null="true"' : '' ?>
			<?php echo ! empty( $attr['multiple'] ) ? 'multiple' : '' ?>
			<?php echo $attr['id'] ? "id='{$attr['id']}'" : '' ?>
			<?php echo $attr['required'] ? "required=''" : '' ?> >
			<?php if ( $attr['allow_null'] ): ?>
                <option value=""></option>
			<?php endif ?>
			<?php foreach ( $data as $key => $value ) : ?>
                <option value="<?php esc_attr_e( $key ) ?>"
					<?php echo in_array( $key, $attr['values'] ) ? "selected=''" : '' ?> >
					<?php esc_html_e( strip_tags( $value ) ) ?>
                </option>
			<?php endforeach; ?>
        </select>
		<?php
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}


