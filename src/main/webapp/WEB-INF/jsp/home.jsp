<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <title>MotivWBS</title>
    <script src="<c:url value="/static/js/cleave.min.js" />"></script>
    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/static/css/index.css" />" rel="stylesheet" type="text/css">
    <script src="<c:url value="/static/js/jquery-3.2.1.min.js" />"></script>
    <script src="<c:url value="/static/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/static/js/index.js"/> "></script>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>
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
                <form id="addNewTodo" method="post">
                    <div class="col form-line">
                        <div class="form-group">
                            <label for="dueDate">Due Date</label>
                            <input type="text" name="dueDate" id="dueDate" class="formattedDate form-control">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" name="description" id="description" class="form-control">
                        </div>
                    </div>
                    <div class="col">
                        <input type="submit" class="btn btn-default" value="Add Task">
                    </div>

                </form>
            </section>
        </div>
    </div>
</div>

<div>
    Logged in as: <span id="user"></span>
</div>
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
</script>
</body>
</html>
