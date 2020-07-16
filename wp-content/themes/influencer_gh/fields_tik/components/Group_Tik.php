<?php


trait Group_Tik {


	/**
	 * @param $name
	 * @param array $attr
	 * @param Closure $callback_func
	 *
	 * @return string
	 */
	public function group( $name, $attr, $callback_func ) {
		$fields_group_tik = new GroupFields_Tik( $name );

		$attr = $this->normalizeAttr( $attr, $name );

		ob_start();
		$this->beforeInput( $attr );
		?>
        <div class="group-tik <?php esc_attr_e( $attr['class'] ) ?>"
             data-name="<?php esc_attr_e( $name ) ?>">
			<?php
			$html = call_user_func( $callback_func, $fields_group_tik );
			echo preg_replace( '/(\sname=[\'"]fields_tik)/is', "$1[{$name}]", $html );
			?>
        </div>

		<?php
		$this->afterInput( $attr );


		return ob_get_clean();
	}
}