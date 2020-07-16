<?php

trait Location_Tik {
	/**
	 * @param string $name
	 * @param array $attr
	 *
	 * @return string
	 */

	public function location( $name, $attr = array() ) {
		wp_enqueue_script( 'placepicker_tik' );

		$map_key = defined( 'MAP_KEY_FIELDS_TIK' ) ? MAP_KEY_FIELDS_TIK : '';
		$map_key = apply_filters( 'map_key_fields_tik', $map_key );
		wp_enqueue_script( 'google_map', "https://maps.googleapis.com/maps/api/js?key={$map_key}&libraries=places" );

		$attr = $this->normalizeAttr( $attr, $name );
		$name = $this->normalizeName( $name );

		$defaults      = array(
			'location_name' => '',
			'latitude'      => '',
			'longitude'     => '',
		);
		$attr['value'] = is_array( $attr['value'] ) ? $attr['value'] : array();
		$attr['value'] = array_merge( $defaults, $attr['value'] );

		ob_start();
		$this->beforeInput( $attr );
		if ( $map_key ):
			?>
            <div class="location-tik <?php echo $attr['class'] ?>">
                <div class="input-wrapper">
                    <button type="button" class="toggle_placepicker_fields_tik">
                        <i class="fa fa-globe"></i>
                    </button>
                    <input class="placepicker placepicker_fields_tik"
                           name="<?php esc_attr_e( $name ) ?>[location_name]"
                           value="<?php esc_attr_e( $attr['value']['location_name'] ) ?>">
                    <input type="text" class="latitude" readonly
                           value="<?php esc_attr_e( $attr['value']['latitude'] ) ?>"
                           name="<?php esc_attr_e( $name ) ?>[latitude]">
                    <input type="text" class="longitude" readonly
                           value="<?php esc_attr_e( $attr['value']['longitude'] ) ?>"
                           name="<?php esc_attr_e( $name ) ?>[longitude]">
                </div>
                <div style="display: none" class="placepicker-map-wrapper">
                    <div class="placepicker-map placepicker-map_fields_tik"></div>
                </div>
            </div>
		<?php else: ?>
            <div class="fields-tik-error">
                GoogleMap API key not found. <br>
                Please add this code in yor theme functions.php
                <pre>
add_filter('map_key_fields_tik', function ($key){
    return 'Your Google Map API Key';
});
</pre>
                or
                <pre>define( 'MAP_KEY_FIELDS_TIK', 'Your Google Map API Key' );</pre>
            </div>
		<?php
		endif;
		$this->afterInput( $attr );

		return ob_get_clean();
	}
}