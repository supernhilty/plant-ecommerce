<%-- 
    Document   : shop
    Created on : Mar 14, 2023, 12:13:07 PM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Shop</title>
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <style>
            h1 {
                font-size: 4.5rem;
            }
            #filter-item {
                width: 20vw;
                height: 3rem;
                text-align: center;
                padding: 1rem;
            }
            button {
                background: rgb(0, 0, 0);
            }
        </style>
    </head>

    <body>
        <!--Navigation bar-->
        <%@include file="header.jsp" %>

        <!--Content-->


        <div class="row mt-5">
            <!--Left content-->
            <div class="col-3 offcanvas-sm offcanvas-md" style="padding-left: 5vw; padding-right: 5vw;">
                <span style="text-decoration: none; float: none; font-size: 1.25rem">Categories</span>
                <ul style="border-top: 1px solid rgb(50, 50, 50); margin-top: 1em ;">

                    <li><a class="dropdown-item p-2" href="product?action=pagingProductList">All</a></li>
                    <li><a class="dropdown-item p-2" href="product?action=pagingProductList&category=plant">Plant</a></li>
                    <li><a class="dropdown-item p-2" href="product?action=pagingProductList&category=flower">Flower</a></li>
                    <li><a class="dropdown-item p-2" href="product?action=pagingProductList&category=seed">Seed</a></li>
                </ul>
            </div>

            <!--Right content-->
            <div class="col-lg-9 col-md-9 col-sm-12">

                <!--Sidebar button-->
                <a class="d-lg-none d-md-none text-decoration-none ms-4 " data-bs-toggle="offcanvas" href="#offCanvas" role="button" aria-controls="offCanvas">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="white" class="bi bi-filter" viewBox="0 0 16 16">
                    <path d="M6 10.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                    <span style="font-size: 1.25rem; color: white;">Categories</span>
                </a> 
                <form action="product">
                    <span class="d-flex flex-sm-row gap-2 ms-4 mt-2 me-2 mb-5">
                        <input id="newsletter1" type="text" name="search" class="form-control" placeholder="What are you searching, yo?" value="${param.search}">
                        <input type="hidden" name="category" value="${param.category}"/>
                        <button class="button" style="border: none;" type="submit" name="action" value="pagingProductList"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg></button>
                    </span>
                </form>

                <div>

                    <nav aria-label="..." >
                        <ul class="pagination" >
                            <c:if test="${requestScope.NUM_PAGE>1}">
                                <c:forEach var="page" begin="1" end="${requestScope.NUM_PAGE}">
                                    <c:choose>
                                        <c:when test="${requestScope.page == pageScope.page}">
                                            <li class="page-item active"><a class="page-link " href="product?search=${param.search}&action=pagingProductList&page=${pageScope.page}&category=${param.category}">${pageScope.page}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="product?search=${param.search}&action=pagingProductList&page=${pageScope.page}&category=${param.category}">${pageScope.page}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </c:if>



                        </ul>
                    </nav>
                    <c:set var="sort" value="Sort by"/>
                    <a class="dropdown-toggle" href="" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" >
                        ${pageScope.sort}
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="product?action=pagingProductList&category=${param.category}&search=${param.search}&colSort=adddate&sortType=asc">Newest</a></li>
                        <li><a class="dropdown-item" href="product?action=pagingProductList&category=${param.category}&search=${param.search}&sortType=asc&colSort=price">Low to high price</a></li>
                        <li><a class="dropdown-item" href="product?action=pagingProductList&category=${param.category}&search=${param.search}&sortType=desc&colSort=price">High to low price</a></li>

                    </ul>



                </div>
                <div class="container gap-4 d-flex flex-wrap justify-content-center">
                    <c:if test="${requestScope.PAGING_LIST!=null}">
                        <c:if test="${not empty requestScope.PAGING_LIST}">
                            <c:forEach var="product" items="${requestScope.PAGING_LIST}">
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

                        </c:if>
                    </c:if>
                </div>




                <!--Sidebar pop-out-->
                <div class="offcanvas offcanvas-start" tabindex="-1" id="offCanvas" aria-labelledby="offCanvasLabel" style="background-color: black;">
                    <div class="offcanvas-header justify-content-end">
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="white" class="bi bi-x-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                            </svg>
                        </button>
                    </div>
                    <span style="float: none; font-size: 1.25rem; color: white; margin-left: 2rem;">Categories</span>
                    <ul style="list-style: none;">
                        <li class="nav-item"><a class="dropdown-item p-2" href="product?action=pagingProductList">All</a></li>
                        <li class="nav-item"><a class="dropdown-item p-2" href="product?action=pagingProductList&category=plant">Plant</a></li>
                        <li class="nav-item"><a class="dropdown-item p-2" href="product?action=pagingProductList&category=flower">Flower</a></li>
                        <li class="nav-item"><a class="dropdown-item p-2" href="product?action=pagingProductList&category=seed">Seed</a></li>
                    </ul>
                </div>
            </div>
            <%@include file="footer.jsp" %>

            <script src="js/test.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
                    integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
                    crossorigin="anonymous">
            </script>
    </body>
</html>

