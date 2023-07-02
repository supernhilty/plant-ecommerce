<%-- 
    Document   : userhome
    Created on : Mar 4, 2023, 7:59:22 AM
    Author     : leyen
--%>

<%@page import="java.util.List"%>
<%@page import="planthouse.dto.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Plant House</title>

        <link rel="stylesheet" href="css/stylesheet.css">
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <style>
            h2 {
                font-size: 2rem;
                margin-top: 3rem;
                text-align: center;
            }
            .button {
                width: 150px;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>

        </header>
        <jsp:include page="product"></jsp:include>
            <form  action="user">

                <div class="container-fluid">
                    <!--                    <img src="images/bannerProfile.png" style="width: 100%; height: 500px; overflow: hidden">-->

                    <div>
                    <c:if test="${requestScope.bestSellerList!=null}">
                        <c:if test="${not empty requestScope.bestSellerList}">
                            <h2>Best sellers</h2>
                            <div class="container gap-4 d-flex flex-wrap justify-content-center">

                                <c:forEach var="product" items="${requestScope.bestSellerList}">
                                    <span class="card product">
                                        <img class="thumbnail" src="${product.getImgPath()}" class="card-img-top" alt="${product.getCategory()}">
                                        <div class="card-body">
                                            <h5 class="card-title">${product.getName()}</h5>
                                            <span>${product.getPrice()}</span><span> VND</span>
                                            <div class="mt-2">
                                                <a href="product?action=productdetail&id=${product.getId()}" class="btn btn-dark">View detail</a>
                                            </div>
                                        </div>
                                    </span>

                                </c:forEach>

                            </div>

                        </c:if>
                    </c:if>
                    <c:if test="${requestScope.newItemList!=null}">
                        <c:if test="${not empty requestScope.newItemList}">
                            <h2>New Items</h2>
                            <div class="container gap-4 d-flex flex-wrap justify-content-center">

                                <c:forEach var="product" items="${requestScope.newItemList}">
                                    <span class="card product">
                                        <img class="thumbnail" src="${product.getImgPath()}" class="card-img-top" alt="${product.getCategory()}">
                                        <div class="card-body">
                                            <h5 class="card-title">${product.getName()}</h5>
                                            <span>${product.getPrice()}</span><span> VND</span>
                                            <div class="mt-2">
                                                <a href="product?action=productdetail&id=${product.getId()}" class="btn btn-dark">View detail</a>
                                            </div>
                                        </div>
                                    </span>

                                </c:forEach>


                            </div>
                        </c:if>
                    </c:if>

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
