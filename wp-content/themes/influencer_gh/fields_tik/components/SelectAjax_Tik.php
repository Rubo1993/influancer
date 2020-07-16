<?php

trait SelectAjax_Tik {
	/**
	 * @param string $name
	 * @param array $attr
	 * @param array|string $query_args
	 *
	 * @return string
	 */
	public function selectAjax( $name, $attr = array(), $query_args = '' ) {
		wp_enqueue_script( 'select2' );
		wp_enqueue_style( 'select2' );
		$attr = $this->normalizeAttr( $attr, $name );
		$name = $this->normalizeName( $name );

		$query_args = is_array( $query_args ) ? $query_args : array( 'data' => $query_args );

		ob_start();
		$this->beforeInput( $attr );
		?>
        <div class="select2_ajax_wrapper-tik">
            <template>
				<?php echo json_encode( array(
					'query'  => $query_args,
					'values' => $attr['values'],
					'_'      => wp_create_nonce( '_select2_ajax-tik' ),
				) ) ?>
            </template>
            <select name="<?php esc_attr_e( $name ) ?>"
				<?php echo $attr['allow_null'] ? 'data-allow-null="true"' : '' ?>
                    class="select2_ajax-tik <?php echo $attr['class'] ?>"
				<?php echo $attr['id'] ? "id='{$attr['id']}'" : '' ?>
				<?php echo $attr['required'] ? "required=''" : '' ?> >
				<?php if ( $attr['allow_null'] ): ?>
                    <option value=""></option>
				<?php endif ?>
            </select>
        </div>
		<?php
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}

