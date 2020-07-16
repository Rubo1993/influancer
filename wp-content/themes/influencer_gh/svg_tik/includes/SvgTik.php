<?php

class SvgTik {

	public function __construct() {
		add_filter( 'upload_mimes', array( $this, 'addSvgMimType' ) );
		add_filter( 'wp_check_filetype_and_ext', array( $this, 'addFileTypeAndExt' ), 10, 3 );
		add_filter( 'image_downsize', array( $this, 'fixSvgWidth' ), 10, 2 );
		add_filter( 'wp_mime_type_icon', array( $this, 'addIconSupportInMedia' ), 10, 3 );
		add_action( 'admin_head', array( $this, 'svgAdminStyles' ) );

		add_filter( 'wp_handle_upload', array( $this, 'handleUpload' ) );
		add_action( 'delete_attachment', array( $this, 'handleDelete' ) );
	}


	public function addSvgMimType( $mimes ) {
		$mimes['svg'] = 'image/svg+xml';

		return $mimes;
	}

	public function addFileTypeAndExt( $data, $file, $filename ) {
		$file_type = wp_check_filetype( $filename );
		if ( $file_type['ext'] === 'svg' && $file_type['type'] === 'image/svg+xml' ) {
			$data['ext']  = 'svg';
			$data['type'] = 'image/svg+xml';
		}

		return $data;
	}

	public function handleUpload( $file ) {
		if ( $file['type'] === 'image/svg+xml' ) {
			$dirty_svg = @file_get_contents( $file['file'] );
			if ( $dirty_svg ) {
				$clean_svg = $this->cleanSvg( $dirty_svg );

				if ( $clean_svg ) {
					file_put_contents( $file['file'], $clean_svg );
				}
				$id = $this->urlToSvgId( $file['url'] );
				$this->saveToSingleFile( $clean_svg, $id );
			}

		}

		return $file;

	}

	public function handleDelete( $id ) {
		$url        = wp_get_attachment_url( $id );
		$id         = $this->urlToSvgId( $url );
		$upload_dir = wp_upload_dir();

		$icons = @file_get_contents( $upload_dir['basedir'] . '/icons-tik.svg' );
		if ( $icons ) {
			$icons = $this->removeIconIfExists( $icons, $id );

			file_put_contents( $upload_dir['basedir'] . '/icons-tik.svg', $icons );
		}
	}

	private function cleanSvg( $dirty_svg ) {
		$sanitizer = new enshrined\svgSanitize\Sanitizer();
		$sanitizer->removeRemoteReferences( true );
		$sanitizer->minify( true );
		$sanitizer->removeXMLTag( true );

		$clean_svg = $sanitizer->sanitize( $dirty_svg );

		if ( ! $clean_svg ) {
			return $clean_svg;
		}

		$allowed_svg_attr = [ 'viewBox', 'fill', 'xmlns:xlink', 'xmlns' ];
		$clean_svg        = $this->cleanAttributes( $clean_svg, $allowed_svg_attr );

		$clean_svg = preg_replace( '#<g>[\n\r\t\s]+</g>#is', '', $clean_svg );
		$clean_svg = preg_replace( '#[\n\r\t\s]+#is', ' ', $clean_svg );
		$clean_svg = str_replace( '> <', '><', $clean_svg );

		return $clean_svg;
	}

	private function cleanAttributes( $svg, $allowed_svg_attr ) {
		$svg_tag = '<svg';
		foreach ( $allowed_svg_attr as $attr ) {
			preg_match( "#<svg[^>]+" . preg_quote( $attr, '#' ) . "=['\"]([^'\"]+)['\"]#is", $svg, $m );
			if ( ! empty( $m ) ) {
				$svg_tag .= ' ' . $attr . '="' . esc_attr( $m[1] ) . '"';
			}
		}
		$svg_tag .= '>';

		return preg_replace( '#<svg[^>]+>#is', $svg_tag, $svg );

	}

	private function saveToSingleFile( $svg, $id ) {
		$upload_dir = wp_upload_dir();

		$icons = @file_get_contents( $upload_dir['basedir'] . '/icons-tik.svg' );

		if ( $icons ) {
			$icons = $this->removeIconIfExists( $icons, $id );
			$icons = str_replace( '</svg>', '', $icons );
		} else {
			$icons = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve">';
		}

		$allowed_svg_attr = [ 'viewBox', 'fill' ];
		$svg              = $this->cleanAttributes( $svg, $allowed_svg_attr );

		$svg = preg_replace( '#<svg#', '<symbol id="' . esc_attr( $id ) . '"', $svg );
		$svg = str_replace( '</svg>', '</symbol>', $svg );

		$icons .= "\t" . $svg . "\r\n</svg>";


		file_put_contents( $upload_dir['basedir'] . '/icons-tik.svg', $icons );
	}

	private function removeIconIfExists( $icons, $id ) {
		return preg_replace( '#^[\s\t]*<symbol[^>]+id="' . preg_quote( $id, '#' ) . '".*?</symbol>[\r\n]*#ism', '', $icons );
	}


	public static function urlToSvgId( $url ) {
		$upload_dir = wp_upload_dir();
		$upload_dir['baseurl'];
		$id = 'svg' . str_replace( $upload_dir['baseurl'], '', $url );
		$id = str_replace( '/', '_', $id );
		$id = str_replace( '.svg', '', $id );

		return $id;
	}

	public function fixSvgWidth( $out, $id ) {
		$image_url = wp_get_attachment_url( $id );
		$file_type = wp_check_filetype( $image_url );

		if ( 'svg' !== $file_type['ext'] ) {
			return false;
		}

		return array( $image_url, null, null, false );
	}

	public function addIconSupportInMedia( $icon, $mime, $post_id ) {
		if ( $mime == 'image/svg+xml' ) {
			$icon = wp_get_attachment_url( $post_id );
		}

		return $icon;
	}


	public function svgAdminStyles() {
		echo '
		<style type="text/css">
		    .wp-admin .thumbnail img[src$=".svg"], img[src$=".svg"].attachment-post-thumbnail { 
		      width: 100% !important; 
		      height: auto !important;
		    }
        </style>';
	}

}

new SvgTik();
