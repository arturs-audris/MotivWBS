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
    <script src="<c:url value="/static/js/index.js"/> "></script>
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

<div id="wrapper">
    <header>
        <div class="container-fluid">
            <h1 id="logo">
                TODO List
            </h1>
        </div>
    </header>
    <div id="main" class="container-fluid">
        <div id="content">
            <section>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-success btn-filter" data-target="done">Done
                                </button>
                                <button type="button" class="btn btn-danger btn-filter" data-target="overdue">
                                    Overdue
                                </button>
                                <button type="button" class="btn btn-warning btn-filter" data-target="pending">
                                    Pending
                                </button>
                                <button type="button" class="btn btn-info btn-filter" data-target="all">All
                                </button>
                            </div>
                        </div>
                        <div id="todoTable">

                        </div>
                    </div>
                </div>
            </section>
            <section>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#newTask">New Task</button>
                <div class="modal fade" id="newTask" tabindex="-1" role="dialog" aria-labelledby="newTask" aria-hidden="true">
                    <div class="modal-wrapper">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-blue">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h4 class="modal-title"><i class="fa fa-pencil"></i> Create New Task</h4>
                                </div>
                                <form id="addNewTodo" method="post">
                                    <div class="modal-body">
                                        <div class="form-group input-group date">
                                            <input name="dueDate" id="dueDate" type="text" class="form-control" placeholder="dd/mm/yyyy">
                                        </div>
                                        <div class="form-group">
                                            <textarea name="description" class="form-control" id="description" placeholder="Task description" style="height: 120px;"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i>Cancel</button>
                                        <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-pencil"></i>Add Task</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.0/js.cookie.min.js"></script>
<script type="text/javascript">
    $(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });

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
