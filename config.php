<?php
session_start();
$host = getenv('DB_HOST') ?: '127.0.0.1';
$db = getenv('DB_NAME') ?: 'visit_hail';
$user = getenv('DB_USER') ?: 'root';
$pass = getenv('DB_PASS') ?: '';
try { $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass, [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC, PDO::ATTR_EMULATE_PREPARES=>false]); }
catch (PDOException $e) { http_response_code(500); exit('Database unavailable. Import database.sql and check config.php environment settings.'); }
function e($v){ return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8'); }
function logged(){return isset($_SESSION['uid']);}
function require_login(){if(!logged()){header('Location: login.php');exit;}}
function admin(){return ($_SESSION['role']??'')==='admin';}
function csrf(){if(empty($_SESSION['csrf']))$_SESSION['csrf']=bin2hex(random_bytes(24));return $_SESSION['csrf'];}
function check_csrf(){if(!hash_equals($_SESSION['csrf']??'',$_POST['csrf']??'')){http_response_code(403);exit('Invalid request token');}}
function flash($msg){$_SESSION['flash']=$msg;}
function go($url){header('Location: '.$url);exit;}
