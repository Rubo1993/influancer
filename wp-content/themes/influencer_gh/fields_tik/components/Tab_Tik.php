<?php

trait Tab_Tik {
	/**
	 * @param array $data
	 *
	 * @return string
	 */
	public function tab( $data = array() ) {
		ob_start();
		$i = 1;
		?>
        <div class="tab-tik">
            <nav class="nav-tab-wrapper nav-tab-wrapper-tik">
				<?php foreach ( $data as $title => $_ ) :
					$id = str_replace( ' ', '-', $title ) . '-' . $i;
					?>
                    <a class="nav-tab <?php echo $i == 1 ? 'nav-tab-active' : '' ?>"
                       href="#tab-<?php esc_attr_e( $id ) ?>">
						<?php esc_html_e( $title ) ?>
                    </a>
					<?php
					$i ++;
				endforeach; ?>
            </nav>
			<?php
			$i      = 1;
			foreach ( $data as $title => $data ) :
				$data = is_array( $data ) ? implode( $data ) : $data;
				$id = str_replace( ' ', '-', $title ) . '-' . $i;
				?>
                <div id="tab-<?php esc_attr_e( $id ) ?>" class="nav-tabs-panel nav-tabs-panel-tik"
                     style="<?php echo $i != 1 ? 'display:none' : '' ?>">
					<?php echo $data; ?>
                </div>
				<?php
				$i ++;
			endforeach;
			?>
        </div>
		<?php
		return ob_get_clean();
	}
}
