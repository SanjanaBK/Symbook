<%-- 
    Document   : register
    Created on : 2 Jan, 2018, 1:07:36 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to BookShare!</title>
        <script type="text/javascript">
            function validate(){
                var name = document.getElementById("name").value;
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var conf = document.getElementById("confpass").value;
                console.log(password);
                console.log(conf);
                if(password.length < 6){
                    alert("Password length should be atleast 6 characters or more!");
                    return false;
                }
                if(password === conf)
                    return true;
                
                alert("Passwords do not match!");
                
                return false;
            }
        </script>
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
        <form class="form-signin" name="loginForm" action="RegisterServlet" method="post" onsubmit="return validate()">       
          <h2 class="form-signin-heading">Please register</h2>
          <input type="text" class="form-control" id="name" name="name" placeholder="Name" required="" autofocus="" />
          <input type="date" class="form-control" id="dob" name="dob" placeholder="Date of Birth" required="" autofocus=""/>
          <input type="text" class="form-control" id="username" name="username" placeholder="Username" required="" autofocus=""/>
          <input type="text" class="form-control" id="email" name="email" placeholder="Email Address" required="" autofocus=""/>
          <input type="password" class="form-control" id="password" name="password" placeholder="Password" required=""/>
          <input type="password" class="form-control" id="confpass" name="password" placeholder="Confirm Password" required=""/>
          
          <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
        </form>
        <c:if test="${not empty message}"> 
        <p class="well well-sm">
            ${message}
        </p>
        </c:if>
    </div>    
 
    </body>
</html>
