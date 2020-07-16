<?php

//alfa
define( 'SVG_TIK_DIR', get_template_directory() . '/svg_tik' );
define( 'SVG_TIK_URI', get_template_directory_uri() . '/svg_tik' );


include SVG_TIK_DIR . '/includes/svg-scanner/data/AttributeInterface.php';
include SVG_TIK_DIR . '/includes/svg-scanner/data/TagInterface.php';
include SVG_TIK_DIR . '/includes/svg-scanner/data/AllowedAttributes.php';
include SVG_TIK_DIR . '/includes/svg-scanner/data/AllowedTags.php';
include SVG_TIK_DIR . '/includes/svg-scanner/Sanitizer.php';

include SVG_TIK_DIR . '/includes/SvgTik.php';
include SVG_TIK_DIR . '/includes/gh_get_svg.php';

