<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="./images/default.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>STMS Demo App</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <link href="./css/bootstrap.min.css" rel="stylesheet" />

    <link href="./css/animate.min.css" rel="stylesheet" />

    <link href="./css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />


    <link href="./css/custom.css" rel="stylesheet" />


    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0./css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com./css?family=Roboto:400,700,300' rel='stylesheet' type='text./css'>
    <link href="./css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>

<body>

    <div class="wrapper">
        <div class="sidebar" data-image="./images/sideBarBackground.png">

            <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag
    -->

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://www.cs.uct.ac.za/~sbnnko004" class="simple-text">
                        <b>STMS</b> <br /> Hendricks, Jaren (leader);<br /> Edwards, Gareth &<br /> Sibandze, Nkosingiphile

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
                                <a href="#">
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


</body>

<script src="./js/jquery.3.2.1.min.js" type="text/javascript">
</script>
<script src="./js/bootstrap.min.js" type="text/javascript">
</script>

<script src="./js/chartist.min.js">
</script>

<script src="./js/bootstrap-notify.js">
</script>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api./js?key=YOUR_KEY_HERE">
</script>

<script src="./js/light-bootstrap-dashboard.js?v=1.4.0">
</script>
<script src="https://unpkg.com/ionicons@4.3.0/dist/ionicons.js">
</script>


<script src="./js/custom.js">
</script>

<script type="text/javascript">
    $(document).ready(function() {

        custom.initChartist();

        $.notify({
            icon: 'pe-7s-light2',
            message: "Student Time Management App demo by sbnnko004, hndjad002, edwgar008."

        }, {
            type: 'info',
            timer: 4000
        });

    });
</script>

</html>