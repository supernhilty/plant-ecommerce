<%-- 
    Document   : buy
    Created on : Mar 17, 2023, 10:03:48 PM
    Author     : leyen
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pay</title>
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <!-- FontAwesome CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <style>

            .btn-pay {
                background-color: #C800Da;
                border: 0;
                color: #fff;
                font-weight: 600;
            }

            .fa-ticket {
                color: #0e1fa1;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <form action="cart">





            <div class="container mt-5 mb-5">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-7">
                        <div class="border border-gainsboro p-3">
                            <c:set var="totalCount" value="0"></c:set>
                            <c:set var="totalPay" value="0"></c:set>
                            <c:if test="${sessionScope.cartlist!=null&& not empty sessionScope.cartlist}">
                                <c:forEach var="item" items="${sessionScope.cartlist}">
                                    <c:set var="totalCount" value="${totalCount}+${item.getQuantity()}"></c:set>
                                    <c:set var="totalPay" value="${item.getQuantity()}*${item.getProduct().getPrice()}"></c:set>
                                </c:forEach>
                            </c:if>
                            <h2 class="h6 text-uppercase mb-0">Cart Total (${totalCount} Items): <strong class="cart-total">${totalPay}</strong></h2>
                        </div>

                        <div class="border border-gainsboro p-3 mt-3 clearfix item">
                            <div class="text-lg-left">
                                <i class="fa fa-ticket fa-2x text-center" aria-hidden="true"></i>
                            </div>
                            <div class="col-lg-5 col-5 text-lg-left">
                                <h3 class="h6 mb-0">${item.getProduct().getName()}<br>
                                    <small>${item.getProduct().getPrice()} VND</small>
                                </h3>
                            </div>
                            <div class="product-price d-none">50</div>
                            <div class="pass-quantity col-lg-3 col-md-4 col-sm-3">
                                <label for="pass-quantity" class="pass-quantity">Quantity</label>
                                <input class="form-control" type="number" value="1" min="1">
                            </div>
                            <div class="col-lg-2 col-md-1 col-sm-2 product-line-price pt-4">
                                <span class="product-line-price">50
                                </span>
                            </div>

                        </div>


                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-5 totals">
                        <div class="border border-gainsboro px-3">
                            <div class="border-bottom border-gainsboro">
                                <p class="text-uppercase mb-0 py-3"><strong>Order Summary</strong></p>
                            </div>
                            <div class="totals-item d-flex align-items-center justify-content-between mt-3">
                                <p class="text-uppercase">Subtotal</p>
                                <p class="totals-value" id="cart-subtotal">95</p>
                            </div>
                            <div class="totals-item d-flex align-items-center justify-content-between">
                                <p class="text-uppercase">Estimated Tax</p>
                                <p class="totals-value" id="cart-tax">3.60</p>
                            </div>
                            <div class="totals-item totals-item-total d-flex align-items-center justify-content-between mt-3 pt-3 border-top border-gainsboro">
                                <p class="text-uppercase"><strong>Total</strong></p>
                                <p class="totals-value font-weight-bold cart-total">98.60</p>
                            </div>
                        </div>
                        <a href="#" class="mt-3 btn btn-pay w-100 d-flex justify-content-between btn-lg rounded-0">Pay Now <span class="totals-value cart-total">98.60</span></a>
                    </div>
                </div>
            </div><!-- container -->
        </form>
        <footer>
            <%@include file="footer.jsp" %> 
        </footer>
        <script src="js/test.js"></script>
        <script src="js/cartjs.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
                crossorigin="anonymous">
        </script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    </body>
</html>
