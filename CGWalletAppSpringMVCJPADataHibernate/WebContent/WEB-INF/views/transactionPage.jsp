<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
.error {
	color: red;
	font-weight: bold;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Print All Transactions</h1>

		<table cellpadding="6" cellspacing="2" allign="center">
			<!-- depositAmount method is called -->
			<form:form action="printAllTransactions" method="post"
				modelAttribute="transactions1">

				<tr>
					<td>Mobile Number</td>
					<td><form:input path="mobileNo" size="30" /></td>
					<td><form:errors path="mobileNo" cssClass="error" /></td>
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="login" />
					<td><input type="reset" name="submit" value="Clear Form" />
				</tr>

			</form:form>
		</table>
	</div>
	<div>
	<font color="red">
	  <c:if test = "${not empty errorPage}">${errorPage}</c:if>
	</font></div>
</body>
</html>