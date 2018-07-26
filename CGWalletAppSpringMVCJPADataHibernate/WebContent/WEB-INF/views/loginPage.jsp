<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.error {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>Login</h1>
	<form action="findCustomer" method="post" name="customerFrm">
	 <table cellpadding="6" cellspacing="2" allign="center">
		
		<tr>
			<td>Mobile Number</td>
			<td><input type="text" name="mobileNo" /></td>
		</tr>

		<tr>
			<td><input type="submit" name="submit" value="login" /></td>
			<td><input type="reset" name="submit" value="Clear Form" /></td>
		</tr>
		
	</table>
	</form>
	
	<div>
	<font color="red">
	  <c:if test = "${not empty errorPage}">${errorPage}</c:if>
	</font></div>
</body>
</html>