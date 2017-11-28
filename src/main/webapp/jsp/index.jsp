<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <title>MotivWBS</title>
    <script src="<c:url value="/js/cleave.min.js" />"></script>
    <link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/index.css" />" rel="stylesheet" type="text/css">
    <script src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>
    <script src="<c:url value="/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/js/index.js" />"></script>

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
    <div id="main">
        <div id="content">
            <section>
                <div class="col-md-8 col-md-offset-2">
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
                            <div class="table-container">
                                <div class="table table-filter">
                                    <div id="todoTable">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section>
                <form id="addNewTodo" method="post" action="/addTodo">
                    <div class="col-md-2 form-line">
                        <div class="form-group">
                            <label for="inputDueDate">Due Date</label>
                            <input type="text" name="dueDate" class="formattedDate form-control">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="inputDescription">Description</label>
                            <input type="text" name="description" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-1">
                            <input type="submit" class="btn btn-default" value="Add Task">
                    </div>

                </form>
            </section>
        </div>
    </div>
</div>

<script type="text/javascript">


</script>
</body>
</html>
