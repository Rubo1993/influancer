<?php
define('THEME_DIR', get_template_directory());
define('THEME_URI', get_template_directory_uri());

require THEME_DIR . '/fields_tik/index.php';
require THEME_DIR . '/svg_tik/index.php';
require THEME_DIR . '/includes/Bootstrap_Nav_Menu_Tik.php';
require THEME_DIR . '/includes/latin-slug.php';
require THEME_DIR . '/includes/widgets/Social_Link_Gh.php';
require THEME_DIR . '/includes/custom-fields/theme-options.php';
require THEME_DIR . '/includes/custom-fields/front-page.php';
require THEME_DIR . '/includes/custom-fields/pricing.php';
require THEME_DIR . '/includes/post_types/bloggers.php';
require THEME_DIR . '/includes/custom-fields/blogger.php';
require THEME_DIR . '/includes/post_types/tariffs.php';
require THEME_DIR . '/includes/countries-list.php';
require THEME_DIR . '/includes/countries.php';

add_action('after_setup_theme', function () {
    load_theme_textdomain('influencer', THEME_DIR . '/languages');
    add_image_size('big', 1215, 684, false);
    add_role('pending', 'Pending');
    add_theme_support('post-thumbnails');

    add_theme_support('html5', array(
        'search-form',
        'comment-form',
        'comment-list',
        'gallery',
        'caption',
    ));
    register_nav_menus(array(
        'header-menu' => __('Header Menu', 'influencer')
    ));
    register_nav_menus(array(
        'footer-menu' => __('Footer quick links', 'influencer')
    ));

    add_theme_support('custom-logo');

    add_theme_support('title-tag');

    register_sidebar(array(
        'name' => __('Footer Connect', 'influencer'),
        'id' => 'footer-connect',
        'before_widget' => '<aside class="f_widget %2$s">',
        'after_widget' => '</aside>',
        'before_title' => '<h6 class="footer__col__title">',
        'after_title' => '</h6>',
    ));
});


add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('jquery', THEME_URI . '/assets/library/jquery-3.5.1.min.js', array(), 'v3.5.1', true);
    wp_enqueue_script('popper', THEME_URI . '/assets/library/popper.min.js', array('jquery'), array(), true);
    wp_enqueue_script('bootstrap_js', THEME_URI . '/assets/library/bootstrap/bootstrap.min.js', array('jquery'), 'v4.5.0', true);
    wp_enqueue_script('fancybox', THEME_URI . '/assets/library/fancybox/jquery.fancybox.min.js', array('jquery'), 'v3.5.7', true);
    wp_enqueue_script('owl_carousel', THEME_URI . '/assets/library/owl/owl.carousel.min.js', array(), 'v2.3.4', true);
    wp_enqueue_script('select2_js', THEME_URI . '/assets/js/select2.full.min.js', array('jquery'), 'v1.1.0', true);
    wp_enqueue_script('theme', THEME_URI . '/assets/js/script.js', array('jquery'), 'v1.1.0', true);
    wp_localize_script('theme', 'influencer_gh', array(
        'ajaxUrl' => admin_url('admin-ajax.php'),
        'afterRegister' => home_url() . '/my-account',
        'siteUrl' => get_site_url(),
    ));


    wp_enqueue_style('bootstrap_css', THEME_URI . '/assets/library/bootstrap/bootstrap.min.css', array(), 'v4.5.0');
    wp_enqueue_style('fancybox_css', THEME_URI . '/assets/library/fancybox/jquery.fancybox.min.css', array(), array());
    wp_enqueue_style('owl_css', THEME_URI . '/assets/library/owl/owl.carousel.min.css', array(), array());
    wp_enqueue_style('select2', THEME_URI . '/assets/css/select2.min.css', array(), array());
    wp_enqueue_style('all_min', THEME_URI . '/assets/css/all.min.css', array(), array());
    wp_enqueue_style('theme', THEME_URI . '/assets/css/style.css', array(), 'v0.1');
});

