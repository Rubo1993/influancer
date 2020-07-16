<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <h1 class="banner__title">
                    <?php echo get_field_tik('header_title','option') ?>
                </h1>
                <p class="banner__desc">
                    <?php echo get_field_tik('header_text','option') ?>
                </p>
                <?php get_template_part('./template-parts/registration-form'); ?>

            </div>
            <div class="col-md-6 col-sm-12">
                <div class="top__users">
                    <div class="row">
                        <?php
                        $bloggers = get_field_tik('blogers','option');
                        $blogger_1 = $bloggers['bloger_1'];
                        $blogger_2 = $bloggers['bloger_2'];
                        $blogger_3 = $bloggers['bloger_3'];
                        $blogger_4 = $bloggers['bloger_4'];
                        $blogger_5 = $bloggers['bloger_5'];
                        $k = 0;
                        $query = new WP_Query(array(
                            'post_type' => 'bloggers',
                            'post__in' => [$blogger_1, $blogger_2, $blogger_3, $blogger_4, $blogger_5],
                            'posts_per_page' => -1,
                        ));
                        while ($query->have_posts()): $query->the_post();
                            $k++;
                            $data = get_field_tik('user_itm');
                            if ($k == 1) {
                                ?>
                                <div class="top__user__item">
                                    <?php the_post_thumbnail() ?>
                                    <div class="like__com">
                                        <div class="like__count">
                                            <i class="fas fa-heart"></i>
                                            <?php
                                            ?>
                                            <div class="like__count__text"><?php echo $data['itm_like_count'] ?></div>
                                        </div>
                                        <div class="comm__count">
                                            <i class="fas fa-comment"></i>
                                            <div class="like__count__text"><?php echo $data['itm_comment_count'] ?></div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                                ?>
                            <?php } elseif ($k == 2) {
                                ?>
                                <div class="top__user__item">
                                    <?php the_post_thumbnail() ?>
                                    <div class="payback">
                                        <p class="payback__number h4"><?php echo $data['itm_percent'] ?></p>
                                        <p class="payback__text"><?php echo $data['itm_payback_text'] ?></p>
                                    </div>
                                </div>
                                <?php
                            } elseif ($k == 3) {
                                ?>
                                <div class="top__user__item">
                                    <?php the_post_thumbnail() ?>
                                    <div class="like__com">
                                        <div class="like__count">
                                            <i class="fas fa-heart"></i>
                                            <div class="like__count__text"><?php echo $data['itm_like_count'] ?></div>
                                        </div>
                                        <div class="comm__count">
                                            <i class="fas fa-comment"></i>
                                            <div class="like__count__text"><?php echo $data['itm_comment_count'] ?></div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                            } elseif ($k == 4) {
                                ?>
                                <div class="top__user__item">
                                    <?php the_post_thumbnail() ?>
                                    <div class="payback">
                                        <p class="payback__number h4"><?php echo $data['itm_percent'] ?></p>
                                        <p class="payback__text"><?php echo $data['itm_payback_text'] ?></p>
                                    </div>
                                </div>
                                <?php
                            } elseif ($k == 5) {
                                ?>
                                <div class="top__user__item">
                                    <?php the_post_thumbnail() ?>
                                    <div class="payback">
                                        <p class="payback__number h4"><?php echo $data['itm_percent'] ?></p>
                                        <p class="payback__text"><?php echo $data['itm_payback_text'] ?></p>
                                    </div>
                                    <div class="like__com like__com__view">
                                        <div class="view__count">
                                            <i class="far fa-eye"></i>
                                            <div class="like__count__text"><?php echo $data['bloggers_view_count'] ?> </div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                            }
                            ?>
                        <?php
                        endwhile;
                        wp_reset_query();
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>