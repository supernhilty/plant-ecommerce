<%-- 
    Document   : orderdetail
    Created on : Mar 19, 2023, 3:24:29 PM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order detail</title>
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <style>
            h2 {
                font-size: 2rem;
                margin-top: 3rem;
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
        <form action="">
            <div class="container mt-3 mb-5">

                <c:if  test="${requestScope.orderdetail!=null}">
                    <c:if test="${not empty requestScope.orderdetail}">
                        <c:forEach var="item" items="${requestScope.orderdetail}">
                            
                                <div class="d-flex justify-content-between align-items-center flex-wrap" style="border-bottom: 1px solid rgb(70, 70, 70);">
                                    <img class="thumbnail" style="height: 120px; width: 120px;" src="${item.getProduct().getImgPath()}" alt="${item.getProduct().getName()}">
                                    <h5 class="m-5">${item.getProduct().getName()}</h5>

                                    <span>${item.getOrderQuantity()}</span>
                                    <span> Total ${item.getProductOrderPrice()} VND</span>

                            


                        </div>           
                    </c:forEach>
                </c:if>
            </c:if>
        

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

