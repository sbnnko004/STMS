<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="./images/default.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>STMS Demo App</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<link href="./css/bootstrap.min.css" rel="stylesheet" />

<link href="./css/animate.min.css" rel="stylesheet" />

<link href="./css/light-bootstrap-dashboard.css?v=1.4.0"
	rel="stylesheet" />


<link href="./css/custom.css" rel="stylesheet" />


<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css' />
<link href="./css/pe-icon-7-stroke.css" rel="stylesheet" />
<style type="text/css">
body {
  background: #fff;
  color: #666666;
  font-family: "Open Sans", sans-serif;
}

a {
  color: #2dc997;
}

a:hover, a:active, a:focus {
  color: #2dca98;
  outline: none;
  text-decoration: none;
}

p {
  padding: 0;
  margin: 0 0 30px 0;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Poppins", sans-serif;
  font-weight: 400;
  margin: 0 0 20px 0;
  padding: 0;
}

/* Prelaoder */
#preloader {
  position: fixed;
  left: 0;
  top: 0;
  z-index: 999;
  width: 100%;
  height: 100%;
  overflow: visible;
  background: #fff url("../img/preloader.svg") no-repeat center center;
}

/* Back to top button */
.back-to-top {
  position: fixed;
  display: none;
  background: rgba(0, 0, 0, 0.2);
  color: #fff;
  padding: 6px 12px 9px 12px;
  font-size: 16px;
  border-radius: 2px;
  right: 15px;
  bottom: 15px;
  transition: background 0.5s;
}

@media (max-width: 768px) {
  .back-to-top {
    bottom: 15px;
  }
}

.back-to-top:focus {
  background: rgba(0, 0, 0, 0.2);
  color: #fff;
  outline: none;
}

.back-to-top:hover {
  background: #2dc997;
  color: #fff;
}

/*--------------------------------------------------------------
# Header
--------------------------------------------------------------*/
#header {
  padding: 30px 0;
  height: 92px;
  position: fixed;
  left: 0;
  top: 0;
  right: 0;
  transition: all 0.5s;
  z-index: 997;
}

#header #logo {
  float: left;
}

#header #logo h1 {
  font-size: 36px;
  margin: 0;
  padding: 6px 0;
  line-height: 1;
  font-family: "Poppins", sans-serif;
  font-weight: 700;
  letter-spacing: 3px;
  text-transform: uppercase;
}

#header #logo h1 a, #header #logo h1 a:hover {
  color: #fff;
}

#header #logo img {
  padding: 0;
  margin: 0;
}

@media (max-width: 768px) {
  #header #logo h1 {
    font-size: 26px;
  }
  #header #logo img {
    max-height: 40px;
  }
}

#header.header-fixed {
  background: rgba(52, 59, 64, 0.9);
  padding: 20px 0;
  height: 72px;
  transition: all 0.5s;
}


/*--------------------------------------------------------------
# Navigation Menu
--------------------------------------------------------------*/
/* Nav Menu Essentials */
.nav-menu, .nav-menu * {
  margin: 0;
  padding: 0;
  list-style: none;
}

.nav-menu ul {
  position: absolute;
  display: none;
  top: 100%;
  left: 0;
  z-index: 99;
}

.nav-menu li {
  position: relative;
  white-space: nowrap;
}

.nav-menu > li {
  float: left;
}

.nav-menu li:hover > ul,
.nav-menu li.sfHover > ul {
  display: block;
}

.nav-menu ul ul {
  top: 0;
  left: 100%;
}

.nav-menu ul li {
  min-width: 180px;
}

/* Nav Menu Arrows */
.sf-arrows .sf-with-ul {
  padding-right: 30px;
}

.sf-arrows .sf-with-ul:after {
  content: "\f107";
  position: absolute;
  right: 15px;
  font-family: FontAwesome;
  font-style: normal;
  font-weight: normal;
}

.sf-arrows ul .sf-with-ul:after {
  content: "\f105";
}

/* Nav Meu Container */
#nav-menu-container {
  float: right;
  margin: 0;
}

@media (max-width: 768px) {
  #nav-menu-container {
    display: none;
  }
}

/* Nav Meu Styling */
.nav-menu a {
  padding: 0 8px 10px 8px;
  text-decoration: none;
  display: inline-block;
  color: #fff;
  font-family: "Poppins", sans-serif;
  font-weight: 400;
  text-transform: uppercase;
  font-size: 13px;
  outline: none;
}

.nav-menu > li {
  margin-left: 10px;
}

.nav-menu > li > a:before {
  content: "";
  position: absolute;
  width: 100%;
  height: 2px;
  bottom: 0;
  left: 0;
  background-color: #2dc997;
  visibility: hidden;
  -webkit-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transition: all 0.3s ease-in-out 0s;
  transition: all 0.3s ease-in-out 0s;
}

.nav-menu a:hover:before, .nav-menu li:hover > a:before, .nav-menu .menu-active > a:before {
  visibility: visible;
  -webkit-transform: scaleX(1);
  transform: scaleX(1);
}

