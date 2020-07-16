<?php


trait FontAwesome_Tik {
	/**
	 * @param string $name
	 * @param array $attr
	 *
	 * @return string
	 */
	public function fontAwesome( $name, $attr = array() ) {
		$attr['class'] = isset( $attr['class'] ) ? $attr['class'] . ' fontawesome-tik' : 'fontawesome-tik';

		return $this->selectAjax( $name, $attr, array(
			'call' => 'Font_Awesome'
		) );
	}
}