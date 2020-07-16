<?php

trait File_Tik {
	/**
	 * @param string $name
	 * @param array $attr
	 *
	 * @return string
	 */

	public function file( $name, $attr = array() ) {
		wp_enqueue_media();

		$attr = $this->normalizeAttr( $attr, $name );
		$name = $this->normalizeName( $name );

		ob_start();
		$this->beforeInput( $attr );
		?>
        <div class="add-file-field-tik <?php echo $attr['class'] ?>"
			<?php echo isset( $attr['type'] ) ? "data-type='{$attr['type']}'" : '' ?>>
            <div class="attachment-wrapper">
				<?php
				echo wp_get_attachment_image( $attr['value'], 'thumbnail', true );
				?>
                <span class="text">
                <?php echo basename( wp_get_attachment_url( $attr['value'] ) ) ?>
            </span>
                <a href="#" class="delete-file-tik">
                    <i class="fa fa-trash"></i>
                </a>

            </div>
            <input type="hidden" class="file-input"
                   value="<?php echo $attr['value'] ?>" name="<?php echo $name ?>">
        </div>

		<?php
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}