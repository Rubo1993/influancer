<?php

trait Link_Tik {
	/**
	 * @param string $name
	 * @param array $attr
	 *
	 * @return string
	 */
	public function link( $name, $attr = array() ) {
		wp_enqueue_style( 'editor-buttons' );

		static $first = false;
		if ( ! $first ) {
			$first = true;
			wp_editor( '', 'link-textarea-tik', array(
				'tinymce'       => false,
				'media_buttons' => false,
				'quicktags'     => array( 'buttons' => 'link' )
			) );
		}

		$attr  = $this->normalizeAttr( $attr, $name );
		$_name = $this->normalizeName( $name );

		$defaults      = array(
			'url'    => '',
			'text'   => '',
			'target' => '',
		);
		$attr['value'] = is_array( $attr['value'] ) ? $attr['value'] : array();
		$attr['value'] = array_merge( $defaults, $attr['value'] );

		ob_start();
		$this->beforeInput( $attr );
		?>
        <div class="link-tik <?php echo $attr['class'] ?>">
            <div class="link-wrap">
                <a class="link-btn-tik" href="#" title="Edit">
                    <i class="fa fa-link fa-2x"></i>
                </a>
                <span class="link-title"><?php echo $attr['value']['text'] ?></span>
                <a class="link-url" href="<?php echo esc_url( $attr['value']['url'] ) ?>"
                   target="_blank"><?php echo $attr['value']['url'] ?></a>
            </div>
            <input type="hidden" class="link-input link-input-url" name="<?php esc_attr_e( $_name ) ?>[url]"
                   value="<?php esc_attr_e( $attr['value']['url'] ) ?>">
            <input type="hidden" class="link-input link-input-text" name="<?php esc_attr_e( $_name ) ?>[text]"
                   value="<?php esc_attr_e( $attr['value']['text'] ) ?>">
            <input type="hidden" class="link-input link-input-target" name="<?php esc_attr_e( $_name ) ?>[target]"
                   value="<?php esc_attr_e( $attr['value']['target'] ) ?>">
        </div>
		<?php
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}