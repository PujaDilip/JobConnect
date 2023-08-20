<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit profile page</title>

<!-- linking css file -->
<%@include file="all_component/all_css.jsp"%>

</head>

<body style="background: #ffffff;">

	<!-- checking if logged in -->
	<%-- <c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if> --%>

	<!-- adding navbar -->
	<%@include file="all_component/navbar.jsp"%>


	<div class="container-fluid">
		<div class="d-flex align-items-center justify-content-center">
			<div class="col-md-6 pt-3">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Edit Profile</h5>
						</div>



						<form action="update_user_profile" method="post">
							<div class="row my-2">
								<input type="hidden" name="id"
									value="<c:out value="${userobj.id}" />">
								<div class="form-group col-6">
									<label>Name</label> <input type="text" placeholder="Enter name"
										required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailhelp"
										name="fname" value="<c:out value="${userobj.fname}" />">

								</div>
								<div class="form-group col-6">
									<label>Email</label> <input type="text"
										placeholder="Enter email" required="required"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailhelp" name="email"
										value="<c:out value="${userobj.email}"/>">
								</div>
							</div>
							<div class="row my-2">
								<div class="form-group col-6">
									<label>Password</label> <input placeholder="Enter password"
										type="text" required="required" class="form-control"
										id="exampleInputPassword1" name="password"
										value="<c:out value="${userobj.password}" />">
								</div>
								<div class="form-group col-6">
									<label>Mobile Number</label> <input
										placeholder="Enter Mobile no." type="text" required="required"
										class="form-control" id="exampleInputPassword1" name="phno"
										value="<c:out value="${userobj.phno}" />">
								</div>
							</div>
							<div class="row my-2">
								<div class="form-group col-6">
									<label>Skill</label> <input type="text"
										placeholder="Enter skill" required="required"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailhelp" name="skill"
										value="<c:out value="${userobj.skill}"/>">

								</div>
								<div class="form-group col-6">
									<label>Experience</label> <input type="text"
										placeholder="Enter Experience" required="required"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailhelp" name="experience"
										value="<c:out value="${userobj.experience}"/>">
								</div>
							</div>

							<div class="text-end">
								<button class="btn btn-primary">Update Profile</button>
								<a href="home.jsp" class="btn btn-secondary">Back</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 100px;">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>