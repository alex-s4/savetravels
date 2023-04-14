<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Save Travels</title>
</head>
<body>
    <div class="main-container">

        <div class="table-container">
            <h1>Save Travels</h1>
            <table>
                <thead>
                    <tr>
                        <th>Expense</th>
                        <th>Vendor</th>
                        <th>Amount</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="oneExpense" items="${expenses}">
                        <tr>
                            <td><a href="/expenses/${oneExpense.getId()}"><c:out value="${oneExpense.getExpenseName()}"></c:out></a></td>
                            <td><c:out value="${oneExpense.getVendorName()}"></c:out></td>
                            <td>$<c:out value="${oneExpense.getAmount()}"></c:out></td>
                            <td>
                                <a href="/expenses/edit/${oneExpense.getId()}">edit</a>
                                <form action="/expenses/${oneExpense.getId()}" method="post" class="delete-btn">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="Delete">
								</form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="form-container">
            <h2>Add an expense</h2>

            <form:form action="/create" method="post" modelAttribute="expense">

                <p id="error">
                    <form:errors path="expenseName"/>
                    <form:errors path="vendorName"/>
                    <form:errors path="amount"/>
                    <form:errors path="description"/>
                </p>
                
                <div class="main-form">
                    <table>
                        <tr>
                            <td><form:label path="expenseName">Expense Name:</form:label></td>
                            <td><form:input path="expenseName"/></td>
                        </tr>
    
                        <tr>
                            <td><form:label path="vendorName">Vendor:</form:label></td>
                            <td><form:input path="vendorName"/></td>
                        </tr>
    
                        <tr>
                            <td><form:label path="amount">Amount:</form:label></td>
                            <td><form:input type="number" path="amount" min="0.01" step=".01" /></td>
                        </tr>
    
                        <tr>
                            <td><form:label path="description">Description:</form:label></td>
                            <td><form:textarea path="description" value="0.00"/></td>
                        </tr>
    
                        
                    </table>
                </div>

                <input type="submit" value="Submit">
            </form:form>

        </div>
    </div>
</body>
</html>