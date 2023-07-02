<%-- 
    Document   : profile.jsp
    Created on : Mar 6, 2023, 9:32:46 AM
    Author     : leyen
--%>

<%@page import="planthouse.dto.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <meta content="text/html" http-equiv="Content-Type" charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile</title>
        <link rel="stylesheet" href="css/teststyle.css">
       
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <form action="user" method="POST">

            <%
                User loginUser = (User) session.getAttribute("LOGIN_USER");
                if (loginUser == null || session == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
            %>
            <div class="container rounded mt-5 mb-5">      
                
                <div class="row">
                    <div class="col-lg-3 col-md-12">
                        <form action="logout">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" height="150px" 
                                                                                                     src="images/bannerProfile.png">
                            <h2 class="font-weight-bold mt-2" id="username">${sessionScope.LOGIN_USER.getFullName()}</h2>      
                            <c:url var="logoutLink" value="logout">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>
                            <button><a href="${logoutLink}">Logout</a></button>
                            <form action="order">
                                
                                <a href="order?action=HistoryTransaction&userid=${sessionScope.LOGIN_USER.getUserID()}">History Transaction</a>
                             
                            </form>
                        </div>
                        </form>



                    </div>
                    <div class="col-lg-5 col-md-12">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>

                            <div class="row mt-3">
                                 <p>${requestScope.addressrequired}</p>
                                <div class="col-md-6 mt-3"><label class="labels">Full name</label><input type="text" required="" name="fullName" class="form-control" placeholder="Enter Full name" value="${sessionScope.LOGIN_USER.getFullName()}"></div>                       

                                <div class="col-md-12 mt-3"><label class="labels">Telephone number</label><input required="" type="text" name="phone" class="form-control" placeholder="Enter phone number" value="${sessionScope.LOGIN_USER.getPhone()}"></div>
                                <div class="col-md-12 mt-3"><label class="labels">Address</label><input type="text" name="address" class="form-control" placeholder="Enter address" value="${sessionScope.LOGIN_USER.getAddress()}"></div>
                                <div class="col-md-12 mt-3"><label class="labels">City</label><input type="text" name="city" class="form-control" placeholder="Enter city" value="${sessionScope.LOGIN_USER.getCity()}"></div>                        
                            </div>
                            <div class="mt-5 text-center">
                                <button type="submit" name="action" value="updateprofile">Update profile</button>
                                  
                                <p>${requestScope.ERROR_MESSAGE}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
        </form>
        <footer>
            <%@include file="footer.jsp" %> 
        </footer>
        <script src="js/test.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
                crossorigin="anonymous">
        </script>
    </body>
</html>
