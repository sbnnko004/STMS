<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="./images/default.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>STMS Demo App - Login</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <link href="./css/bootstrap.min.css" rel="stylesheet" />

    <link href="./css/animate.min.css" rel="stylesheet" />

    <link href="./css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />


    <link href="./css/custom.css" rel="stylesheet" />


    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
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
                                <a href="login">
                                    <p>Log in <i class="pe-7s-user-female"></i></p>
                                </a>
                            </li>
                            <li class="separator hidden-lg"></li>
                        </ul>
                    </div>
                </div>
            </nav>


            <div class="container">
			    	<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-login">
								<div class="panel-heading">
									<div class="row">
										<div>
											<h3 class="text-center">Register</h3>
										</div>
									</div>
									<hr>
									<div class="row">
										<div>
											<h5 class="text-center"><a  href="login">Login</a></h5>
											<%
											if(request.getAttribute("error_message") != null && !(String.valueOf(request.getAttribute("error_message")).equals(""))){
											%>
											 	<h5 class="text-center" style="color:red"><%= String.valueOf(request.getAttribute("error_message")) %></h5> 
											<%
												}
											%>
										</div>
									</div>
									<hr>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											
											<form id="login-form" action="register" method="post" role="form" style="display: block;">
												<div class="form-group">
													<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username"
													<%
													if(request.getAttribute("username") != null && !(String.valueOf(request.getAttribute("username")).equals(""))){
													%>
													 	value="<%= String.valueOf(request.getAttribute("username")) %>" 
													<%
														}
													%>
													>
												</div>
												<div class="form-group">
													<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" 
													<%
													if(request.getAttribute("email") != null && !(String.valueOf(request.getAttribute("email")).equals(""))){
													%>
													 	value="<%= String.valueOf(request.getAttribute("email")) %>" 
													<%
														}
													%>
													>
												</div>
												<div class="form-group">
													<input type="fext" name="firstname" id="firstname" tabindex="1" class="form-control" placeholder="First name" 
													<%
													if(request.getAttribute("firstname") != null && !(String.valueOf(request.getAttribute("firstname")).equals(""))){
													%>
													 	value="<%= String.valueOf(request.getAttribute("firstname")) %>" 
													<%
														}
													%>
													>
												</div>
												<div class="form-group">
													<input type="text" name="lastname" id="lastname" tabindex="1" class="form-control" placeholder="Last name"
													<%
													if(request.getAttribute("lastname") != null && !(String.valueOf(request.getAttribute("lastname")).equals(""))){
													%>
													 	value="<%= String.valueOf(request.getAttribute("lastname")) %>" 
													<%
														}
													%>
													>
												</div>
												<div class="form-group">
													<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
												</div>
												<div class="form-group">
													<input type="password" name="confirmpassword" id="confirmpassword" tabindex="2" class="form-control" placeholder="Confirm Password">
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
            
        </div>
        <footer style= "position: fixed; height: 100px;    bottom: 0;  width: 100%;" class="footer">
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

<script src="./js/jquery.3.2.1.min.js" type="text/javascript"/>
<script src="./js/bootstrap.min.js" type="text/javascript"/>
<script src="./js/bootstrap-notify.js"/>
<script src="./js/light-bootstrap-dashboard.js?v=1.4.0"/>
<script src="https://unpkg.com/ionicons@4.3.0/dist/ionicons.js"/>


<script src="./js/custom.js"/>

<script type="text/javascript">
    $(document).ready(function() {

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