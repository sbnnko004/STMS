<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList"
    import="com.stms.util.Event"
    import="com.stms.util.Test"
    import="com.stms.util.Project"
    import="com.stms.util.Assignment"
    
    %>
<html lang="en">
<%
	Object object = request.getAttribute("events");
	ArrayList<Event> events=new ArrayList<>();
	if(object instanceof ArrayList){
		events=(ArrayList<Event>)object;
	}
	
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
    <link rel="stylesheet" href="//jonthornton.github.io/jquery-timepicker/jquery.timepicker.css">
    <script src="https://jonthornton.github.io/jquery-timepicker/jquery.timepicker.js"></script>
    <link href='./css/fullcalendar.css' rel='stylesheet' />
    <link href='./css/fullcalendar.print.css' rel='stylesheet'  media='print' />
    <script src='./js/fullcalendar.js'></script>
    
    <script>
        jQuery(function($){ // wait until the DOM is ready
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
      		var appended = $('<div />').html("<label for=\"which-course\">Enter course code e.g. CSC3003S</label>\n<input type=\"text\" name=\"coursecode\" id=\"coursecode\" tabindex=\"3\" class=\"form-control\" placeholder=\"Leave blank if other\" value=\"\">");
      		appended.id = 'appended';
      		$('input:radio[name="course"]').change(
      		    function(){
      		        if ($(this).val() == 'test'||$(this).val() == 'assignment'||$(this).val() == 'project') {
      		            $(appended).appendTo('#here');
      		        }
      		        else {
      		            $(appended).remove();
      		        }
      		    });


        });
        $(document).ready(function() {

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
              events: [	<%
				for(int i=0;i<events.size();i++){
					%>
				{
				  id: <%= String.valueOf(events.get(i).getEventID())%>,
				  title: <%= String.valueOf("'"+events.get(i).getEventName()+"'")%>,
				  start: new Date(<%= String.valueOf(Integer.parseInt(events.get(i).getStartDate().split("-")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartDate().split("-")[1])-1)%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartDate().split("-")[2]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartTime().split(":")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getStartTime().split(":")[1]))%>),
				  end: new Date(<%= String.valueOf(Integer.parseInt(events.get(i).getEndDate().split("-")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndDate().split("-")[1])-1)%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndDate().split("-")[2]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndTime().split(":")[0]))%>, <%= String.valueOf(Integer.parseInt(events.get(i).getEndTime().split(":")[1]))%>),
				  allDay: false,
				  <%
					if(events.get(i) instanceof Assignment){
					%>backgroundColor: '#9932cc'
				<%
					}else if(events.get(i) instanceof Test){
					%>backgroundColor: '#ff0000'
				<%
					}else if(events.get(i) instanceof Project){
							%>backgroundColor: '#ffd700'<%
					}
					%>
				}
				<%if(i<=events.size()-1){%>,<%}}%>
				]
            });

          });

	
		</script>
    <style>


</style>
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
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <input id="checkbox1" type="checkbox">
                                                                <label for="checkbox1"></label>
                                                            </div>
                                                        </td>
                                                        <td>Start working on event one.</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                                <i class="pe-7s-pen"></i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="pe-7s-close"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
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
	                                                            <input type="text" name="eventname" id="eventname" tabindex="1" class="form-control" placeholder="Event name" value="">
	                                                        </div>
	                                                        <div class="form-group">
	                                                            <input type="text" name="eventdescription" id="eventdescription" tabindex="2" class="form-control" placeholder="Event Description" value="">
	                                                        </div>
														    <div class="form-group">														      
														      <div class="col-lg-12">
														      	<label for="which-course">Select event type: </label>
														      	<select  name="type" form="login-form">
																  <option value="other">Other</option>
																  <option value="test">Test</option>
																  <option value="assignment">Assignment</option>
																  <option value="protest">Project</option>
																</select>
														      </div>
   														      <div class="reveal-if-active">
														        <label for="which-course">Enter course code e.g. CSC3003S</label>
														        <input type="text" name="coursecode" id="coursecode" tabindex="3" class="form-control" placeholder="Leave blank if other" value="">
														      </div>
     														  <div class="reveal-if-active">
														        <label for="which-course">Time required in Hours and Minutes: format HH-MM <br/>(This will be a drop down selector and will only show when Projects and Tests are shown)</label>
														        <input type="text" name="timeneeded" id="timeneeded" tabindex="3" class="form-control" placeholder="Leave blank if other" value="10-00">
														      </div>
													      </div>
													      	<!--div class="form-group">
														    	<div>
														    		<input type="radio" id="eventChoice1"
														        	   name="type" value="test">
															    	<label for="eventChoice1">Test</label>
															    	<input type="radio" id="eventChoice2"
														        	   name="type" value="assignment">
															    	<label for="eventChoice2">Assignment</label>
															    	<input type="radio" id="eventChoice3"
														        	   name="type" value="project">
															    	<label for="eventChoice3">Project</label>
															    	<input type="radio" id="eventChoice4"
														        	   name="type" value="other">
															    	<label for="eventChoice4">Other</label>
															  	</div>
														      	<div id="#here">
														      	</div>

														    </div-->
														    
	                                                        <div class="form-group">
	                                                            <input type="text" name="startdate" id="startdate" tabindex="3" class="form-control" placeholder="Start Date: YYYY-MM-DD" value="">
	                                                        </div>
	                                                        <div class="form-group">
	                                                            <input type="text" name="enddate" id="enddate" tabindex="4" class="form-control" placeholder="End Date: YYYY-MM-DD" value="">
	                                                        </div>
	                                                        <div class="form-group">
	                                                            <input type="text" name="starttime" id="starttime" tabindex="5" class="form-control" placeholder="Start Time: HH:MM" value="">
	                                                        </div>
	                                                        <div class="form-group">
	                                                            <input type="text" name="endtime" id="endtime" tabindex="6" class="form-control" placeholder="End Time: HH:MM" value="">
	                                                        </div>
	                                                        <div class="form-group">
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
                                    <div class="header">
                                    </div>
                                    <div class="content">
                                        <div id='content'>
                                              <div id='calendar'></div>
                                        </div>
                                        <div class="footer">
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-history"></i> No. of events today: 2
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <footer  class="footer">
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
        
     </div>
</body>

</html>