<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JobPortal</title>


<!-- linking css file -->
<%@include file="all_component/all_css.jsp"%>

<!-- stylesheet -->
<style type="text/css">
.back-img {
	background: url("img/main.jpg");
	width: 100%;
	height: 80.6vh;
	background-repeat: no-repeat;
	background-position: 100% 80%;
	background-size: cover;
}
</style>
</head>
<body>


	<!-- adding navbar -->
	<%@include file="all_component/navbar.jsp"%>

	<!-- website name -->
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="px-4 text-dark">ONLINE JOB PORTAL</h1>


		</div>
	</div>

	<!-- footer -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>