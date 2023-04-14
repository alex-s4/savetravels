<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Expense</title>
</head>
<body>
    <div class="main-container">
        <h1>Edit Expense</h1>
        <a href="/expenses">Go back</a>

        <form:form action="/expenses/${expense.id}" method="post" modelAttribute="expense">
            <input type="hidden" name="_method" value="put">
            
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

            <input type="submit" value="Submit"/>
        </form:form>
        

    </div>
</body>
</html>