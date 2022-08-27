<?php
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');
 
/** MySQL database username */
define('DB_USER', 'zyasuo');
 
/** MySQL database password */
define('DB_PASSWORD', '123123');
 
/** MySQL hostname */
define('DB_HOST', 'mariadb');
 
/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');
 
/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('AUTH_KEY',         'Oz4u*<]7CHr<J_ZEFg@Q7r%Ju,,*R|mwTsokvc|c9h*u8*)K3&;QfF2);c7QJk]e');
define('SECURE_AUTH_KEY',  'o^pO,p~/}E[:.8yADPF~j}fZ0gt&%(v?RB}20_$nS+w9^^3h:`Y-puqw H+9:#gS');
define('LOGGED_IN_KEY',    'K?j}1O.k>%(~Y 130*R$kQ1,x[]:5^Ly]X>L/|XS8PHb?p-Oe/pWN-jChm*DLjD0');
define('NONCE_KEY',        'fja2p##TO76t*VjA2~<Na=-H%8M2r&^MpID#Rw[W14px-C5P>CX0bw<QAJjUM_bT');
define('AUTH_SALT',        '0ue|U7:7_)s+CU`.mCz=CGT>v2ZpNlE#A^^Qm2N%-}#+}=^s_{b/w]6|~<hW<NBg');
define('SECURE_AUTH_SALT', '^_r0M~1#a_ m&~?]Mg(ogoj.u4AFGDLyo+%Y0+E/rXKLh;^=Y5J+&*EFX^btZ @#');
define('LOGGED_IN_SALT',   'bN+ypxRK64Wkk3T|]<>)oVt.o^3[NSx$8)kO7M)<uO<9|-7J |f;?xDf io,RK-d');
define('NONCE_SALT',       'YRt3Yq4N mJf)6yI[KY8VdDrUkih0?M;)1gI?3-TPS1-f}YPUQDe&DG!7Yc,UocK');

	
/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';
	
define('WP_DEBUG', false);

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';