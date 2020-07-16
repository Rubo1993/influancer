<?php
class AjaxQueryFields_Tik {
	private $args;
	private $s;
	private $page;
	private $ids;

	public function __construct() {
		add_action( 'wp_ajax_get_data_query_fields_tik', array( $this, 'getDataQuery' ) );
	}

	public function getDataQuery() {
		$this->verifyNonce();
		$this->args = isset( $_POST['query'] ) ? $_POST['query'] : null;
		$this->s    = isset( $_POST['s'] ) ? $_POST['s'] : null;
		$this->page = isset( $_POST['page'] ) ? (int) $_POST['page'] : 1;
		$this->ids  = isset( $_POST['ids'] ) ? $_POST['ids'] : array();
//		$this->ids  = array_map( function ( $id ) {
//			return (int) $id;
//		}, $this->ids );

		$call = isset( $this->args['call'] ) ? $this->args['call'] : null;
		unset( $this->args['call'], $_POST['action'] );
		switch ( $call ) {
			case 'WP_Query':
				$response = $this->getPosts();
				break;
			case 'WP_User_Query':
				$response = $this->getUsers();
				break;
			case 'WP_Term_Query':
				$response = $this->getTerms();
				break;
			case 'Font_Awesome':
				$response = $this->getFontAwesome();
				break;
			default:
				$response = array(
					array(
						'id'   => '-1',
						'text' => __( 'Error: Wrong called class', 'field-tik' )
					)
				);
		}
		exit( json_encode( $response ) );
	}

	private function verifyNonce() {
		$nonce = isset( $_POST['_'] ) ? $_POST['_'] : null;
		if ( ! wp_verify_nonce( $nonce, '_select2_ajax-tik' ) ) {
			exit( json_encode( array(
				array(
					'id'   => '-1',
					'text' => __( 'Error: Nonce Verification Error', 'field-tik' )
				)
			) ) );
		}
	}

	private function getPosts() {
		if ( empty( $this->ids ) ) {
			$this->args['posts_per_page'] = 20;
			$this->args['s']              = esc_attr( $this->s );
			$this->args['paged']          = $this->page;
		} else {
			$this->args['post__in'] = $this->ids;
		}

		$query = new WP_Query( $this->args );
		$posts = [];
		while ( $query->have_posts() ) {
			$query->the_post();
			$posts[] = array(
				'id'   => get_the_ID(),
				'text' => get_the_ID() . '. ' . get_the_title(),
			);
		}

		return $posts;
	}

	public function getUsers() {
		if ( empty( $this->ids ) ) {
			$this->args['number'] = 20;
			$this->args['search'] = $this->s ? '*' . esc_attr( $this->s ) . '*' : '';
			$this->args['paged']  = $this->page;
		} else {
			$this->args['include'] = $this->ids;
		}

		$query = new WP_User_Query( $this->args );
		$data  = $query->get_results();
		$users = [];
		foreach ( $data as $user ) {
			$users[] = array(
				'id'   => $user->ID,
				'text' => $user->ID . '. ' . $user->data->display_name .
				          ' ( ' . $user->data->user_login . ' )'
			);
		}

		return $users;
	}

	public function getTerms() {
		if ( empty( $this->ids ) ) {
			$this->args['number'] = 20;
			$this->args['search'] = esc_attr( $this->s );
			$this->args['paged']  = $this->page;
		} else {
			$this->args['term_taxonomy_id'] = $this->ids;
		}

		$query = new WP_Term_Query( $this->args );
		$terms = [];
		foreach ( $query->terms as $term ) {
			$terms[] = array(
				'id'   => $term->term_id,
				'text' => $term->term_id . '. ' . $term->name,
			);
		}

		return $terms;

	}

	public function getFontAwesome() {
		$css = @file_get_contents( FIELDS_TIK_DIR . '/assets/styles/font-awesome.min.css' );
		if ( ! empty( $this->ids ) ) {
			$this->s = substr( $this->ids[0], 3 );
		}
		preg_match_all( '/\.(fa-[\w_-]*' . preg_quote( $this->s, '/' ) . '[\w_-]*)\:before/is', $css, $matches );
		if ( empty( $matches ) ) {
			return [];
		}
		$icons = [];
		$end   = $this->page * 20;
		$start = $end - 20;
		for ( $i = $start; $i < $end; $i ++ ) {
			if ( empty( $matches[1][ $i ] ) ) {
				break;
			}
			$val     = $matches[1][ $i ];
			$icons[] = array(
				'id'   => $val,
				'text' => '<i class="fa fa-2x ' . esc_attr( $val ) . '"></i> ' .
				          '<span>' . substr( $val, 3 ) . '</span>',
			);
		}

		return $icons;
	}

}

