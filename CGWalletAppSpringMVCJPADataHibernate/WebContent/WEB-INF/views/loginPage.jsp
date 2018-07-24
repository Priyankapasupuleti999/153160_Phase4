<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Login</h1>

	
	<table cellpadding="6" cellspacing="2" allign="center">
		
			<!-- registerCustomer method is called -->
			<form:form action="findCustomer" method="post" modelAttribute="customer">

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
</body>
</html>