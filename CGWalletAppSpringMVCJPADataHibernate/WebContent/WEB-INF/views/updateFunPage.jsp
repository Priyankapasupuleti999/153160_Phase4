<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
			<table>
				<tr>
					<td>MobileNumber:</td>
					<td>${customer.mobileNo}</td>
				</tr>
				<tr>
					<td>Name:</td>
					<td>${customer.name}</td>
				</tr>
				<tr>
					<td>Balance:</td>
					<td>${customer.wallet.balance}</td>
				</tr>
			</table>
		<table>
			<tr>
				<td>Want to change mobile number</td>
				<td><a href="changemobile">ChangeMobile</a></td>
			</tr>
			<tr>
				<td>Want to change name</td>
				<td><a href="changename">ChangeName</a></td>
			</tr>
		</table>
	</div>
</body>
</html>
