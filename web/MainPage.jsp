<%-- 
    Document   : MainPage
    Created on : 25 Jan, 2018, 2:55:29 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pojo.sample" %>
<%@page import="pojo.Book" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Main</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%
      response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
  %>
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
            
            function conf(form,message){
                return confirm('Do you want to confirm this action: '+message+'?' );
            }
        </script>
        
            
  <style>
    .jumbotron{
    height: 100vh;
}
.glyphicon { margin-right:5px; }
.thumbnail
{
    margin-bottom: 20px;
    padding: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
}

.item.list-group-item
{
    float: none;
    width: 100%;
    background-color: #fff;
    margin-bottom: 10px;
}
.item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
{
    background: #428bca;
}

.item.list-group-item .list-group-image
{
    margin-right: 10px;
}
.item.list-group-item .thumbnail
{
    margin-bottom: 0px;
}
.item.list-group-item .caption
{
    padding: 9px 9px 0px 9px;
}
.item.list-group-item:nth-of-type(odd)
{
    background: #eeeeee;
}

.item.list-group-item:before, .item.list-group-item:after
{
    display: table;
    content: " ";
}

.item.list-group-item img
{
    float: left;
}
.item.list-group-item:after
{
    clear: both;
}
.list-group-item-text
{
    margin: 0 0 11px;
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
            
            .Searchinput input[type=text] {
                width: 130px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                background-color: white;
                background-image: url('searchicon.png');
                background-position: 10px 10px; 
                background-repeat: no-repeat;
                padding: 12px 20px 12px 40px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }

            .Searchinput input[type=text]:focus {
                width: 100%;
            }
  </style>
  
</head>
<body>
  <%
      String user = (String) session.getAttribute("userid");
      if(null==user)
        response.sendRedirect("login.jsp");
  %>  
  <div class="jumbotron jumbotron-fluid">
  <div class="container">
      <h3>Hey  ${user.name} ! </h3> 
      <div id="Logout" style="float: right">
          <a href="Logout.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
      </div>
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
      <div class="panel-body">
         <jsp:include page="BookServlet">
             <jsp:param name="user" value="${user.userid}"/>
             <jsp:param name="type" value="0"/>
         </jsp:include>
         
      <div class="well well-sm">
             <strong>Books</strong>
             <div class="btn-group">
                 <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list"></span>List</a>
                 <a href="#" id="grid" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th"></span>Grid</a>
             </div>
        </div>
      <div id="products" class="row list-group">
          <div class="item col-xs-4 col-lg-4">
                <div class="thumbnail">
                   <img class="group list-group-image" src="" alt="Image placeholder" />
                   <div class="caption">
                       <h4 class="group inner-list-group-item-heading">
                           Add new book
                       </h4>
                       <div class="group inner-list-group-item-text">
                           <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Click here to add a book.</button>    
                         <!-- Modal -->
                           <div class="modal fade" id="myModal" role="dialog">
                             <div class="modal-dialog">

                               <!-- Modal content-->
                               <div class="modal-content">
                                 <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                                   <h4 class="modal-title">Hey, ${user.name}! Ready to share?</h4>
                                 </div>
                                 <div class="modal-body">
                                     <form class="form-signin" name="ShareBookForm" action="ShareServlet" method="post">       
                                      <h2 class="form-signin-heading">Save your book details.</h2>
                                           <input type="text" class="form-control" id="name" name="bookname" placeholder="Book Name" required="" autofocus="" />
                                           <input type="hidden" class="form-control" id="username" name="username" value="${user.userid}"/>
                                           <input type="text" class="form-control" id="author" name="author" placeholder="Author's Name" required="" autofocus=""/>
                                           <input type="text" class="form-control" id="genre" name="genre" placeholder="Genre of the book" required=""/>
                                           <input type="radio" class="form-control" name="type" value="0" checked=""/> Paperback <br>
                                           <input type="radio" class="form-control" name="type" value="2" /> Kindle <br>
                                           <input type="radio" class="form-control" name="type" value="1"/> Hardback <br>
                                           <input type="file" class="form-control" name="image" placeholder="Add your book pic!" accept="image/*">
                                           <button class="btn btn-lg btn-primary btn-block" type="submit">Save book</button>
                                         </form>
                                   </div>
                               </div>

                             </div>
                           </div>
                       </div>    

                   </div>
                </div>
            </div>
        </div>
         <c:if test="${not empty books0}">
             <div id="products" class="row list-group">
                 <c:forEach items="${books0}" var="bookL">
                 <div class="item col-xs-4 col-lg-4">
                     <div class="thumbnail">
                        <img class="group list-group-image" src="" alt="Image placeholder" />
                        <div class="caption">
                            <h4 class="group inner-list-group-item-heading">
                                ${bookL.name}
                            </h4>
                            <div class="group inner-list-group-item-text">
                                Written by ${bookL.author}, the book belongs to ${bookL.genre} and is ${bookL.type}.
                                It is currently ${bookL.status}.
                            
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                   <div class="group inner-list-group-item-text">
                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#EditModal">Edit</button>    
                         <!-- Modal -->
                           <div class="modal fade" id="EditModal" role="dialog">
                             <div class="modal-dialog">

                               <!-- Modal content-->
                               <div class="modal-content">
                                 <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                                   <h4 class="modal-title">Only proceed if you want to edit your book details</h4>
                                 </div>
                                 <div class="modal-body">
                                     <form class="form-signin" name="EditBookForm" action="EditServlet" method="post">       
                                      <h2 class="form-signin-heading">Edit your book details.</h2>
                                           <input type="text" class="form-control" id="name" name="bookname" placeholder="Book Name" required="" autofocus="" value="${bookL.name}"/>
                                           <input type="hidden" class="form-control" id="username" name="username" value="${user.userid}"/>
                                           <input type="hidden" class="form-control" name="edit" value="edit"/>
                                           <input type="text" class="form-control" id="author" name="author" placeholder="Author's Name" required="" autofocus="" value="${bookL.author}"/>
                                           <input type="text" class="form-control" id="genre" name="genre" placeholder="Genre of the book" required="" value="${bookL.genre}"/>
                                           <input type="radio" class="form-control" name="type" value="0" checked=""/> Paperback <br>
                                           <input type="radio" class="form-control" name="type" value="2" /> Kindle <br>
                                           <input type="radio" class="form-control" name="type" value="1"/> Hardback <br>
                                           <input type="file" class="form-control" name="image" placeholder="Add your book pic!" accept="image/*">
                                           <button class="btn btn-lg btn-primary btn-block" type="submit">Save book</button>
                                         </form>
                                   </div>
                               </div>

                             </div>
                           </div>
                       </div>
                                </div>
                                
                                <div class="col-xs-12 col-md-6">
                                    <form action="DeleteServlet" method="post" onsubmit="return conf(this,'Delete')">
                                        <input type="hidden" name="book" value="${bookL.name}"/>
                                        <input type="hidden" name="user"value="${user.userid}"/>
                                        <input class="btn btn-info btn-lg" type="submit" value="Delete"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                     </div>
                 </div>
                 </c:forEach>
             </div>
         </c:if> 
  </div>
  </div>
    <div id="Borrow" class="tab-pane fade panel panel-success">
      <div class="panel-body">
      <jsp:include page="BorrowedServlet">
             <jsp:param name="user" value="${user.userid}"/>
             <jsp:param name="status" value="1"/>
         </jsp:include>
         <div>
             Want to look up any good books?
             <form action="SearchServlet" method="get"> 
                <input type="text" name="search" class="Searchinput" placeholder="Search... ">
                <input type="hidden" name="user" value="${user.userid}">
             </form>
        
      <c:if test="${not empty retrievedBooks}">
          <c:forEach items="${retrievedBooks}" var="bookR">
             <div class="item col-xs-4 col-lg-4">
                     <div class="thumbnail">
                        <img class="group list-group-image" src="" alt="Image placeholder" />
                        <div class="caption">
                            <h4 class="group inner-list-group-item-heading">
                                ${bookR.name}
                            </h4>
                            <div class="group inner-list-group-item-text">
                                Written by ${bookR.author}, the book belongs to ${bookR.genre} and is ${bookR.type}.
                                It is currently ${bookR.status}.The owner is ${bookR.user}. 
                            
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <form action="BorrowBookServlet" method="post" onsubmit="return conf(this,'borrow')">
                                        <input type="hidden" name="book" value="${bookR.name}"/>
                                        <input type="hidden" name="borrower" value="${user.userid}"/>
                                        <input type="hidden" name="lender" value="${bookR.user}"/>
                                        <input class="btn btn-info btn-lg" type="submit" value="Borrow"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                     </div>
                 </div>
                  
          </c:forEach>
      </c:if>
             </div>
        <h3 class="panel-heading">
          Books you have borrowed....
     </h3>
      
        <c:if test="${not empty books2}">
             <div id="products" class="row list-group">
                 <c:forEach items="${books2}" var="bookB">
                 <div class="item col-xs-4 col-lg-4">
                     <div class="thumbnail">
                        <img class="group list-group-image" src="" alt="Image placeholder" />
                        <div class="caption">
                            <h4 class="group inner-list-group-item-heading">
                                ${bookB.name}
                            </h4>
                            <div class="group inner-list-group-item-text">
                                Written by ${bookB.author}, the book belongs to ${bookB.genre} and is ${bookB.type}.
                                It is currently ${bookB.status}. The owner is ${bookB.owner} and was borrowed on ${bookB.date}
                            
                            </div>
                            <div class="row">   
                            <div class="col-xs-12 col-md-6">
                                    <form action="ReturnServlet" method="post" onsubmit="return conf(this,'Return')">
                                        <input type="hidden" name="${bookL.name}"/>
                                        <input type="hidden" name="${user.userid}"/>
                                        <input class="btn btn-info btn-lg" type="submit" value="Return"/>
                                    </form>
                                </div>
                            </div>
                           
                        </div>
                     </div>
                 </div>
                 </c:forEach>
             </div>
             
         </c:if>
    </div>   
      </div>
    <div id="History" class="tab-pane fade panel panel-success">
      <h3 class="panel-heading">
          Books shared...
      </h3>
      <div class="panel-body">
          <jsp:include page="BorrowedServlet">
             <jsp:param name="user" value="${user.userid}"/>
             <jsp:param name="status" value="0"/>
         </jsp:include>
           <c:if test="${not empty booksShared}">
             <div id="products" class="row list-group">
                 <c:forEach items="${booksShared}" var="bookS">
                 <div class="item col-xs-4 col-lg-4">
                     <div class="thumbnail">
                        <img class="group list-group-image" src="" alt="Image placeholder" />
                        <div class="caption">
                            <h4 class="group inner-list-group-item-heading">
                                ${bookS.name}
                            </h4>
                            <div class="group inner-list-group-item-text">
                                Written by ${bookS.author}, the book belongs to ${bookS.genre} and is ${bookS.type}.
                                It is currently ${bookS.status}. The borrower is ${bookS.borrower} and was borrowed on ${bookB.date}
                            
                            </div>      
                        </div>
                     </div>
                 </div>
                 </c:forEach>
             </div>
             
         </c:if>
         <c:if test="${empty bookShared}">
             Your books have not been borrowed currently.
         </c:if>
      </div>
      <h3 class="panel-heading">
          Books returned...
      </h3>
      <div class="panel-body">
          <jsp:include page="BorrowedServlet">
             <jsp:param name="user" value="${user.userid}"/>
             <jsp:param name="status" value="2"/>
         </jsp:include>
           <c:if test="${not empty booksBorrowed}">
             <div id="products" class="row list-group">
                 <c:forEach items="${booksBorrowed}" var="bookBor">
                 <div class="item col-xs-4 col-lg-4">
                     <div class="thumbnail">
                        <img class="group list-group-image" src="" alt="Image placeholder" />
                        <div class="caption">
                            <h4 class="group inner-list-group-item-heading">
                                ${bookBor.name}
                            </h4>
                            <div class="group inner-list-group-item-text">
                                Written by ${bookBor.author}, the book belongs to ${bookBor.genre} and is ${bookBor.type}.
                                It is currently ${bookBor.status}. The borrower is ${bookBor.borrower} and was returned on ${bookBor.rdate}
                            
                            </div>      
                        </div>
                     </div>
                 </div>
                 </c:forEach>
             </div>
             
         </c:if>
         <c:if test="${empty bookShared}">
             Your books have not been borrowed currently.
         </c:if>
          
      </div> 
    </div> 
    <div id="Profile" class="tab-pane fade panel panel-success">
      <h3 class="panel-heading">
          Profile
     </h3>
     <div class="panel-body">
         <div>
          <form class="form-signin" name="loginForm" action="EditServlet" method="post" onsubmit="return validate()">
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
                      <input type="hidden" class="form-control" name="edit" value="password"/>
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
