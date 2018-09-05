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

</head>

<body>

	<div class="container-fluid">

		<div style="color: $purple;" class="main-fluid">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">

					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right" data-color="blue">
							<li><a href="register">
									<p>
										Register Account <i class="pe-7s-add-user"></i>
									</p>
							</a></li>
							<li><a href="login">
									<p>
										Log in <i class="pe-7s-user-female"></i>
									</p>
							</a></li>
							<li class="separator hidden-lg"></li>
						</ul>
					</div>
				</div>
			</nav>



		</div>
		<footer class="footer">
			<div class="container">
				<nav class="pull-left">
					<ul>
						<li><a href="#"> Planner </a></li>
						<li><a href="#"> Project Outline </a></li>
						<li><a href="#"> Group Members </a></li>
					</ul>
				</nav>
			</div>
		</footer>

	</div>


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
            message: "Student Time Management App demo by sbnnko004, hndjad002, edwgar008."

        }, {
            type: 'info',
            timer: 2000
        });

    });
</script>

</html>