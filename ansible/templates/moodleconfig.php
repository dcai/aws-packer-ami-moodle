<?php
unset($CFG);  // Ignore this line
global $CFG;  // This is necessary here for PHPUnit execution
$CFG = new stdClass();

$CFG->sessioncookie = 'm29';
//$CFG->passwordpolicy = null;
$CFG->dbtype    = 'mysqli'; // 'pgsql', 'mariadb', 'mysqli', 'mssql', 'sqlsrv' or 'oci'
$CFG->dblibrary = 'native';
$CFG->dbhost    = '{{ moodle_dbhost }}';
$CFG->dbname    = '{{ moodle_dbname }}';
$CFG->dbuser    = '{{ moodle_dbuser }}';
$CFG->dbpass    = '{{ moodle_dbpass }}';
$CFG->prefix    = 'mdl_';
$CFG->wwwroot   = 'http://{{ moodle_wwwroot }}';
$CFG->dataroot  = '/mnt/efs/{{ moodle_dataroot }}';
$CFG->directorypermissions = 02777;
$CFG->admin = 'admin';
date_default_timezone_set('Etc/UTC');
@error_reporting(E_ALL | E_STRICT); // NOT FOR PRODUCTION SERVERS!
@ini_set('display_errors', '1');    // NOT FOR PRODUCTION SERVERS!
$CFG->debug = (E_ALL | E_STRICT);   // === DEBUG_DEVELOPER - NOT FOR PRODUCTION SERVERS!
$CFG->debugdisplay = 1;             // NOT FOR PRODUCTION SERVERS!
$CFG->perfdebug = 255;
$CFG->smtphosts = '127.0.0.1:50010';
//$CFG->smtphosts = 'mailtrap.io:2525';
//$CFG->smtpuser = '2963730aa32e5ad51';
//$CFG->smtppass = '3d6868376d84f0';
// Prevent theme caching
// $CFG->themedesignermode = true; // NOT FOR PRODUCTION SERVERS!
//
// Prevent core_string_manager application caching
// $CFG->langstringcache = false; // NOT FOR PRODUCTION SERVERS!
//
// Prevent JS caching
//$CFG->cachejs = true; // NOT FOR PRODUCTION SERVERS!

require_once(__DIR__ . '/lib/setup.php'); // Do not edit
