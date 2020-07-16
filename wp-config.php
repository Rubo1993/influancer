<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'influencer' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'dXX,lsaeN^gBxHR[Cs*ew$f#q3o[Zuf(`.KIK)%w}6<<wsbKy9qYQY={5dnI30)[' );
define( 'SECURE_AUTH_KEY',  '|Cjwz#iDh4S: #V}U8DqSU)v5~<=x^D4HGN+F- 8<ivrjp[xc45*5{HB?NH8A_}+' );
define( 'LOGGED_IN_KEY',    '0%<t@Wl!1T^w,Q+{m<S{4^q1~)/~d)5l6B!ni8HOY)ys`Nf{<dD~a.rRc!@>oo%l' );
define( 'NONCE_KEY',        '.~{+yVx1RR#wJt*X=>GWr8AZkX-`gW53-5XG|VmY~-VnlDjFhl%Z&=~3Oa[qP/<o' );
define( 'AUTH_SALT',        'j?FGE.,GaG,nm*HJ`T[%=`bCeRezldXut|L2P-D9Wq|eu?%*K0 ,|?@aS*G&0Hwa' );
define( 'SECURE_AUTH_SALT', '4&bGXCTScG>KQua5ck5Q1lc!~VR4u|gT7o|2SI`?18fZ3wPrQ#iw.:QNk|f}GSiE' );
define( 'LOGGED_IN_SALT',   'Op8uuiVre?3ZqHME+^{7~fEYpU22(of8pWq+phH|b>ZZxQBd n4O,cY(F[}R}Qu:' );
define( 'NONCE_SALT',       '`#jjF{s+nlIt!lfhm-Lk{ tg;q9Q[+@d8;Q~X#%:4C] 6(4*VG]/1XI=+q&`e_J}' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
