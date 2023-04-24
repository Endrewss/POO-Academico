<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - SessionApp</title>
        <%@include file="WEB-INF/jspf/html-head-libs.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf"  %>
        <% if (userName != null){ %>
        <div class="m-2">
            <h2>Usuários</h2>
            <%for (String user: users){%>
            <div> <%= user %> </div>
            <%}%>
        </div>
        <%}%>
        <%@include  file="WEB-INF/jspf/html-body-libs.jspf"%>
    </body>
</html>