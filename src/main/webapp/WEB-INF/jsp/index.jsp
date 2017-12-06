<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>MotivWBS</title>
    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
    <script src="<c:url value="/static/js/jquery-3.2.1.min.js" />"></script>
    <script src="<c:url value="/static/js/bootstrap.bundle.min.js" />"></script>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>


<div class="container unauthenticated">
    With Facebook: <a href="/login/facebook">click here</a>

</div>
<div class="container authenticated">
    Logged in as: <span id="user"></span>
    To Todo <a href="/home">Meh</a>
    <div>
        <button onClick="logout()" class="btn btn-primary">Logout</button>
    </div>
</div>
<script src="<c:url value="/static/js/js.cookie.js" />"></script>
<script type="text/javascript">
    $(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });

    var logout = function() {
        $.post("/logout", function() {
            $("#user").html('');
            $(".unauthenticated").show();
            $(".authenticated").hide();
        })
        return true;
    }


</script>
</body>
</html>