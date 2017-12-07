<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>MotivWBS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
    <script src="<c:url value="/static/js/todo.js"/> "></script>
    <link href="<c:url value="/static/css/todo.css" />" rel="stylesheet" type="text/css">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header active">
            <a class="navbar-brand" href="/">MotivWBS</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/todoList">Todo</a></li>
            <li><a href="/help">Help</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="unauthenticated"><a href="/login/facebook">Log in with Facebook</a></li>
            <li class="authenticated"><div class="navbar-text">Logged in as: <span id="user"></span></div></li>
            <li class="authenticated"><form method="post" action="/logout">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
                <input class="btn btn-default navbar-btn" type="submit" value="Logout">
            </form> </li>
        </ul>
    </div>
</nav>

<section class="content">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="grid task-content">
                <div class="grid-body">
                    <h2>Tasks</h2>
                    <hr>
                    <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#newTask">New Task</button>
                    <div class="modal fade" id="newTask" tabindex="-1" role="dialog" aria-labelledby="newTask" aria-hidden="true">
                        <div class="modal-wrapper">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header bg-blue">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title">Create New Task</h4>
                                    </div>
                                    <form id="addNewTodo" method="post">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input name="title" type="text" class="form-control" placeholder="Title">
                                            </div>
                                            <div class="form-group input-group date">
                                                <input name="dueDate" id="dueDate" type="text" class="form-control" placeholder="dd/mm/yyyy">
                                            </div>
                                            <div class="form-group">
                                                <textarea name="description" class="form-control" id="description" placeholder="Task description" style="height: 120px;"></textarea>
                                            </div>
                                            <div>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary pull-right addNewTodo">Add Task</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="padding"></div>
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="list-group fa-padding">
                                <div id="taskContainer"></div>
                            </ul>
                        </div>

                        <div id="taskPopupContainter"></div>
                    </div>

                </div></div></div>
        <div id="content">

        </div>
        <div class="col-md-1"></div>
    </div>
</section>


<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.0/js.cookie.min.js"></script>
<script type="text/javascript">
    $.get("/user", function(data) {
        $("#user").html(data.userAuthentication.details.name);
        $(".unauthenticated").hide();
        $(".authenticated").show();
    });

    jQuery(function($) {
        $('#dueDate').datepicker();
    });
</script>
</body>
</html>
