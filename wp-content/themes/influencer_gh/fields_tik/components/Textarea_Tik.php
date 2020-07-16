<?php

trait Textarea_Tik {

	/**
	 * @param string $name
	 * @param array $attr
	 *
	 * @return string
	 */
	public function textarea( $name, $attr = array() ) {
		$attr = $this->normalizeAttr( $attr, $name );
		$name = $this->normalizeName( $name );
		ob_start();
		$this->beforeInput( $attr );
		?>

        <textarea name="<?php esc_attr_e( $name ) ?>"
                  class="textareat-tik <?php echo $attr['class'] ?>"
                  rows="<?php echo isset( $attr['rows'] ) ? (int) $attr['rows'] : 10 ?>"
		<?php echo $attr['id'] ? "id='{$attr['id']}'" : '' ?>
			<?php echo $attr['required'] ? 'required=""' : '' ?> ><?php echo esc_textarea( $attr['value'] ) ?></textarea>
		<?php
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}