<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList"
    import="com.stms.util.Event"
    import="com.stms.util.Test"
    import="com.stms.util.Project"
    import="com.stms.util.User"
    
    %>
<html lang="en">
<%
	User user = (User)request.getAttribute("user");	
%>
<head>
    
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="./images/default.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>STMS Demo App</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="./css/bootstrap.min.css" rel="stylesheet" />

    <link href="./css/animate.min.css" rel="stylesheet" />

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="./css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script src="./js/jquery/moment.min.js" type="text/javascript"></script>
    <script src="./js/jquery/jquery.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

    <script src="./js/bootstrap-notify.js"></script>
    <script src="./js/bootstrap.js"></script>


    <script src="./js/light-bootstrap-dashboard.js?v=1.4.0"></script>
    <script src="https://unpkg.com/ionicons@4.3.0/dist/ionicons.js"></script>

    <link href="./css/custom.css" rel="stylesheet" />
    <script src="./js/custom.js"></script>
	<link href="./css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />
    <script src='./js/jquery/jquery-ui.js'></script>
    
    
    <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel='stylesheet'/>
    

</head>


<body>
    <div class="wrapper">
        <div class="sidebar" data-image="./images/sideBarBackground.png">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="https://www.cs.uct.ac.za/~sbnnko004" class="simple-text">
                        <b>STMS</b>
                        <br /> Hendricks, Jaren (leader);
                        <br /> Edwards, Gareth &
                        <br /> Sibandze, Nkosingiphile
                    </a>
                </div>

                <ul class="nav">
                    <li class="active">
                        <a href="#">
                            <i class="pe-7s-display1"></i>
                            <p>Planner</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="pe-7s-user"></i>
                            <p>User Profile</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="pe-7s-note2"></i>
                            <p>To-Do List</p>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="pe-7s-plus"></i>
                            <p>Add Event</p>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="collapse" data-target="#upComingEventList">
                            <i class="pe-7s-date"></i>
                            <p>Upcoming events</p>
                        </a>
                        <ul id="upComingEventList" class="collapse">
                    <li><a href="#">Event 1</a></li>
                    <li><a href="#">Event 2</a></li>
                </ul>
                </li>
                <li>
                    <a data-toggle="collapse" data-target="#missedEventList">
                        <i class="pe-7s-date"></i>
                        <p>Missed events</p>
                    </a>
                    <ul id="missedEventList" class="collapse">
                <li><a href="#">Event 1</a></li>
                <li><a href="#">Event 2</a></li>
                </ul>
                </li>
                <li>
                    <a data-toggle="collapse" data-target="#currentEventList">
                        <i class="pe-7s-like2"></i>
                        <p>Events happening now</p>
                    </a>
                    <ul id="currentEventList" class="collapse">
                <li><a href="#">Event 1</a></li>
                <li><a href="#">Event 2</a></li>
                </ul>
                </li>
                <li class="mobile-app">
                    <a href="#">
                        <i class="pe-7s-phone"></i>
                        <p>Download Mobile App</p>
                    </a>
                </li>
                </ul>
            </div>
        </div>

        <div class="main-panel">
            <nav class="navbar navbar-default navbar-fixed">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Student Time Management App Planner</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-left">
                            <li>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-calendar"></i>
                                    <p class="hidden-lg hidden-md">Planner</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-lg hidden-md"></b>
                                    <p class="hidden-lg hidden-md">
                                        5 Notifications
                                        <b class="caret"></b>
                                    </p>
                                </a>
                                <ul class="dropdown-menu">
                            <li><a href="#">Notification 1</a></li>
                            <li><a href="#">Notification 2</a></li>
                            <li><a href="#">Notification 3</a></li>
                            <li><a href="#">Notification 4</a></li>
                            <li><a href="#">all notification</a></li>
                        </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-search"></i>
                                <p class="hidden-lg hidden-md">Search</p>
                            </a>
                        </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="">
                                    <p>Account</p>
                                </a>
                            </li>
                            <li>
                                <a href="#" title="Application Settings">
                                    <p>
                                        <i class="pe-7s-config"></i>
                                    </p>
                                </a>
                            </li>
                            <li>
                                <a href="logout">
                                    <p>Log out</p>
                                </a>
                            </li>
                            <li class="separator hidden-lg"></li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="content">
                <div class="container-fluid">
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>
                                <li>
                                    <a href="#">
                                        Planner
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Project Outline
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Group Members
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </footer>
            </div>
        </div>
        	<div class="clear"></div>
        	<div class="clear"></div>
        
     </div>
</body>

</html>