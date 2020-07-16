<?php

trait Repeater_Tik {
	/**
	 * @param $name
	 * @param array $attr
	 * @param Closure $callback_func
	 *
	 * @return string
	 */

	public function repeater( $name, $attr, $callback_func ) {
		$fields_group_tik = new GroupFields_Tik( $name );

		$attr = $this->normalizeAttr( $attr, $name );


		if ( isset( $attr['type'] ) && 'gallery' == $attr['type'] ) {
			$attr['class'] .= ' gallery';
		}

		$data        = get_field_tik( $name );
		$items_count = is_array( $data ) ? count( get_field_tik( $name ) ) : 1;

		if ( ! empty( $attr['min'] ) ) {
			$items_count = $items_count < $attr['min'] ? $attr['min'] : $items_count;
		} else {
			$attr['min'] = - 1;
		}
		if ( ! empty( $attr['max'] ) ) {
			$items_count = $items_count > $attr['max'] ? $attr['max'] : $items_count;
		} else {
			$attr['max'] = - 1;
		}

		ob_start();
		$this->beforeInput( $attr );
		?>
        <div class="repeater-tik <?php esc_attr_e( $attr['class'] ) ?>"
             data-name="<?php esc_attr_e( $name ) ?>"
             data-min="<?php echo (int) $attr['min'] ?>"
             data-max="<?php echo (int) $attr['max'] ?>">
            <ul class="repeater-tik-list">
				<?php for ( $key = 0; $key < $items_count; $key ++ ) : ?>
                    <li class="repeater-tik-item" data-name="<?php esc_attr_e( $name ) ?>"
                        data-key="<?php echo $key ?>">
                        <sup><?php echo $key + 1 ?>.</sup>
						<?php
						$fields_group_tik->setKey( $key );
						$html = call_user_func( $callback_func, $fields_group_tik );
						echo preg_replace( '/(\sname=[\'"]fields_tik)/is', "$1[{$name}][{$key}]", $html );
						?>
                        <button type="button" class="repeater-tik-delete-item"
                                title="<?php _e( 'Remove', 'fields_tik' ) ?>">
                            <i class="fa fa-trash"></i>
                        </button>
                    </li>
				<?php endfor; ?>
            </ul>
            <button type="button" class="button button-primary repeater-tik-new-item">
                <i class="fa fa-plus"></i>
				<?php _e( 'Add', 'fields_tik' ) ?>
            </button>
        </div>

		<?php
		$this->afterInput( $attr );


		return ob_get_clean();
	}
}