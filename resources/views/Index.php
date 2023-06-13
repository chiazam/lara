<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=.85,maximum-scale=.85,minimum-scale=.85,user-scalable=no,shrink-to-fit=no">
    <meta name="Connection" content="Keep-Alive" />
    <meta name="Cache-Control" content="no-store, no-cache, must-revalidate" />
    <meta name="Pragma" content="no-cache" />
    <meta name="Expires" content="Thu, 19 Nov 1981 08:52:00 GMT" />
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta name="Apple-mobileweb-app-capable" content="yes" />
    <meta name="Formatdetection" content="telephone=yes" />
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="description" content="<?php echo $topic; ?>" />
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <meta name="msapplication-TileColor" content="">
    <meta name="theme-color" content=""><!-- Chrome, Firefox OS and Opera -->
    <meta name="msapplication-navbutton-color" content=""> <!-- Windows Phone -->
    <meta name="apple-mobile-web-app-status-bar-style" content=""> <!-- iOS Safari -->
    <title><?php echo $company; ?> - <?php echo $topic; ?></title>
    <link rel="stylesheet" href="<?php echo mix('css/app.css'); ?>">
    <link rel="icon" href="<?php echo asset('img/logo.png'); ?>">

</head>

<body class="bg-gray-100 text-sm">

    <noscript>You need to enable JavaScript to run this app.</noscript>

    <App id="app"></App>

    <script src="<?php echo  mix('js/app.js'); ?>"></script>

</body>

</html>