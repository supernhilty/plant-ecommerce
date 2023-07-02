<%-- 
    Document   : cart
    Created on : Mar 6, 2023, 12:34:40 AM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart</title>
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
        <form action="cart">
            <div class="container mt-3 mb-5">
                <h1 class="m-5"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-cart4 me-4" viewBox="0 0 16 16">
                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                    </svg>Cart</h1>
                <p>${requestScope.buymessage}</p>
                <c:if test="${sessionScope.cartlist==null || empty sessionScope.cartlist}">
                    <h2>Have no product in your cart!</h2>
                    <a href="product?action=pagingProductList">Continue to shopping</a>
                </c:if>
                <c:if  test="${sessionScope.cartlist!=null}">
                    <c:if test="${not empty sessionScope.cartlist}">
                        <c:forEach var="item" items="${sessionScope.cartlist}">
                            <form action="cart">
                                <div class="d-flex justify-content-between align-items-center flex-wrap" style="border-bottom: 1px solid rgb(70, 70, 70);">
                                    <img class="thumbnail" style="height: 120px; width: 120px;" src="${item.getProduct().getImgPath()}" alt="${item.getProduct().getName()}">
                                    <h5 class="m-5">${item.getProduct().getName()}</h5>
                                    <span>${item.getProduct().getPrice()} VND</span>
                                    <span>Quantity: ${item.getQuantity()}</span>
                                    <div class="button-wrapper" style="width: 10em;">
                                        <span><input type="number" name="quantity" min="1" max="${item.getProduct().getQuantity()}" value="${item.getQuantity()}"/></span>
                                    </div>
                                    <div>
                                        <input type="hidden" name="id" value="${item.getProduct().getId()}">
                                        <input type="submit" name="action" value="update"/>
                                    </div>

                                    <div><a href="cart?action=removeitem&id=${item.getProduct().getId()}" class="btn btn-danger">Remove</a></div>
                            </form>


                        </div>           
                    </c:forEach>
                </c:if>
            </c:if>
        </div>

        <div class=" container">
            
            <div class="totals-item d-flex align-items-center justify-content-between" >
                <p class="text-uppercase">Total number</p>
                <p class="totals-value" id="cart-tax">${sessionScope.totalquantity}</p>
            </div>
            <div class="totals-item totals-item-total d-flex align-items-center justify-content-between mt-3 pt-3 border-top border-gainsboro">
                <p class="text-uppercase"><strong>Total pay</strong></p>
                <p class="totals-value font-weight-bold cart-total">${sessionScope.totalprice}</p>
            </div>
            <form action="order">
                
                <button class="button mt-5" type="submit" name="action" value="buy"> Buy </button>
                
            </form>
             
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
