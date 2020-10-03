<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

html {
	color: black;
}

h1 {
	color: #a35d6a;
	align: center;
}

h3 {
	color: #87556f;
}


.center {
	align: center;
}

input {
	border-radius: 5px;
}


#container {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

tr {
	height: 35px;
}

.a {
	border: none;
	float: left;
	outline: none;
	color:#d4a162;
	background-color: black;
	padding-left: 10px;
}



</style>
</head>
<body bgcolor=white>
	
	<br>
	<br>
	<hr width=500 color=#69491A>
	<h1 align=center><img src="../reservation/resv/roomlogo10.png" style="width: 55px">  K- Hotel Log-in </h1>
	<hr width=500 color=#69491A>

	<div class="container">
		<div class="center">
			<div align=center>
			<br>
			<br>
			<h3 >Log-in for Administrator</h3>
				<form method="post" action="loginck.jsp">
					<hr width=300 color=#d9adad>
					<div>
					<br>
					</div>
					<input type="text" name="id" placeholder="id" style="border: 1px dotted #d3c09a; padding-left: 10px;"/>
					<div>
					<br>
					</div>
					<input type="password" name="passwd" placeholder="password" style="border: 1px dotted #d3c09a; padding-left: 10px;"/>
					<div>
					<br>
					</div>
					<input id=button type="submit" value="LOG IN" size="50" style="background-color: #fbecec">
					<div>
					<br>
					</div>
					<hr width=300 color=#d9adad>
				</form>
			</div>
		</div>
	</div>
</body>
</html>