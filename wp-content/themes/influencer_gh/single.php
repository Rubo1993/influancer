<?php
get_header();
?>
	<div >

			<?php
			while ( have_posts() ) : the_post();

			endwhile;
			?>

	</div>

get_footer();
