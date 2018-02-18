<%-- 
    Document   : login
    Created on : 30 Dec, 2017, 9:06:32 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to BookShare!</title>
        <link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
        <style class="cp-pen-styles"> 
            body {
            background: #eee !important;
            }

            .wrapper {
                margin-top: 80px;
                margin-bottom: 80px;
            }

            .form-signin {
                max-width: 380px;
                padding: 15px 35px 45px;
                margin: 0 auto;
                background-color: #fff;
                border: 1px solid rgba(0, 0, 0, 0.1);
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 30px;
            }
            .form-signin .checkbox {
                font-weight: normal;
            }
            .form-signin .form-control {
                position: relative;
                font-size: 16px;
                height: auto;
                padding: 10px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            .form-signin .form-control:focus {
                z-index: 2;
            }
            .form-signin input[type="text"] {
                margin-bottom: -1px;
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 0;
            }
            .form-signin input[type="password"] {
              margin-bottom: 20px;
              border-top-left-radius: 0;
              border-top-right-radius: 0;
            }
        </style>
    </head>
    <body>
    <div class="wrapper">
    <form class="form-signin" name="loginForm" action="LoginServlet" method="post">       
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="email" placeholder="Email Address" required="" autofocus="" />
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
      <a href="register.jsp"> Not a member? Register now!</a>
    </form>
    <c:if test="${not empty message}"> 
        <p class="well well-sm" >
            ${message}
        </p>
        </c:if>    
    </div>    
    </body>
</html>
