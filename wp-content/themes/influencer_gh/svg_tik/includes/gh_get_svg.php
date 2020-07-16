<?php
function gh_get_svg( $attachment_id, $attr = array() ) {
	$image_url = wp_get_attachment_image_url( $attachment_id );
	$svg_id    = SvgTik::urlToSvgId( $image_url ) ;
	$attr['class'] = isset( $attr['class'] ) ? "gh_svg {$attr['class']}" : 'gh_svg';
	$upload_dir    = wp_upload_dir();
	$baseurl       = $upload_dir['baseurl'];
	$html          = '<svg ';
	foreach ( $attr as $name => $value ) {
		$html .= " $name=" . '"' . esc_attr( $value ) . '"';
	}
	$html .= 'class="gh_svg ' . $attr['class'] . '"';
	$html .= '>';
	$html .= '<use xlink:href="' . $baseurl . '/icons-tik.svg#' . esc_attr( $svg_id ) . '" xmlns:xlink="http://www.w3.org/1999/xlink"></use>';
	$html .= '</svg>';

	return $html;
}