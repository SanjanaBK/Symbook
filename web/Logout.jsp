<%-- 
    Document   : UploadBook
    Created on : 18 Feb, 2018, 4:21:01 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookShare - Logout</title>
    </head>
    <body>
        <%
        request.getSession().removeAttribute("userid");    
        request.getSession().invalidate();
        response.sendRedirect("login.jsp");
        
        %>
    </body>
</html>