//enable old editor
add_filter('use_block_editor_for_post', function ($use_block_editor, $post) {
    if ($post->post_type == 'page') {
        return false;
    }

    return $use_block_editor;
}, 10, 2);


add_filter('autoptimize_filter_imgopt_should_lazyload', function ($status) {
    if ('our-work' === get_post_type() && is_singular()) {
        return false;
    }

    return $status;
});


//Register user start

add_action("wp_ajax_register_form", 'register_form');
add_action("wp_ajax_nopriv_register_form", 'register_form');

function register_form()
{
    $admin_email = get_option('admin_email');
    $site_title = get_option('blogname');
    $email = is_email($_POST['email']) ? $_POST['email'] : '';
    $profession = isset($_POST['profession']) ? $_POST['profession'] : '';
    $company_name = isset($_POST['company_name']) ? $_POST['company_name'] : '';
    $your_website = isset($_POST['your_website']) ? $_POST['your_website'] : '';
    $your_name = isset($_POST['your_name']) ? $_POST['your_name'] : '';
    $country = isset($_POST['your_country']) ? $_POST['your_country'] : '';
    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $uppercase = preg_match('@[A-Z]@', $password);
    $lowercase = preg_match('@[a-z]@', $password);
    $number = preg_match('@[0-9]@', $password);
    $errors = [];
    if (empty($email)) {
        $errors['email'] = 'Email cannot be blank';
    } elseif (email_exists(trim($email))) {
        $errors['email'] = "User is already registered ";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Invalid email format";
    }
    $step_1_status = empty($errors['email']) ? 'step_1_ok' : 'step_1_error';

    if (empty($profession)) {
        $errors['profession'] = "The field is required";
    }
    if (empty($company_name)) {
        $errors['company_name'] = "The field is required";
    } else if (!preg_match("/^[a-zA-Z ]*$/", $company_name)) {
        $errors['company_name'] = "Only letters and white space allowed";
    }
//    if (empty($your_website)) {
//        $errors['your_website'] = "The field is required";
//    } else if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i", $your_website)) {
//        $errors['your_website'] = "Invalid url format";
//    }

    if (empty($your_name)) {
        $errors['your_name'] = "The field is required";
    } else if (!preg_match("/^[a-zA-Z ]*$/", $your_name)) {
        $errors['your_name'] = "Only letters and white space allowed";
    }

    if (empty($country)) {
        $errors['your_country'] = "The field is required";
    } else if (!preg_match("/^[a-zA-Z ]*$/", $country)) {
        $errors['your_name'] = "Only letters and white space allowed";
    }

    if (empty($phone)) {
        $errors['phone'] = "The field is required";
    }

    $step_2_status = (empty($errors['profession'])) && (empty($errors['company_name'])) ? 'step_2_ok' : 'step_2_error';

//    if (empty($password)) {
//        $errors['password'] = "Password cannot be blank";
//    } else if (!$uppercase || !$lowercase || !$number || strlen($password) < 8) {
//        $errors['password'] = "Invalid password format";
//    }
    $username = $email;
    if (empty($errors)) {
        $user = wp_create_user($username, '', $email);
        if (is_wp_error($user)) {
            $errors['message'] = $user->get_error_message();
        } else {
            update_user_meta($user, 'nickname', $username);
            update_user_meta($user, 'first_name', $your_name);
            update_user_meta($user, 'company_name', $company_name);
            wp_mail($email, 'Authorization', 'test Authorization');
            wp_mail($admin_email, "New user registered on the site $site_title", 'User registration');
//            update_user_meta($user, 'first_name', $your_name);
//            update_user_meta($user, 'first_name', $your_name);
//            update_user_meta($user, 'first_name', $your_name);
//            update_user_meta($user, 'first_name', $your_name);
        }
    }

    echo json_encode([
        'step_1_status' => $step_1_status,
        'step_2_status' => $step_2_status,
        'errors' => $errors
    ]);

    exit();
}

//Register user end

