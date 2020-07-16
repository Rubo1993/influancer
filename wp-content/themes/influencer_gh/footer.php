<?php get_template_part('./template-parts/bloger_registration-popup') ?>
<?php get_template_part('./template-parts/advertiser-registration-popup') ?>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="footer__col col-md-3 col-sm-12">
                <h6 class="footer__col__title"><? ?><?php _e('Influence', 'influence'); ?></h6>
                <?php
                wp_nav_menu(array(
                    'theme_location' => 'footer-menu',
                    'depth' => 1,
                    'menu_class' => 'footer__nav',
                    'wp_nav_menu_items' => 'footer__nav__list',
                    'fallback_cb' => 'Bootstrap_Nav_Menu_Tik::fallback',
                    'walker' => new Bootstrap_Nav_Menu_Tik(),
                ));
                ?>
            </div>
            <div class="footer__col col-md-3 col-sm-12">
                <h6 class="footer__col__title">FEATURES</h6>
                <ul class="footer__nav">
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Find Influencers</a></li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Influencer Analysis</a></li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Manage Relationships</a>
                    </li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Measure Campaigns</a></li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">For Influencers</a></li>
                </ul>
            </div>
            <div class="footer__col col-md-3 col-sm-12">
                <h6 class="footer__col__title">SOLUTIONS</h6>
                <ul class="footer__nav">
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Instagram</a></li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Youtube</a></li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Pinterest</a></li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Tik Tok</a></li>
                </ul>
            </div>

            <div class="footer__col col-md-3 col-sm-12">

                <!--                --><?php //dynamic_sidebar('footer-connect') ?>

                <h6 class="footer__col__title">CONNECT</h6>
                <ul class="footer__nav">
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Blog</a></li>
                    <li class="footer__nav__list"><a href="#" class="footer__nav__link">Resources</a></li>
                </ul>
                <ul class="social">
                    <?php
                    $social_links = get_field_tik('social', 'option', array());
                    if (!empty($social_links)) {
                        foreach ($social_links as $link) {
                            if ($link['url']) {
                                ?>
                                <li class="social__list">
                                    <a href="<?php echo esc_url($link['url']['url']) ?>" target="_blank"
                                       class="social__link">
                                        <i class="fab <?php esc_attr_e($link['icon']) ?>"></i>
                                    </a>
                                </li>

                                <?php
                            }
                        }
                    }
                    ?>
                </ul>
            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <p>&copy; 2020 «Influencer»</p>
        </div>
    </div>

    <!--register modal start-->
    <div class="modal fade" id="successfully_registered_modal" tabindex="-1" role="dialog" aria-labelledby=""
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel"><?php _e('Successfully registered', 'influencer'); ?></h4>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><?php _e('You have registered on the site ', 'influencer') ?><span
                                class="navbar-brand"> « <?php echo get_option('blogname') ?> » </span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal"><?php _e('Close', 'influencer'); ?></button>
                </div>
            </div>
        </div>
    </div>
    <!--register modal end-->

    <?php
    require  THEME_DIR . '/modals/modal-register-subscriber.php'
    ?>
</footer>
</div>
<?php wp_footer(); ?>
</body>

</html>