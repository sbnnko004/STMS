<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="./images/default.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>STMS Demo App 2</title>

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
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">

                                <div class="header">
                                    <h4 class="title">Email Statistics</h4>
                                    <p class="category">Last Campaign Performance</p>
                                </div>
                                <div class="content">
                                    <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

                                    <div class="footer">
                                        <div class="legend">
                                            <i class="fa fa-circle text-info"></i> Open
                                            <i class="fa fa-circle text-danger"></i> Bounce
                                            <i class="fa fa-circle text-warning"></i> Unsubscribe
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Users Behavior</h4>
                                    <p class="category">24 Hours performance</p>
                                </div>
                                <div class="content">
                                    <div id="chartHours" class="ct-chart"></div>
                                    <div class="footer">
                                        <div class="legend">
                                            <i class="fa fa-circle text-info"></i> Open
                                            <i class="fa fa-circle text-danger"></i> Click
                                            <i class="fa fa-circle text-warning"></i> Click Second Time
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <i class="fa fa-history"></i> Updated 3 minutes ago
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-6">
                            <div class="card ">
                                <div class="header">
                                    <h4 class="title">2014 Sales</h4>
                                    <p class="category">All products including Taxes</p>
                                </div>
                                <div class="content">
                                    <div id="chartActivity" class="ct-chart"></div>

                                    <div class="footer">
                                        <div class="legend">
                                            <i class="fa fa-circle text-info"></i> Tesla Model S
                                            <i class="fa fa-circle text-danger"></i> BMW 5 Series
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <i class="fa fa-check"></i> Data information certified
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card ">
                                <div class="header">
                                    <h4 class="title">Tasks</h4>
                                    <p class="category">Backend development</p>
                                </div>
                                <div class="content">
                                    <div class="table-full-width">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="checkbox">
                                                            <input id="checkbox1" type="checkbox">
                                                            <label for="checkbox1"></label>
                                                        </div>
                                                    </td>
                                                    <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                    <td class="td-actions text-right">
                                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="checkbox">
                                                            <input id="checkbox2" type="checkbox" checked>
                                                            <label for="checkbox2"></label>
                                                        </div>
                                                    </td>
                                                    <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                                                    <td class="td-actions text-right">
                                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="checkbox">
                                                            <input id="checkbox3" type="checkbox">
                                                            <label for="checkbox3"></label>
                                                        </div>
                                                    </td>
                                                    <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                    </td>
                                                    <td class="td-actions text-right">
                                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="checkbox">
                                                            <input id="checkbox4" type="checkbox" checked>
                                                            <label for="checkbox4"></label>
                                                        </div>
                                                    </td>
                                                    <td>Create 4 Invisible User Experiences you Never Knew About</td>
                                                    <td class="td-actions text-right">
                                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="checkbox">
                                                            <input id="checkbox5" type="checkbox">
                                                            <label for="checkbox5"></label>
                                                        </div>
                                                    </td>
                                                    <td>Read "Following makes Medium better"</td>
                                                    <td class="td-actions text-right">
                                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="checkbox">
                                                            <input id="checkbox6" type="checkbox" checked>
                                                            <label for="checkbox6"></label>
                                                        </div>
                                                    </td>
                                                    <td>Unfollow 5 enemies from twitter</td>
                                                    <td class="td-actions text-right">
                                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="footer">
                                        <hr>
                                        <div class="stats">
                                            <i class="fa fa-history"></i> Updated 3 minutes ago
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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