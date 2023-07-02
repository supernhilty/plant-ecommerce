<%-- 
    Document   : productdetail.jsp
    Created on : Mar 14, 2023, 1:23:29 PM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${requestScope.productdetail.getName()}</title>
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&family=Rubik:wght@300&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <style>
            h2 {
                font-size: 4rem;
                margin-top: 3rem;
            }
            .button {
                width: 150px;
            }
        </style>
    </head>

    <body>
        <!--Navigation bar-->
        <%@include file="header.jsp" %>
        <!--Content-->
        <form action="cart">
            <div class="row" style="margin-top: 2rem;">
                <!--Left content-->
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="d-flex justify-content-center">
                        <img style="width: 100vw; height: 40vw;  object-fit: cover; object-position: 25% 75%" 
                             src="${requestScope.productdetail.getImgPath()}" alt="productPreview">
                    </div>
                </div>

                <!--Right content-->
                <div class="col-lg-6 col-md-6 col-sm-12 mt-3" style="padding: 0 5rem 0 5rem;">

                    <h2>${requestScope.productdetail.getName()}</h2>
                    <p>
                        ${requestScope.productdetail.getDescribe()}
                    </p>
                    <span id="price"> ${requestScope.productdetail.getPrice()}</span><span id="currency"> VND</span>
                    <c:set var="quantity" value="1"/>
                    <div>

                        <span><input type="number" name="quantity" min="1" max="${requestScope.productdetail.getQuantity()}" value="${pageScope.quantity}"/></span>


                    </div>
                    <div><p style="font-size: smaller">${requestScope.productdetail.getQuantity()} available</p></div>

                    <input type="hidden" name="id" value="${requestScope.productdetail.getId()}"/>

                    <div style="margin-top: 2rem;">
                        <button class="button me-2 mb-3" type="submit" name="action" value="addtocart">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart4 me-2" viewBox="0 0 16 16">
                            <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                            </svg>Add to cart</button>
                        
                    </div>
                    <p style="font-size: smaller">${requestScope.addmessage}</p>

                </div>
            </div>
        </form>


        <!--Footer-->
        <%@include file="footer.jsp" %>

        <script src="js/test.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
                crossorigin="anonymous">
        </script>
    </body>
</html>
