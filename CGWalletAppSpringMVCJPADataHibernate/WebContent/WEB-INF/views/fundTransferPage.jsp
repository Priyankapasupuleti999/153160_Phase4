<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<h1>Fund Transfer</h1>

		<table cellpadding="6" cellspacing="2" allign="center">
			<!-- depositAmount method is called -->
			<form action="fundTsf" method="post">

				<tr>
					<td>Source Mobile Number</td>
					<td><input type="text" name="sourceMobile" size="30" /></td>
					</tr>

				<tr>
					<td>Target Mobile Number</td>
					<td><input type="text" name="targetMobile" size="30" /></td>
				</tr>
				<tr>
					<td>Amount</td>
					<td><input type="text" name="wallet.balance" size="30" /></td>
					
				</tr>

				<tr>
					<td><input type="submit" name="submit" value="transfer" />
					<td><input type="reset" name="submit" value="Clear Form" />
				</tr>
				</form>
		</table>
	</div>
	<div>
	<font color="red">
	  <c:if test = "${not empty errorPage}">${errorPage}</c:if>
	</font></div>
</body>
</html>