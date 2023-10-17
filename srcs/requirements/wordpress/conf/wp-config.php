<?php
#DB info
define('DB_NAME', getenv('MYSQL_DATABASE'));
define('DB_USER', getenv('MYSQL_USER'));
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));
define('DB_HOST', getenv('MYSQL_HOSTNAME')); 

define('WP_MEMORY_LIMIT', '256M');

define('AUTOMATIC_UPDATER_DISABLED', false);

define('DISALLOW_FILE_EDIT', true);

#SAVE change
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