.nav-menu ul {
  margin: 4px 0 0 0;
  border: 1px solid #e7e7e7;
}

.nav-menu ul li {
  background: #fff;
}

.nav-menu ul li:first-child {
  border-top: 0;
}

.nav-menu ul li a {
  padding: 10px;
  color: #333;
  transition: 0.3s;
  display: block;
  font-size: 13px;
  text-transform: none;
}

.nav-menu ul li a:hover {
  background: #2dc997;
  color: #fff;
}

.nav-menu ul ul {
  margin: 0;
}

/* Mobile Nav Toggle */
#mobile-nav-toggle {
  position: fixed;
  right: 0;
  top: 0;
  z-index: 999;
  margin: 20px 20px 0 0;
  border: 0;
  background: none;
  font-size: 24px;
  display: none;
  transition: all 0.4s;
  outline: none;
  cursor: pointer;
}

#mobile-nav-toggle i {
  color: #fff;
}

@media (max-width: 768px) {
  #mobile-nav-toggle {
    display: inline;
  }
}

/* Mobile Nav Styling */
#mobile-nav {
  position: fixed;
  top: 0;
  padding-top: 18px;
  bottom: 0;
  z-index: 998;
  background: rgba(52, 59, 64, 0.9);
  left: -260px;
  width: 260px;
  overflow-y: auto;
  transition: 0.4s;
}

#mobile-nav ul {
  padding: 0;
  margin: 0;
  list-style: none;
}

#mobile-nav ul li {
  position: relative;
}

#mobile-nav ul li a {
  color: #fff;
  font-size: 16px;
  overflow: hidden;
  padding: 10px 22px 10px 15px;
  position: relative;
  text-decoration: none;
  width: 100%;
  display: block;
  outline: none;
}

#mobile-nav ul li a:hover {
  color: #fff;
}

#mobile-nav ul li li {
  padding-left: 30px;
}

#mobile-nav ul .menu-has-children i {
  position: absolute;
  right: 0;
  z-index: 99;
  padding: 15px;
  cursor: pointer;
  color: #fff;
}

#mobile-nav ul .menu-has-children i.fa-chevron-up {
  color: #2dc997;
}

#mobile-nav ul .menu-item-active {
  color: #2dc997;
}

#mobile-body-overly {
  width: 100%;
  height: 100%;
  z-index: 997;
  top: 0;
  left: 0;
  position: fixed;
  background: rgba(52, 59, 64, 0.9);
  display: none;
}

/* Mobile Nav body classes */
body.mobile-nav-active {
  overflow: hidden;
}

body.mobile-nav-active #mobile-nav {
  left: 0;
}

body.mobile-nav-active #mobile-nav-toggle {
  color: #fff;
}

/*--------------------------------------------------------------
# Sections
--------------------------------------------------------------*/
/* Sections Header
--------------------------------*/
.section-header .section-title {
  font-size: 32px;
  color: #111;
  text-transform: uppercase;
  text-align: center;
  font-weight: 700;
  margin-bottom: 5px;
}

.section-header .section-description {
  text-align: center;
  padding-bottom: 40px;
  color: #999;
}

</style>
</head>

<body>

		  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <a href="#hero"><img src="img/logo.png" alt="" title="" /></img></a>
        <!-- Uncomment below if you prefer to use a text logo -->
        <!--<h1><a href="#hero">Regna</a></h1>-->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
			<li>
				<a href="register">
					<p>Register Account <i class="pe-7s-add-user"></i></p>
				</a>
			</li>
			<li>
				<a href="login">
					<p>Log in <i class="pe-7s-user-female"></i></p>
				</a>
			</li>
			<li><a href="/">Project Outline</a></li>
          	<li><a href="/members">Group Members</a></li>
			<li class="separator hidden-lg"></li>
		</ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
		
		<section id="hero">
		<div class="hero-container">
      <h1>Student Time Management System</h1>
      </br>
      <h2>
      	<a href="register">
			Register Account <i class="pe-7s-add-user"></i>
		</a>
	</h2>
	<h2>
      	<a href="login">
Log in <i class="pe-7s-user-female"></i>
		</a>
	</h2>
      </div>
		</section>
		<footer id="footer">
    <div class="footer-top">
      <div class="container">

      </div>
    </div>

  </footer><!-- #footer -->



</body>

<script src="./js/jquery/jquery.js" type="text/javascript">
</script>

<script src="./js/bootstrap.min.js" type="text/javascript">
</script>

<script src="./js/bootstrap-notify.js">
</script>

<script src="./js/light-bootstrap-dashboard.js?v=1.4.0">
</script>

<script src="https://unpkg.com/ionicons@4.3.0/dist/ionicons.js">
</script>



<script src="./js/custom.js">
</script>

<script type="text/javascript">
    $(document).ready(function() {

        $.notify({
            icon: 'pe-7s-light2',
            message: "Student Time Management System by sbnnko004, hndjad002, edwgar008."

        }, {
            type: 'info',
            timer: 2000
        });

    });
</script>

</html>