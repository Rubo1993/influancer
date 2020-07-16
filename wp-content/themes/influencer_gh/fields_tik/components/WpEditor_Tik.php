<?php


trait WpEditor_Tik {
	/**
	 * @param string $name
	 * @param array $attr
	 *
	 * @return string
	 */
	public function wpEditor( $name, $attr = array() ) {
		static $i = 0;
		wp_enqueue_editor();
		$_name = $this->normalizeName( $name );
		$attr  = $this->normalizeAttr( $attr, $name );

		$attr['textarea_name'] = $_name;

		ob_start();
		$this->beforeInput( $attr );
		wp_editor( $attr['value'], $name . '_' . $i ++, $attr );
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}