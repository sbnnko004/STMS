<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"
	import="com.stms.util.Event" import="com.stms.util.Test"
	import="com.stms.util.Project" import="com.stms.util.Assignment"
	import="com.stms.util.Task" import="com.stms.Scheduler.Scheduler"%>
    <html lang="en">
    <%
	Object object = request.getAttribute("events");
	ArrayList<Event> events=new ArrayList<>();
	if(object instanceof ArrayList){
		events=(ArrayList<Event>)object;
	}
	object = null;
	object = request.getAttribute("courses");
	ArrayList<String> courses=new ArrayList<>();
	if(object instanceof ArrayList){
		courses=(ArrayList<String>)object;
	}
	object = null;
	object = request.getAttribute("tasks");
	ArrayList<Task> tasks=new ArrayList<>();
	if(object instanceof ArrayList){
		tasks=(ArrayList<Task>)object;
	}
	object = null;
	object = request.getAttribute("upcomingEvents");
	ArrayList<Event> upcomingEvents=new ArrayList<>();
	if(object instanceof ArrayList){
		upcomingEvents=(ArrayList<Event>)object;
	}
	object = null;
	object = request.getAttribute("pastEvents");
	ArrayList<Event> pastEvents=new ArrayList<>();
	if(object instanceof ArrayList){
		pastEvents=(ArrayList<Event>)object;
	}
	object = null;
	object = request.getAttribute("currentEvents");
	ArrayList<Event> currentEvents=new ArrayList<>();
	if(object instanceof ArrayList){
		currentEvents=(ArrayList<Event>)object;
	}