//bloger registration start
add_action("wp_ajax_bloger_register", 'bloger_register');
add_action("wp_ajax_nopriv_bloger_register", 'bloger_register');

function bloger_register()
{
    $admin_email = get_option('admin_email');
    $site_title = get_option('blogname');
    $your_name = isset($_POST['your_name']) ? $_POST['your_name'] : '';
    $email = is_email($_POST['email']) ? $_POST['email'] : '';
    $country = isset($_POST['your_country']) ? $_POST['your_country'] : '';
    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $networks = isset($_POST['networks']) ? $_POST['networks'] : '';
    $errors = [];
    if (empty($your_name)) {
        $errors['your_name'] = "The field is required";
    } else if (!preg_match("/^[a-zA-Z ]*$/", $your_name)) {
        $errors['your_name'] = "Only letters and white space allowed";
    }

    if (empty($email)) {
        $errors['email'] = 'Email cannot be blank';
    } elseif (email_exists(trim($email))) {
        $errors['email'] = "User is already registered ";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Invalid email format";
    }

    if (empty($country)) {
        $errors['your_country'] = "The field is required";
    } else if (!preg_match("/^[a-zA-Z ]*$/", $country)) {
        $errors['your_name'] = "Only letters and white space allowed";
    }

    if (empty($phone)) {
        $errors['phone'] = "The field is required";
    }
    $username = $email;
    if (empty($errors)) {
        $user = wp_create_user($username, '', $email);
        if (is_wp_error($user)) {
            $errors['message'] = $user->get_error_message();
        } else {
            update_user_meta($user, 'nickname', $username);
            update_user_meta($user, 'first_name', $your_name);
            update_user_meta($user, 'country', $country);
            update_user_meta($user, 'phone', $phone);
            update_user_meta($user, 'networks', $networks);

            wp_mail($email, 'Registration', "You have registered on the site $site_title");
            wp_mail($admin_email, "$username registered on the site $site_title", 'User registration');
        }
    }

    echo json_encode([
        'errors' => $errors
    ]);
    exit();
}
//bloger registration end

//subscriber registration start

add_action("wp_ajax_register_subscriber", 'register_subscriber');
add_action("wp_ajax_nopriv_register_subscriber", 'register_subscriber');
function register_subscriber(){
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $email = is_email($_POST['email']) ? $_POST['email'] : '';
    $errors = [];
    if (empty($name)) {
        $errors['name'] = "The field is required";
    } else if (!preg_match("/^[a-zA-Z ]*$/", $name)) {
        $errors['name'] = "Only letters and white space allowed";
    }

    if (empty($email)) {
        $errors['email'] = 'Email cannot be blank';
    } elseif (email_exists(trim($email))) {
        $errors['email'] = "User is already registered ";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Invalid email format";
    }
    $username = $email;
    if (empty($errors)) {
        $user = wp_create_user($username, '', $email);
        if (is_wp_error($user)) {
            $errors['message'] = $user->get_error_message();
        } else {
            update_user_meta($user, 'nickname', $username);
            update_user_meta($user, 'first_name', $name);
        }
    }
    echo json_encode([
        'errors' => $errors
    ]);
    exit();
}
//subscriber registration end

//Get countries start
add_action("wp_ajax_get_countries_gh", 'get_countries_gh');
add_action("wp_ajax_nopriv_get_countries_gh", 'get_countries_gh');

function get_countries_gh()
{
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $search = isset($_GET['s']) ? strtolower($_GET['s']) : '';
    $all_countries = get_countries_list_gh();

    if ($search) {
        $all_countries = array_filter($all_countries, function ($country) use ($search) {
            return strpos(strtolower($country['name']), $search) !== false;
        });
    }
    $countries_arr = array_chunk($all_countries, 20);
    $countries = isset($countries_arr[$page - 1]) ? $countries_arr[$page - 1] : [];
    echo json_encode([
        'countries' => $countries,
        'currentPage' => $page,
        'totalPages' => ceil(count($all_countries) / 20),
    ]);
    exit;
}
//Get countries end
