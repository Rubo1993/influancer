<?php /* Template Name: Blogger */ ?>
<?php
get_header();
?>
<?php
get_template_part('template-parts/header-banner');
?>
<?php
while (have_posts()):the_post();
    ?>
    <section class="you__get">
        <h2 class="tariffs__title text-center mb-5">
            <?php
            echo get_field_tik('you_will_get_title')
            ?>
        </h2>
        <div class="container">
            <div class="row justify-content-between align-items-stretch">
                <?php $you_will_get = get_field_tik('you_will_get_items');
                if (!empty($you_will_get)) {
                    foreach ($you_will_get as $items) {
                        $img = $items['itm_img'];
                        ?>
                        <div class="tariffs__tokens__item col-md-4 col-sm-12">
                            <div class="tariffs__tokens__card">
                                <div class="tariffs__tokens__top">
                                    <?php echo wp_get_attachment_image($img) ?>
                                </div>
                                <h5 class="tariffs__tokens__title">
                                    <?php
                                    echo $items['item_title'];
                                    ?>
                                </h5>
                                <div class="tariffs__tokens__text">
                                    <p>
                                        <?php
                                        echo $items['item_text']
                                        ?>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                }
                ?>
            </div>
        </div>
    </section>
    <section class="how__work">
        <h2 class="how__work__title text-center"><?php echo get_field_tik('how_it_works_title') ?>How it works?</h2>
        <div class="container">
            <div class="row">
                <?php
                $how_it_works = get_field_tik('how_it_works_items');
                if (!empty($how_it_works)) {
                    foreach ($how_it_works as $how_work) {
                        ?>
                        <div class="col-md-4 col-sm-12">
                            <div class="how__work__item">
                                <div class="how__work__item__top">
                                    <!--                                    <i class="far fa-user-circle"></i>-->
                                    <i class="far fas <?php esc_attr_e($how_work['itm_icon']) ?>"></i>
                                </div>
                                <div class="how__work__item__desc">
                                    <p>
                                        <?php echo $how_work['item_title'] ?>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                }
                ?>
            </div>
        </div>
    </section>
    <section class="register__if">
        <h3 class="h2 register__if__title text-center"><?php echo get_field_tik('register_if_title') ?></h3>
        <div class="container">
            <div class="row">
                <?php
                $register_if = get_field_tik('register_if_items');
                if (!empty($register_if)) {
                    foreach ($register_if as $reg_itm) {
                        $reg_img = $reg_itm['itm_img'];
                        ?>
                        <div class="col-md-6 col-sm-12">
                            <div class="register__if__item">
                                <div class="col-md-3 col-sm-12">
                                    <?php echo wp_get_attachment_image($reg_img) ?>
                                </div>
                                <div class="col-md-9 col-sm-12">
                                    <p>
                                      <?php echo $reg_itm['item_title'] ?>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <?php
                    }
                }
                ?>

            </div>
        </div>
    </section>
<?php
    get_template_part('template-parts/register_subscriber');
    ?>
<?php
endwhile;
wp_reset_query();
?>

<?php
get_footer();
?>
