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

    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="./css/pe-icon-7-stroke.css" rel="stylesheet" />

    <script src="./js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

    <script src="./js/bootstrap-notify.js"></script>
    <script src="./js/bootstrap.js"></script>


    <script src="./js/light-bootstrap-dashboard.js?v=1.4.0"></script>
    <script src="https://unpkg.com/ionicons@4.3.0/dist/ionicons.js"></script>

    <link href="./css/custom.css" rel="stylesheet" />
    <script src="./js/custom.js"></script>

    <link href='./css/fullcalendar.css' rel='stylesheet' />
    <link href="./css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src='./js/jquery/jquery-ui.custom.min.js'></script>
    <script src='./js/fullcalendar.js'></script>
    <script>
        $(document).ready(function() {
			    var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
					
					  
				/* initialize the external events
				-----------------------------------------------------------------*/
			
				$('#external-events div.external-event').each(function() {
					
					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title: $.trim($(this).text()) // use the element's text as the event title
					};
					
					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);
					
					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex: 999,
						revert: true,      // will cause the event to go back to its
						revertDuration: 0  //  original position after the drag
					});
					
				});
			
			
			/* initialize the calendar
				-----------------------------------------------------------------*/
				
				var calendar =  $('#calendar').fullCalendar({
					header: {
						left: 'title',
						center: 'agendaDay,agendaWeek,month',
						right: 'prev,next today'
					},
					editable: true,
					firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
					selectable: true,
					defaultView: 'month',
					
					axisFormat: 'h:mm',
					columnFormat: {
		                month: 'ddd',    // Mon
		                week: 'ddd d', // Mon 7
		                day: 'dddd M/d',  // Monday 9/7
		                agendaDay: 'dddd d'
		            },
		            titleFormat: {
		                month: 'MMMM yyyy', // September 2009
		                week: "MMMM yyyy", // September 2009
		                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
		            },
					allDaySlot: false,
					selectHelper: true,
					select: function(start, end, allDay) {
						var title = prompt('Event Title:');
						if (title) {
							calendar.fullCalendar('renderEvent',
								{
									title: title,
									start: start,
									end: end,
									allDay: allDay
								},
								true // make the event "stick"
							);
						}
						calendar.fullCalendar('unselect');
					},
					droppable: true, // this allows things to be dropped onto the calendar !!!
					drop: function(date, allDay) { // this function is called when something is dropped
					
						// retrieve the dropped element's stored Event Object
						var originalEventObject = $(this).data('eventObject');
						
						// we need to copy it, so that multiple events don't have a reference to the same object
						var copiedEventObject = $.extend({}, originalEventObject);
						
						// assign it the date that was reported
						copiedEventObject.start = date;
						copiedEventObject.allDay = allDay;
						
						// render the event on the calendar
						// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
						$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
						
						// is the "remove after drop" checkbox checked?
						if ($('#drop-remove').is(':checked')) {
							// if so, remove the element from the "Draggable Events" list
							$(this).remove();
						}
						
					},
					
					events: [
						
					],			
				});
				
				
			});
	
		</script>
    <script>
        $('#calender').focus();
		</script>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-image="./images/sideBarBackground.png">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://www.cs.uct.ac.za/~sbnnko004" class="simple-text">
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
                    <div class="row">
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
                                        <div id='wrap'>
                                            <div id='calendar' name="calender"></div>
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
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Add event</h4>
                                    </div>
                                    <div class="content">
                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer style="position: fixed;    bottom: 0;  width: 100%;" class="footer">
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

</html>