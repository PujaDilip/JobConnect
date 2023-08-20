<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
</style>
</head>
<body>

	<c:if test="${userobj.role ne 'admin' }">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-4">
				<div class="d-flex align-items-center justify-content-around h-100">
					<div>
						<a class="text-decoration-none text-dark" href="recruiter.jsp"
							style="font-size: 16px; font-weight: 700">
							<div
								class="d-flex align-items-center justify-content-center flex-column">
								<img src="img/employee.png"> <span class="w-100">RECRUITER</span>
							</div>
						</a>
					</div>
					<div style="font-size: 16px; font-weight: 700">
						<a class="text-decoration-none text-dark" href="user.jsp"
							style="font-size: 16px; font-weight: 700">
							<div
								class="d-flex align-items-center justify-content-center flex-column">
								<img src="img/profile.png"><span class="w-100 ms-4">USER</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="col-8 d-flex align-items-center justify-content-center">
				<img src="img/admin.jpg" width="80%" height="70%" />
			</div>
		</div>

	</div>
</body>
</html>