%>

        <head>

            <meta charset="utf-8" />
            <link rel="icon" type="image/png" href="./images/default.png">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

            <title>STMS Demo App</title>

            <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
            <meta name="viewport" content="width=device-width" />
            <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
            <link href="./css/pe-icon-7-stroke.css" rel="stylesheet" />

            <script src="./js/jquery/moment.min.js" type="text/javascript"></script>
            <script src="./js/jquery/jquery.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

            <script src="./js/bootstrap-notify.js"></script>
            <script src="./js/bootstrap.js"></script>

            <script src="./js/light-bootstrap-dashboard.js?v=1.4.0"></script>
            <script src="https://unpkg.com/ionicons@4.3.0/dist/ionicons.js"></script>

            <script src="./js/custom.js"></script>
            <link href="./css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />
            <script src='./js/jquery/jquery-ui.js'></script>

            <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel='stylesheet' />
            <link rel="stylesheet" href="//jonthornton.github.io/jquery-timepicker/jquery.timepicker.css">
            <script src="https://jonthornton.github.io/jquery-timepicker/jquery.timepicker.js"></script>
            <link href='./css/fullcalendar.css' rel='stylesheet' />
            <link href='./css/fullcalendar.print.css' rel='stylesheet' media='print' />
            
            <link href="./css/bootstrap.min.css" rel="stylesheet" />
            <link href="./css/animate.min.css" rel="stylesheet" />

            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

            <link href="./css/custom.css" rel="stylesheet" />
            <script>
                jQuery(function($) { // wait until the DOM is ready
                    $("#startdate").datepicker({
                        dateFormat: 'yy-mm-dd',
                        changeMonth: true,
                        changeYear: true,
                        minDate: new Date(),
                        maxDate: '+30Y',
                        inline: true
                    });

                    $("#enddate").datepicker({
                        dateFormat: 'yy-mm-dd',
                        changeMonth: true,
                        changeYear: true,
                        minDate: new Date(),
                        maxDate: '+30Y',
                        inline: true
                    });
                    $('#starttime').timepicker({
                        'timeFormat': 'H:i',
                        'step': 5
                    });
                    $('#endtime').timepicker({
                        'timeFormat': 'H:i',
                        'step': 5
                    });

                });
                $(document).ready(function() {
                    function hideEverything() {
                        $("#courseCode").hide();
                        $("#hoursNeeded").hide();
                        $("#duration").hide();
                    }
                    $("#coursecode").change(function() {
                        if ($(this).val() == "other") {
                            $("#manualCourseCode").show();
                        } else {
                            $("#manualCourseCode").hide();
                        }
                    });
                    $("#type").change(function() {
                        $("#duration").hide();
                        if ($(this).val() == "other") {
                            hideEverything();
                            $("#endDate").show();
                            $("#endTime").show();
                        } else {
                            $("#courseCode").show();

                            if ($("#coursecode").val() == "other") {
                                $("#manualCourseCode").show();
                            } else if ($("#coursecode").val() != "other") {
                                $("#manualCourseCode").hide();
                            }

                            $("#hoursNeeded").hide();
                            $("#endDate").show();
                            $("#endTime").show();
                            //TODO remove enddate and endtime and put duration
                            if ($(this).val() == "test") {
                                $("#hoursNeeded").show();
                                $("#duration").show();
                                $("#endDate").hide();
                                $("#endTime").hide();

                            } else if ($(this).val() == "project") {
                                $("#hoursNeeded").show();
                            }
                        }
                    });

                    window.onload = hideEverything();

                    $('#calendar').fullCalendar({
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,basicWeek,basicDay'
                        },
                        defaultDate: new Date(),
                        navLinks: true, // can click day/week names to navigate views
                        editable: true,
                        eventLimit: true, // allow "more" link when too many events
                        events: [<%
				for(int i=0;i<events.size();i++){
					%> {
                                id: <%= String.valueOf(events.get(i).getEventID())%>,
                                title: <%= String.valueOf("'"+events.get(i).getEventName()+"'")%>,
                                start: new Date(<%= String.valueOf(Integer.parseInt(events.get(i).getStartDate().split("-")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartDate().split("-")[1])-1)%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartDate().split("-")[2]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartTime().split(":")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartTime().split(":")[1]))%>),
                                end: new Date(<%= String.valueOf(Integer.parseInt(events.get(i).getEndDate().split("-")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndDate().split("-")[1])-1)%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndDate().split("-")[2]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndTime().split(":")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndTime().split(":")[1]))%>),
                                allDay: false,
                                <%
					if(events.get(i) instanceof Assignment){
					%>
                                backgroundColor: '#9932cc'
                                <%
					}else if(events.get(i) instanceof Test){
					%>
                                backgroundColor: '#ff0000'
                                <%
					}else if(events.get(i) instanceof Project){
							%>
                                backgroundColor: '#ffd700'
                                <%
					}
					%>
                            }
                            <%if(i<=events.size()-1){%>, <%}}%>
                        ]
                    });

                });
            </script>
        </head>

        <body>
            <div class="wrapper">
                <div class="sidebar" data-image="./images/sideBarBackground.png">
                    <div class="sidebar-wrapper">
                        <div class="logo">
                            <a href="https://www.cs.uct.ac.za/~sbnnko004/members" class="simple-text">
                                <b>STMS</b>
                                <br /> Hendricks, Jaren;
                                <br /> Edwards, Gareth &
                                <br /> Sibandze, Nkosingiphile
                            </a>
                        </div>

                        <ul class="nav">
                            <li class="active">
                                <a href="#"> <i class="pe-7s-display1"></i>
                                    <p>Planner</p>
                                </a>
                            </li>
                            <li>
                                <a href="#"> <i class="pe-7s-user"></i>
                                    <p>User Profile</p>
                                </a>
                            </li>
                            <li>
                                <a href="#"> <i class="pe-7s-note2"></i>
                                    <p>To-Do List</p>
                                </a>
                            </li>
                            <li>
                                <a> <i class="pe-7s-plus"></i>
                                    <p>Add Event</p>
                                </a>
                            </li>
                            <li>
                                <a data-toggle="collapse" data-target="#upComingEventList">
                                    <i class="pe-7s-date"></i>
                                    <p>Upcoming events (<%= String.valueOf(upcomingEvents.size()) %>)</p>
                                </a>
                                <ul id="upComingEventList" class="collapse">
                                    <%
									int num = 5; 
									if(upcomingEvents.size()<num){
										num=upcomingEvents.size();
										}
									for(int i=0;i<num;i++){
									%>
                                        <li>
                                            <a href="#">
                                                <%= String.valueOf(upcomingEvents.get(i).getEventName()) %>
                                            </a>
                                        </li>
                                    <%} if(upcomingEvents.size()==0){%>
                                        <li>no upcoming events</li>
                                    <%} else if(upcomingEvents.size()>5){%>
                                        <li><a href="#">See more!</a></li>
                                                <%} %>
                                </ul>
                            </li>
                            <li>
                                <a data-toggle="collapse" data-target="#passEventList">
                                    <i class="pe-7s-date"></i>
                                    <p>Past events (<%= String.valueOf(pastEvents.size()) %>)</p>
                                </a>
                                <ul id="passEventList" class="collapse">
                                    <%
										num = 5; 
                                    	if(pastEvents.size()<num){
                                    		num=pastEvents.size();
 
                                    		}
										for(int i=0;i<num;i++){
									%>
                                        <li>
                                            <a href="#">
                                            <%                                    		System.out.println(i); %>
                                                <%= String.valueOf(pastEvents.get(i).getEventName()) %>
                                            </a>
                                        </li>
                                     <%
                                     	} if(pastEvents.size()==0){
                                     %>
                                         <li>no past events</li>
                                      <%
                                      	} else if(pastEvents.size()>5){
                                   	  %>
                                          <li><a href="#">See more!</a></li>
                                       <%
                                       		} 
                                    	%>
                                </ul>
                            </li>
                            <li>
                                <a data-toggle="collapse" data-target="#currentEventList">
                                    <i class="pe-7s-like2"></i>
                                    <p>Events happening today (<%= String.valueOf(currentEvents.size()) %>)</p>
                                </a>
                                <ul id="currentEventList" class="collapse">
