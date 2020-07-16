<?php /* Template Name: Pricing */ ?>
<?php
get_header();
?>
    <div class="tools">
        <nav class="nav__tools">
            <ul class="tools__block">
                <li class="tools__list">
                    <a href="#" class="tools__link">
                        <i class="fas fa-ad"></i>
                        <?php _e('For Advertiser', 'influencer'); ?>
                    </a>
                </li>
                <li class="tools__list">
                    <a href="#difference" class="tools__link">
                        <i class="fab fa-blogger"></i>
                        <?php _e(' For Blogger', 'influencer'); ?>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <section class="tariffs" id="tariffs">
        <h1 class="tariffs__title text-center"><?php echo get_field_tik('tariffs_part_title') ?></h1>
        <div class="container">
            <div class="row justify-content-between align-items-start">
                <?php
                $query = new WP_Query(array(
                    'post_type' => 'tariffs',
                    'posts_per_page' => -1,
                    'orderby' => 'menu_order',
                    'order' => 'ASC',
                ));
                while ($query->have_posts()): $query->the_post();
                    $image = get_field_tik('tariffs_tokens_img')
                    ?>
                    <div class="tariffs__item col-lg-3 col-md-6 col-sm-12">
                        <div class="tariffs__item__card">
                            <div class="tariffs__item__top">
                                <h4 class="tariffs__item__title"><?php the_title() ?></h4>
                                <strong class="tariffs__item__tokens">
                                    <?php echo get_field_tik('tariff_tokens_count') ?>
                                    <?php
                                    echo wp_get_attachment_image($image)
                                    ?>
                                </strong>
                                <p><?php echo get_field_tik('tariff_tokens_title') ?></p>
                                <h5 class="tariffs__item__description">
                                    <?php echo get_field_tik('tariff_item_description') ?>

                                </h5>
                            </div>
                            <div class="tariffs__item__details">
                                <div class="tariffs__item__details-inner">
                                    <h4><?php echo get_field_tik('1_token_cost') ?></h4>
                                    <p><?php echo get_field_tik('the_cost_text') ?></p>
                                    <h4><?php _e('From', 'influencer'); ?><?php echo get_field_tik('1_token_cost') ?><?php _e('to', 'influencer'); ?><?php echo get_field_tik('price_to') ?></h4>
                                    <?php echo get_field_tik('tariffs_item_desc') ?>
                                </div>
                            </div>
                            <div class="tariffs__item__bottom">
                                <strong class="tariffs__item__price"><?php echo get_field_tik('tariffs_cost') ?></strong>
                                <a class="tariffs__item__btn btn btn-danger get__btn"
                                   href="#"><?php _e('Choose', 'influencer'); ?></a>
                                <div class="tariffs__item__benefit">
                                    <h5>
                                        <?php _e('Benefit', 'influencer'); ?>
                                        <span><i><?php echo get_field_tik('tariffs_economy') ?></i></span>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php
                endwhile;
                wp_reset_query();
                ?>
            </div>
        </div>
    </section>


    <section class="difference" id="difference">
        <h2 class="difference__title text-center"><?php echo get_field_tik('feel_the_difference_title') ?></h2>
        <?php
        $blogger = get_field_tik('blogers_p');
        $query = new WP_Query(array(
            'post_type' => 'bloggers',
            'post__in' => [$blogger],
        ));
        while ($query->have_posts()): $query->the_post();
            $blogger_date = get_field_tik('user_itm');
            ?>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-9 col-sm-12 difference__top">
                        <div class="row justify-content-center">
                            <div class="col-md-4 col-sm-12 difference__top__item">
                                <div class="row justify-content-center">
                                    <div class="col-md-5 col-sm-4 row align-items-center">
                                        <?php echo get_the_post_thumbnail($blogger, 'big', array('class' => 'difference__avatar')) ?>
                                    </div>
                                    <div class="col-md-7 col-sm-8">
                                        <h4 class="difference__username"><?php the_title() ?></h4>
                                        <p class="difference__info"><?php echo $blogger_date['country'] . ',' . $blogger_date['city'] ?></p>
                                        <p class="difference__info"><?php echo $blogger_date['year'] ?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12 difference__top__item">
                                <div class="row justify-content-center">
                                    <div class="col-md-12 row align-items-md-center align-items-sm-start flex-md-column flex-sm-row">
                                        <h4 class="difference__followers"><?php echo $blogger_date['followers'] ?></h4>
                                        <div class="difference__info__block">
                                            <h6 class="difference__info h6"><?php _e('Followers', 'influencer'); ?></h6>
                                            <p class="difference__info"><?php _e('General audience', 'influencer'); ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12 difference__top__item">
                                <div class="row justify-content-center">
                                    <div class="col-md-12 row align-items-md-center align-items-sm-start flex-md-column flex-sm-row">
                                        <h4 class="difference__followers"><?php echo $blogger_date['coverage'] ?></h4>
                                        <div class="difference__info__block">
                                            <h6 class="difference__info h6"><?php _e('Coverage', 'influencer'); ?></h6>
                                            <p class="difference__info"><?php _e('Quality audience from Armania', 'influencer'); ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-9 col-sm-12">
                        <div class="row row_m30">
                            <div class="col-md-4 col-sm-12">
                                <div class="difference__card">
                                    <div class="difference__card__top">
                                        <i class="fas fa-street-view"></i>
                                        <h5 class="difference__card__title"><?php _e('WORK DIRECTLY', 'influencer'); ?></h5>
                                        <h3 class="difference__card__price"><?php echo $blogger_date['directly__card__price'] ?></h3>
                                        <div class="difference__card__info">
                                            <p>
                                                <?php _e('Blogger Puts Out
                                                cost of advertising
                                                for all subscribers', 'influencer'); ?>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="difference__card__footer">
                                        <h5 class="difference__card__price"><?php echo $blogger_date['directly__card__price'] ?></h5>
                                        <div class="difference__card__info">
                                            <p><?php _e('blogger fee', 'influencer'); ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <div class="difference__card">
                                    <div class="difference__card__top">
                                        <i class="far fa-building"></i>
                                        <h5 class="difference__card__title"><?php _e('WORK THROUGH THE AGENCY', 'influencer'); ?></h5>
                                        <h3 class="difference__card__price"><?php echo $blogger_date['agency__card__price'] ?></h3>
                                        <div class="difference__card__info">
                                            <p>
                                                <?php _e(' Agency will add
                                                to the bloggers fee
                                                commission from 100%', 'influencer'); ?>
                                            </p>

                                        </div>
                                    </div>
                                    <div class="difference__card__footer">
                                        <h5 class="difference__card__price"><?php echo $blogger_date['directly__card__price'] ?></h5>
                                        <div class="difference__card__info">
                                            <p><?php _e('blogger fee', 'influencer'); ?></p>
                                        </div>
                                        <h5 class="difference__card__price"><?php echo $blogger_date['agency__card__price'] ?></h5>
                                        <div class="difference__card__info">
                                            <p><?php _e('agency fee', 'influencer'); ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <div class="difference__card">
                                    <div class="difference__card__top">
                                        <i class="fas fa-sync"></i>
                                        <h5 class="difference__card__title"><?php _e('influencer WORK', 'influencer'); ?></h5>
                                        <h3 class="difference__card__price"><?php echo $blogger_date['influencer__card__price'] ?></h3>
                                        <div class="difference__card__info">
                                            <p>
                                                <?php _e('GetBlogger will select a quality
                                                audience from the total number
                                                of blogger subscribers and calculate
                                                the optimal cost of advertising', 'influencer'); ?>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="difference__card__footer">
                                        <h5 class="difference__card__price">750 $</h5>
                                        <div class="difference__card__info">
                                            <p><?php _e('blogger fee', 'influencer'); ?></p>
                                        </div>
                                        <h5 class="difference__card__price">50 $</h5>
                                        <div class="difference__card__info">
                                            <p><?php _e('invitation cost', 'influencer'); ?></p>
                                        </div>
                                        <a href="#" class="btn btn-danger get__btn ">
                                            <?php _e('Choose rate', 'influencer'); ?>
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        <?php endwhile;
        wp_reset_query();
        ?>
        <div class="difference__footer">
            <img src="<?php echo THEME_URI ?>/assets/img/icons/alert.svg" alt="">
            <p>
                <?php echo get_field_tik('difference_footer_message') ?>
            </p>
        </div>
    </section>


    <section class="tariffs__tokens">
        <div class="container">
            <div class="row justify-content-between align-items-start">
                <?php while (have_posts()): the_post(); ?>
                    <?php
                    the_content();
                    ?>
                    <?php $tariffs_tokens_item = get_field_tik('tariffs_tokens_card');
                    if (!empty($tariffs_tokens_item)) {
                        foreach ($tariffs_tokens_item as $card_itm) {
                            $card_img = $card_itm['tariffs_card_img']
                            ?>
                            <div class="tariffs__tokens__item col-md-4 col-sm-12">
                                <div class="tariffs__tokens__card">
                                    <div class="tariffs__tokens__top">
                                        <?php echo wp_get_attachment_image($card_img) ?>
                                    </div>
                                    <h5 class="tariffs__tokens__title">
                                        <?php echo $card_itm['tariffs_card_title'] ?>
                                    </h5>
                                    <div class="tariffs__tokens__text">
                                        <p>
                                            <?php echo $card_itm['tariffs_card_text'] ?>

                                        </p>
                                    </div>
                                </div>
                            </div>

                            <?php
                        }
                        ?>
                        <?php
                    } ?>
                <?php
                endwhile;
                ?>

            </div>
        </div>
        <a class="choose__rate btn btn-danger get__btn"  href="#tariffs"><?php _e('Choose rate', 'influencer'); ?></a>
        <div class="tariffs__tokens__footer">
            <div class="tariffs__tokens__footer__icon">
                <img src="<?php echo THEME_URI ?>/assets/img/icons/alert_p.svg" alt="">
            </div>
            <h5><?php echo get_field_tik('tarriff_message_title') ?></h5>
            <p>
                <?php echo get_field_tik('tarriff_message_text') ?>

            </p>
        </div>
    </section>
<?php
get_footer();
?>