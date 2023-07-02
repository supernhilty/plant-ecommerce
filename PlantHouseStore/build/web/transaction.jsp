<%-- 
    Document   : transaction
    Created on : Mar 19, 2023, 2:58:11 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Transaction</title>
    </head>
    <body>
        <c:set var="count" value="1"/>
        <c:if test="${requestScope.listorder!=null}">
            <c:if test="${not empty requestScope.listorder}">
                <c:forEach var="o" items="${requestScope.listorder}">
                    <p>no: ${pageScope.count}</p>
                    <p>order date: ${o.getOrderDate()}</p>
                    <p>ship date:${o.getShipDate()} </p>
                    <p>total: ${o.getTotal()}</p>

                    <p><a href="order?action=detailorder&orderid=${o.getOrderId()}">View detail</a></p>
                    <c:set var="count" value="${pageScope.count+1}"/>

                </c:forEach>
            </c:if>
        </c:if>
    </body>
</html>
