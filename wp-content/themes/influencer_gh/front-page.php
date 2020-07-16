<?php get_header();
$front_page_id = get_the_ID();
?>
<?php
get_template_part('template-parts/header-banner');
?>
<section class="software">
    <div class="container">

        <h2 class="software__title h1 text-center">
            <?php echo get_field_tik('software_title') ?>
        </h2>
        <ul class="nav nav-pills software__tabs mb-5" id="pills-tab" role="tablist">
            <?php
            $software = get_field_tik('software');
            if (!empty($software)) {
                foreach ($software as $item) {
                    $tabs = strtolower(wp_strip_all_tags($item['software_menu_itm'] . "_tab"));
                    ?>
                    <li class="nav-item">
                        <a class="nav-link " id="pills-find-tab" data-toggle="pill" href="#<?php echo $tabs ?>"
                           role="tab"
                           aria-controls="pills-find" aria-selected="true"><i
                                    class="<?php echo $item['software_icon'] ?>"></i> <?php echo $item['software_menu_itm'] ?>
                        </a>
                    </li>
                    <?php
                }
            }
            ?>
        </ul>
        <div class="tab-content software__content" id="pills-tabContent">
            <?php if (!empty($software)) {
                $i = 1;
                foreach ($software as $software_desc) {
                    $i++;
                    $tabs = strtolower(wp_strip_all_tags($software_desc['software_menu_itm'] . "_tab"));
                    if ($i == 2) {
                        ?>
                        <div class="tab-pane fade show active" id="<?php echo $tabs ?>" role="tabpanel"
                             aria-labelledby="pills-find-tab">
                            <div class="row">
                                <div class="col-md-4 col-sm-12">
                                    <h5 class="software__item__title h5">
                                        <?php echo $software_desc['software_desc_title'] ?>
                                    </h5>
                                    <p class="software__item__desc">
                                        <?php echo $software_desc['software_description'] ?>
                                    </p>
                                    <!--                                    <a href="#" class="btn btn-danger get__btn ">-->
                                    <!--                                        Learn More <i class="fas fa-long-arrow-alt-right"></i>-->
                                    <!--                                    </a>-->
                                </div>
                                <div class="col-md-8 col-sm-12">
                                    <?php
                                    echo wp_get_attachment_image($software_desc['software_img'], 'big', false, array("class" => "soft__img"))
                                    ?>
                                </div>
                            </div>
                        </div>
                        <?php
                    } else {
                        ?>
                        <div class="tab-pane fade " id="<?php echo $tabs ?>" role="tabpanel"
                             aria-labelledby="pills-find-tab">
                            <div class="row">
                                <div class="col-md-4 col-sm-12">
                                    <h5 class="software__item__title h5">
                                        <?php echo $software_desc['software_desc_title'] ?>
                                    </h5>
                                    <p class="software__item__desc">
                                        <?php echo $software_desc['software_description'] ?>
                                    </p>
                                    <a href="#" class="btn btn-danger get__btn ">
                                        Learn More <i class="fas fa-long-arrow-alt-right"></i>
                                    </a>
                                </div>
                                <div class="col-md-8 col-sm-12">
                                    <?php
                                    echo wp_get_attachment_image($software_desc['software_img'], 'large', false, array("class" => "soft__img"))
                                    ?>
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                    <?php
                    ?>
                    <?php
                }
                ?>
                <?php
            }
            ?>
        </div>
    </div>
</section>
<section class="auto__pay">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="row">
                    <?php
                    $auto_pay_img = get_field_tik('auto_pay_img') ? get_field_tik('auto_pay_img') : '';
                    $auto_pay_title = get_field_tik('auto_pay_title') ? get_field_tik('auto_pay_title') : '';
                    $auto_pay_text = get_field_tik('auto_pay_text') ? get_field_tik('auto_pay_text') : '';
                    ?>
                    <div class="col-md-6 col-sm-12 text-center">
                        <!--                        <img src="img/autopay.png" class="auto__pay__img"/>-->
                        <?php echo wp_get_attachment_image($auto_pay_img, 'medium', false, array("class" => "auto__pay__img")) ?>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <h3 class="h3 auto__pay__title">
                            <?php echo $auto_pay_title ?>
                        </h3>
                        <p class="auto__pay__desc">
                            <?php echo $auto_pay_text ?>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="secure">
    <h3 class="h3 secure__title">
        <?php echo get_field_tik('secure_transactions_title') ?>
    </h3>
    <div class="container">
        <div class="row secure__item__block">

            <?php
            $secure_transactions_itms = get_field_tik('secure_transactions_itms');
            if (!empty($secure_transactions_itms)) {
                foreach ($secure_transactions_itms as $itm) {
                    $icon = $itm['secure_transactions_icon'];
                    ?>
                    <div class="secure__item col-md-4 col-sm-12">
                        <div class="secure__item__circle">
                            <i class="<?php echo wp_strip_all_tags($icon) ?>"></i>
                        </div>
                        <h5 class="h5 secure__item__text"><?php echo $itm['secure_transactions_name'] ?></h5>
                    </div>

                    <?php
                }
            }
            ?>
        </div>
        <div class="row">
            <div class="col-md-12 ">
                <div class="row justify-content-center">
                    <div class="col-md-6 secure__desc">
                        <?php echo get_field_tik('secure_transactions_text') ?>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<section class="demo">
    <h2 class="demo__title text-center h2"><?php echo get_field_tik('demo_part_title') ?></h2>
    <p class="demo__desc text-center">
        <?php echo get_field_tik('demo_part_text') ?>
    </p>
    <a href="#" data-target="#advertiserRegistrationPopup" data-toggle="modal"
       class="btn btn-danger get__btn "><?php _e('Schedule A Demo', 'influencer') ?>
        <i class="fas fa-long-arrow-alt-right"></i>
    </a>
</section>
<?php get_footer(); ?>
