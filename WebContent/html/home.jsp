<!doctype html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="./images/default.png"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>STMS Demo App</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <link href="./css/bootstrap.min.css" rel="stylesheet" />

    <link href="./css/animate.min.css" rel="stylesheet" />

    <link href="./css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />


    <link href="./css/custom.css" rel="stylesheet" />


    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link href="./css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>

<body>

    <div class="container-fluid">

        <div style = "color: $purple;" class="main-fluid">
            <nav  class="navbar navbar-default navbar-fixed">
                <div class="container-fluid">
                    
                    <div class="collapse navbar-collapse">
                        
                        <ul class="nav navbar-nav navbar-right" data-color="blue">
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
                            <li class="separator hidden-lg"></li>
                        </ul>
                    </div>
                </div>
            </nav>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-dm-4 column-in-center">
                            <div class="card">
                            	<div class="header">
                                    <h3 class="title"><b>Student Time Management System - STMS</b></h3>
                                    <p class="category">This is a CSC3003S project by HENDRICKS, JAREN (LEADER); EDWARDS, GARETH & SIBANDZE, NKOSINGIPHILE.</p>
                                </div>


								<div class="content">
                                <h5 class="title"><b>Supervisor</b>: Gary Stewart <a href="mailto:stewart@cs.uct.ac.za">stewart@cs.uct.ac.za</a></h5>
                                <p class="textarea">Most students constantly feel under pressure. They typically feel that they don't have sufficient time to keep up with their coursework, complete their assignments, and study for tests and exams. Often they lack the skills to adequately manage their time, or they perceive implementing a time management system as being unnecessarily administratively cumbersome. So the proposed Student Time Management System will automate much of the work for them and simplify the process. It should allow students to document their academic deadlines for assignments and tests (on a monthly or semester basis), specify a weekly study planner (identifying time for studying), and manage a daily to do list. Based on this information, it should advise students about how they should productively spend their time, so e.g. today you should be completing your MAM1000W Assignment due on Thursday and studying for the CSC1015F PracTest on Friday. The system should be web-based so students can access it from anywhere, and possibly also a mobile application to increase access.</p>
                            	<div class="footer">
                                     
                                     <hr>
                                     <div class="stats">
                                         <i class="pe-7s-chat"></i> Design is not just what it looks like and feels like. Design is how it works. - Steve Jobs 
                                     </div>
                                 </div>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
            
        </div>
        <footer style= "position: fixed;  bottom: 0;  width: 100%;" class="footer">
                <div class="container">
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


</body>

<script src="./js/jquery.3.2.1.min.js" type="text/javascript">
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
            message: "Student Time Management App demo by sbnnko004, hndjad002, edwgar008."

        }, {
            type: 'info',
            timer: 2000
        });

    });
</script>

</html>