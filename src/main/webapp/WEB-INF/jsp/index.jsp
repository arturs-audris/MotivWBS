<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>MotivWBS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            <li class="authenticated"><div class="navbar-text d-none">Logged in as: <span id="user"></span></div></li>
            <li class="authenticated"><a href="/logout" id="logout">Logout</a></li>
            <li><form method="post" action="/logout" id="logoutForm">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></form></li>
        </ul>
    </div>
</nav>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.0/js.cookie.min.js"></script>
<script type="text/javascript">
    $(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });

    window.onload = function() {
        var a = document.getElementById("logout");
        a.onclick = function() {
            var logoutForm = document.getElementById("logoutForm");
            logoutForm.submit();
            return false;
        }
    };

    $.ajax({
        url: "/user",
        type: 'GET',
        success: function(data){
            $("#user").html(data.userAuthentication.details.name);
            $(".unauthenticated").hide();
            $(".authenticated").show();
        },
        error: function(data) {
            $(".unauthenticated").show();
            $(".authenticated").hide();
        }
    });
</script>
</body>
</html>
