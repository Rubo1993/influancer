<?php

class Social_Link_Gh extends WP_Widget {
	function __construct() {
		parent::__construct(
			'Social_Link_Gh',
			__( 'Social Links', 'ghost' )
		);
	}

	function widget( $args, $instance ) {
		$title = apply_filters( 'widget_title', $instance['title'] );
		echo $args['before_widget'];
		if ( ! empty( $title ) ) {
			echo $args['before_title'] . $title . $args['after_title'];
		}
		?>
        <p><?php echo $instance['text'] ?></p>
        <ul class="social">
			<?php
			$social_links = get_field_tik( 'social', 'option', array() );
			foreach ( $social_links as $link ):
				if ( $link['url'] ) : ?>
                    <li class="social__list">
                        <a href="<?php echo esc_url( $link['url'] ) ?>" class="social__link">
                            <i class="fa <?php esc_attr_e( $link['icon'] ) ?>"></i>
                        </a>
                    </li>
				<?php endif;
			endforeach; ?>
        </ul>
		<?php
		echo $args['after_widget'];
	}

	public function form( $instance ) {
		if ( isset( $instance['title'] ) ) {
			$title = $instance['title'];
		} else {
			$title = __( 'CONNECT', 'influencer' );
		}
		if ( isset( $instance['text'] ) ) {
			$text = $instance['text'];
		} else {
			$text = __( 'Let us be social', 'influencer' );
		}
		?>
        <p>
            <label for="<?php echo $this->get_field_id( 'title' ); ?>">
				<?php _e( 'Title:' ); ?>
            </label>
            <input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>"
                   name="<?php echo $this->get_field_name( 'title' ); ?>" type="text"
                   value="<?php echo esc_attr( $title ); ?>"/>
        </p>
        <p>
            <label for="<?php echo $this->get_field_id( 'text' ); ?>">
				<?php _e( 'Text:', 'influencer' ); ?>
            </label>
            <input class="widefat" id="<?php echo $this->get_field_id( 'text' ); ?>"
                   name="<?php echo $this->get_field_name( 'text' ); ?>" type="text"
                   value="<?php echo esc_attr( $text ); ?>"/>
        </p>
		<?php
	}

	public function update( $new_instance, $old_instance ) {
		$instance          = array();
		$instance['title'] = ! empty( $new_instance['title'] ) ? strip_tags( $new_instance['title'] ) : '';
		$instance['text']  = ! empty( $new_instance['text'] ) ? strip_tags( $new_instance['text'] ) : '';

		return $instance;
	}
}

add_action( 'widgets_init', function () {
	register_widget('Social_Link_Gh');
} );
