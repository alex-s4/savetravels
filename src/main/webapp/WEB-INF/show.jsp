<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Expense</title>
</head>
<body>
    <div class="main-container">
        <h1>Expense Details</h1>
        <a href="/expenses">Go back</a>
        
        <table>
            <tr>
                <td>Expense Name: </td>
                <td><c:out value="${expense.getExpenseName()}"></c:out></td>
            </tr>
            <tr>
                <td>Expense Description: </td>
                <td><c:out value="${expense.getDescription()}"></c:out></td>
            </tr>
            <tr>
                <td>Vendor: </td>
                <td><c:out value="${expense.getVendorName()}"></c:out></td>
            </tr>
            <tr>
                <td>Amount Spent: </td>
                <td>$<c:out value="${expense.getAmount()}"></c:out></td>
            </tr>
        </table>
    </div>
</body>
</html>