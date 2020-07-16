<?php

trait Checkbox_Tik {
	/**
	 * @param string $name
	 * @param array $attr
	 * @param array $data
	 *
	 * @return string
	 */
	public function checkbox( $name, $attr = array(), $data = array( 0, 1 ) ) {
		$attr          = $this->normalizeAttr( $attr, $name );
		$_name         = $this->normalizeName( $name );
		$attr['value'] = $attr['value'] ? $attr['value'] : $data[0];
		ob_start();
		$this->beforeInput( $attr );
		?>
        <input type="hidden" name="<?php esc_attr_e( $_name ) ?>" value="<?php esc_attr_e( $data[0] ) ?>"/>
        <label class="checkbox-wrapper-tik" tabindex="0">
            <input type="checkbox" name="<?php esc_attr_e( $_name ) ?>"
                   value="<?php esc_attr_e( $data[1] ) ?>" <?php echo $data[1] == $attr['value'] ? 'checked=""' : '' ?>
                   class="<?php echo $attr['class'] ?>"/>
            <div class="switch-tik"></div>
        </label>
		<?php
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}