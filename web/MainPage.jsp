<%-- 
    Document   : MainPage
    Created on : 25 Jan, 2018, 2:55:29 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pojo.sample" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Main</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  <style>
    .jumbotron{
    height: 100vh;
}
  </style>
</head>
<body>
  <div class="jumbotron jumbotron-fluid">
  <div class="container">
      <div>Hey  ${user.name} ! </div>  
    <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#Share">Share</a></li>
    <li><a data-toggle="tab" href="#Borrow">Borrow</a></li>
    <li><a data-toggle="tab" href="#History">History</a></li>
    <li><a data-toggle="tab" href="#Profile">Profile</a></li>
  </ul>
  <div class="tab-content">
  <div id="Share" class="tab-pane fade in active panel panel-success">
      <h3 class="panel-heading">
          Books you would like to share?
     </h3>
     <p class="panel-body">
         <jsp:include page="BookServlet">
             <jsp:param name="user" value="${user.userid}"/>
             <jsp:param name="type" value="0"/>
         </jsp:include>
         <c:if test="${not empty books0}">
             
         </c:if>
         <c:if test="${empty books0}">
         <div>
             You have not shared any books yet!
             
         </div>
          <a href="">Would you like to?</a>
        
         </c:if> 
         
     
  </div>
    <div id="Borrow" class="tab-pane fade panel panel-success">
      <h3 class="panel-heading">
          Books you would like to borrow?
     </h3>
     <p class="panel-body">
      <jsp:include page="BookServlet">
             <jsp:param name="user" value="${user.userid}"/>
             <jsp:param name="type" value="2"/>
         </jsp:include>
         <c:if test="${not empty books2}">
             
         </c:if>
         <c:if test="${empty books2}">
         <div>
             You have not looked up any books yet!
         </div>
         </c:if>
      </div>
    <div id="History" class="tab-pane fade panel panel-success">
      <h3 class="panel-heading">
          Your activity so far...
      </h3>
      <p class="panel-body">
      
      </p>
    </div> 
    <div id="Profile" class="tab-pane fade panel panel-success">
      <h3 class="panel-heading">
          Profile
     </h3>
     <div class="panel-body">
         <div>
          <form class="form-signin" name="loginForm" action="ProfileChangeServlet" method="post" onsubmit="return validate()">
              <table>
                  <tr>
                      <td>Name</td>
                      <td>
                          <div>${user.name}</div>
                      </td>
                  </tr>
                  <tr>
                      <td>DOB</td>
                      <td>
                          <div>${user.dob}"</div>
                      </td>
                  </tr>
                  <tr><td>
                      User Name
                      </td>
                      <td>
                          <div>${user.userid}"</div>
                      </td>
                  </tr>
                  <tr><td>
                      Email
                      </td>
                      <td>
                          <div>${user.email}"</div>
                      </td>
                  </tr>
                  
                  <tr>
                      <td>
                         Password 
                      </td>
                      <td>
                       <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="" value="${user.password}"/>   
                      </td>
                  </tr>
                  <tr>
                      <td>
                         Confirm Password 
                      </td>
                      <td>
                      <input type="password" class="form-control" id="confpass" name="password" placeholder="Confirm Password" required="${user.password}"/>   
                      </td>
                  </tr>
                  <tr>
                      <td>
                  <button class="btn btn-lg btn-primary btn-block" type="submit">Save Changes</button>
                      </td>
                  </tr>
              </table>
          </form>
         </div>
     </div>
    </div>
  </div>
  </div>
</div>
</body>
</html>
