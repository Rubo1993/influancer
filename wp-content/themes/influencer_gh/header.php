<!doctype html>
<html <?php language_attributes() ?>>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="..."/>
    <meta name="description" content="..."/>
    <meta name="author" content="GHOST SERVICES LLC"/>
    <title>Influencer</title>


    <?php wp_head() ?>
</head>
<body <?php body_class() ?>>
<div class="wrapper">
    <header class="header">
        <nav class="navbar navbar-expand-lg">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span></span><span></span><span></span>
            </button>
            <a class="navbar-brand" href="<?php echo home_url() ?>">Influencer</a>
                <?php
                wp_nav_menu( array(
                    'theme_location'  => 'header-menu',
                    'depth'           => 2,
                    'container'       => 'div',
                    'container_class' => 'collapse navbar-collapse',
                    'container_id'    => 'navbarNavDropdown',
                    'menu_class'      => 'navbar-nav',
                    'fallback_cb'     => 'Bootstrap_Nav_Menu_Tik::fallback',
                    'walker'          => new Bootstrap_Nav_Menu_Tik(),
                ) );
                ?>

            <div class="dropdown">
                <button class="btn btn-danger get__btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Get Started
                </button>
                <div class="dropdown-menu dropdown-menu-right get__btn__drop" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#advertiserRegistrationPopup">Advertiser</a>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#bloggerRegistrationPopup">Blogger</a>
                </div>
            </div>
        </nav>
    </header>
    <?php get_template_part('./template-parts/popup-registration') ?>