<%
										num = 5; 
                                    	if(currentEvents.size()<num){
                                    		num=currentEvents.size();
 
                                    		}
										for(int i=0;i<num;i++){
									%>
                                        <li>
                                            <a href="#">
                                             <%= String.valueOf(currentEvents.get(i).getEventName()) %>
                                            </a>
                                        </li>
                                     <%
                                     	} if(currentEvents.size()==0){
                                     %>
                                         <li>no events events</li>
                                      <%
                                      	} else if(currentEvents.size()>5){
                                   	  %>
                                          <li><a href="#">See more!</a></li>
                                       <%
                                       		} 
                                    	%>

                                </ul>
                            </li>
                            <!-- li class="mobile-app">
                                <a href="#"> <i class="pe-7s-phone"></i>
                                    <p>Download Mobile App</p>
                                </a>
                            </li-->
                        </ul>
                    </div>
                </div>

                <div class="main-panel">
                    <nav class="navbar navbar-default navbar-fixed">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                    <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">Student Time Management App
							Planner</a>
                            </div>
                            <div class="collapse navbar-collapse">
                                <ul class="nav navbar-nav navbar-left">
                                    <li>
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-calendar"></i>
                                            <p class="hidden-lg hidden-md">Planner</p>
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-globe"></i> <b class="caret hidden-lg hidden-md"></b>
                                            <p class="hidden-lg hidden-md">
                                                5 Notifications <b class="caret"></b>
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
                                        <a href=""> <i class="fa fa-search"></i>
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
                            <div id="mainDiv" class="row">
                                <div>
                                    <div class="col-md-4">
                                        <div class="card ">
                                            <div class="header">

                                                <h4 class="title">ToDo List</h4>
                                                <p class="category">upcoming activities and events</p>
                                            </div>
                                            <div class="content">
                                                <div class="table-full-width">
                                                    <table class="table">
                                                        <tbody>
                                                            <% for(Task task: tasks){ %>
                                                                <tr>
                                                                    <td>
                                                                        <div class="checkbox">
                                                                            <input id="checkbox1" type="checkbox">
                                                                            <label for="checkbox1"></label>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <%= String.valueOf(task.getTaskName()+"    "+task.getTaskDuration()) %>
                                                                    </td>
                                                                    <td class="td-actions text-right">
                                                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                                            <i class="pe-7s-pen"></i>
                                                                        </button>
                                                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                            <i class="pe-7s-close"></i>
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="footer">
                                                    <hr>
                                                    <div class="stats">
                                                        <i class="fa fa-history"></i> Last updated 3 minutes ago
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="header">
                                                <h4 class="title">Add event</h4>
                                            </div>
                                            <div class="content">
                                                <div class="panel panel-login">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <form id="login-form" action="addevent" method="post" role="form" style="display: block;">
                                                                    <div class="form-group">
                                                                        <input type="text" name="eventname" id="eventname" tabindex="1" class="form-control" placeholder="Event name" pattern=".{3,}" data-validation="alphanumeric" data-validation-allowing="-_ " required title="3 characters minimum" value="">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input type="text" name="eventdescription" data-validation="alphanumeric" pattern=".{0}|.{5,}" title="Either 0 OR (5 chars minimum)" data-validation-allowing="-_ " id="eventdescription" tabindex="2" class="form-control" placeholder="Event Description" value="">
                                                                    </div>
                                                                    <div class="form-group col-lg-12">
                                                                        <div>
                                                                            <label for="which-course">Select event type: </label>
                                                                            <select id="type" name="type" form="login-form">
                                                                                <option value="other">Other</option>
                                                                                <option value="test">Test</option>
                                                                                <option value="assignment">Assignment</option>
                                                                                <option value="project">Project</option>
                                                                            </select>
                                                                        </div>

                                                                        <div id="courseCode">
                                                                            <label for="coursecode">Select course: </label>
                                                                            <select id="coursecode" name="coursecode" form="login-form">
                                                                                <option value="other">Other</option>
                                                                                <% for(String course: courses){ %>
                                                                                    <option value=<%=String.valueOf( "\" "+course+"\"") %>>
                                                                                        <%= String.valueOf(course) %>
                                                                                    </option>
                                                                                    <% } %>
                                                                            </select>
                                                                            <div id="manualCourseCode" form="login-form">
                                                                                <input type="text" name="manualCourseCode" id="manualcoursecode" tabindex="3" class="form-control" placeholder="ENTER COURSE CODE E.G. CSC3003S" value="">
                                                                            </div>
                                                                        </div>

                                                                        <div id="hoursNeeded">
                                                                            <label>Time required in Hours and Minutes: format HH-MM
                                                                            </label>
                                                                            <input type="text" name="timeneeded" id="timeneeded" tabindex="3" class="form-control" placeholder="Leave blank if other" value="08-00">
                                                                        </div>
                                                                    </div>
                                                                    <div id="startDate" class="form-group">
                                                                        <input type="text" name="startdate" id="startdate" required tabindex="3" class="form-control" data-validation="date" data-validation-format="yyyy-mm-dd" placeholder="Start Date: YYYY-MM-DD" value="">
                                                                    </div>
                                                                    <div id="endDate" class="form-group">
                                                                        <input type="text" name="enddate" id="enddate" tabindex="4" class="form-control" placeholder="End Date: YYYY-MM-DD" data-validation="date" data-validation-format="yyyy-mm-dd" value="">
                                                                    </div>
                                                                    <div id="startTime" class="form-group">
                                                                        <input type="text" name="starttime" id="starttime" required tabindex="5" class="form-control" placeholder="Start Time: HH:MM" value="">
                                                                    </div>
                                                                    <div id="endTime" class="form-group">
                                                                        <input type="text" name="endtime" id="endtime" tabindex="6" class="form-control" placeholder="End Time: HH:MM" value="">
                                                                    </div>
                                                                    <div id="Duration" class="form-group">
                                                                        <input type="number" name="duration" id="duration" tabindex="6" class="form-control" placeholder="Enter test duration in minutes" value="">
                                                                    </div>

                                                                    <div id="submit" class="form-group">
                                                                        <div class="row">
                                                                            <div class="col-sm-6 col-sm-offset-3">
                                                                                <input type="submit" name="event-submit" id="event-submit" tabindex="7" class="form-control btn btn-login" value="Add Event">
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
                                    <div class="col-md-8">
                                        <div class="card ">
                                            <div class="header"></div>
                                            <div class="content">
                                                <div id='content'>
                                                    <div id='calendar'></div>
                                                </div>
                                                <div class="footer">
                                                    <hr>
                                                    <div class="stats">
                                                        <i class="fa fa-history"></i> No. of events today: <%= String.valueOf(currentEvents.size())%>>
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
                                        <li><a href="/"> Planner </a></li>
                                        <li><a href="https://www.cs.uct.ac.za/~sbnnko004/outline"> Project Outline </a></li>
                                        <li><a href="https://www.cs.uct.ac.za/~sbnnko004/members"> Group Members </a></li>
                                    </ul>
                                </nav>
                            </div>
                        </footer>
                    </div>
                </div>

            </div>
        </body>
        <script src='./js/fullcalendar.js'></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
        <script>
            $.validate();
        </script>

    </html>