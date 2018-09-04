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


    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0./css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com./css?family=Roboto:400,700,300' rel='stylesheet' type='text./css'>
    <link href="./css/pe-icon-7-stroke.css" rel="stylesheet" />
    
    <!-- For alert messages -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
											<h3 class="text-center">Login</h3>
										</div>
									</div>
									<hr>
									<div class="row">
										<div>
											<h5 class="text-center"><a  href="register">Register</a></h5>
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
											<form name="login-form1" id="login-form" action="login" method="post" role="form" style="display: block;">
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
													<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
												</div>
												
												<!-- error message if user is not on database -->
												<%
													if(request.getAttribute("error") != null && !(String.valueOf(request.getAttribute("error")).equals(""))){
												%>
													<p style="color:red"> <%= String.valueOf(request.getAttribute("error")) %> </p>
												<%
													}
												%>
												
												
												<div class="form-group text-center">
													<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
													<label for="remember"> Remember Me</label>
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In" onclick="return val();"/>
														</div>
													</div>
												</div>
												
		
												
												<div class="form-group">
													<div class="row">
														<div class="col-lg-12">
															<div class="text-center">
																<a href="recover" tabindex="5" class="forgot-password">Forgot Password?</a>
															</div>
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
        <footer class="footer">
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
            timer: 4000
        });

    });
</script>

</html>






