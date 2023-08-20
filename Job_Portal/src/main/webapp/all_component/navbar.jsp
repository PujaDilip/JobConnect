<%@ page language="java" pageEncoding="UTF-8"%>

<!-- jstl link -->
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>


<html>
<head>
<style>
.navbar-bg-color {
	background: #283593;
}

.text-color {
	color: #ffffff
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-bg-color shadow sticky-top">
		<div class="collapse navbar-collapse justify-content-between  px-4"
			id="navbarSupportedContent">
			<ul class="navbar-nav align-items-center py-2">

				<li style="font-weight: 700"><a
					class="text-decoration-none text-color fs-5 me-3" href="index.jsp">
						<!-- Home --> JOB CONNECT

				</a></li>

				<!-- checking  for admin -->

				<%-- <c:if test="${userobj.role eq 'admin' }">
					<!-- <li class="nav-item"><a class="nav-link" href="add_job.jsp"><i
							class="fa-solid fa-plus"></i>View Users</a></li> -->
					 <li class="nav-item"><a class="nav-link" href="view_job.jsp"><i
							class="fa-solid fa-eye"></i>View Users</a></li>




				</c:if> --%>




				<%-- <c:if test="${userobj.role eq 'admin' }">
					<li><a class="text-decoration-none me-1 text-color"
						href="recruiter.jsp" style="font-variant: 500; font-size: 16px">RECRUITER</a></li>
					<li><a class="text-decoration-none me-1 text-color"
						href="user.jsp" style="font-variant: 500; font-size: 16px">USERS</a></li>
				</c:if> --%>
			</ul>


			<form
				class="d-flex aling-items-center justify-content-between my-2 my-lg-0">

				<!-- admin n logout for admin -->
				<c:if test="${userobj.role eq 'admin' }">

					<a href="#" class="text-decoration-none me-1 text-color"
						data-bs-toggle="modal" data-bs-target="#exampleModalAdmin"
						style="font-variant: 500; font-size: 16px"> ADMIN </a>

					<a href="logout" class="text-decoration-none ms-1 text-color"
						style="font-variant: 500; font-size: 16px">LOGOUT </a>
				</c:if>


				<!-- recruite name n logout for recruiter -->
				<c:if test="${userobj.role eq 'Recruiter' }">

					<a href="#" class="text-decoration-none me-1 text-color"
						data-bs-toggle="modal" data-bs-target="#exampleModalRecruiter"
						style="font-variant: 500; font-size: 16px"> <c:out
							value="${userobj.recruiter_name}" /></
					</a>

					<a href="logout" class="text-decoration-none ms-1 text-color"
						style="font-variant: 500; font-size: 16px">LOGOUT </a>
				</c:if>

				<!-- user name and logout for user -->
				<c:if test="${userobj.role eq 'user' }">

					<div class="dropdown-center">
						<a href="#" class="text-decoration-none me-1 text-color"
							style="font-variant: 500; font-size: 16px"
							data-bs-toggle="dropdown" aria-expanded="false"> <c:out
								value="${userobj.fname}" /></a> <input type="text"
							placeholder="Enter id" required="required"
							class="form-control d-none" id="exampleInputEmail1"
							aria-describedby="emailhelp" name="user_id"
							value="<c:out value="${userobj.id}" />">
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
								data-bs-target="#exampleModalUser">View Profile</a></li>
							<!-- <li><a class="dropdown-item" href="edit_profile.jsp">Edit
									Profile</a></li> -->
							<!-- <li><a class="dropdown-item" href="#">Change Password</a></li> -->
							<li><a class="dropdown-item" href="applied_jobs.jsp?user_id=<c:out value="${userobj.id}" />">Applied
									Jobs</a></li>
						</ul>
					</div>


					<a href="logout" class="text-decoration-none ms-1 text-color"
						style="font-variant: 500; font-size: 16px">LOGOUT </a>
				</c:if>

				<!-- no login -->
				<c:if test="${ empty userobj }">

					<a href="login.jsp" class="text-decoration-none mr-1 text-color"
						style="font-variant: 500; font-size: 16px"> LOGIN </a>
				</c:if>

			</form>
		</div>
	</nav>


	<!-- User Details -->
	<c:if test="${userobj.role eq 'user' }">
		<div class="modal fade" id="exampleModalUser" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content shadow">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">My Profile</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="card">
							<div class="card-body">
								<div class="text-center text-primary">
									<i class="fas fa-user-circle fa-3x"></i>
								</div>
								<table class="table">
									<tbody>

										<tr>
											<th style="font-size: 16px; font-weight: 700" scope="row">Name</th>
											<th style="font-size: 16px; font-weight: 400"><c:out
													value="${userobj.fname}" /></th>
										</tr>
										<tr>
											<th style="font-size: 16px; font-weight: 700" scope="row">Phone
												Number</th>
											<th style="font-size: 16px; font-weight: 400"><c:out
													value="${userobj.phno}" /></th>
										</tr>
										<tr>
											<th style="font-size: 16px; font-weight: 700" scope="row">Email</th>
											<th style="font-size: 16px; font-weight: 400"><c:out
													value="${userobj.email}" /></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<!-- Recruiter Details -->
	<c:if test="${userobj.role eq 'Recruiter' }">
		<div class="modal fade" id="exampleModalRecruiter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content shadow">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">My Profile</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="card">
							<div class="card-body">
								<div class="text-center text-primary">
									<i class="fas fa-user-circle fa-3x"></i>
								</div>
								<table class="table">
									<tbody>

										<tr>
											<th style="font-size: 16px; font-weight: 700" scope="row">Recruiter
												Name</th>
											<th style="font-size: 16px; font-weight: 400"><c:out
													value="${userobj.recruiter_name}" /></th>
										</tr>
										<tr>
											<th style="font-size: 16px; font-weight: 700" scope="row">Phone
												Number</th>
											<th style="font-size: 16px; font-weight: 400"><c:out
													value="${userobj.phno}" /></th>
										</tr>
										<tr>
											<th style="font-size: 16px; font-weight: 700" scope="row">Email</th>
											<th style="font-size: 16px; font-weight: 400"><c:out
													value="${userobj.email}" /></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href="edit_recruiter.jsp?id=<c:out value="${userobj.id}" />"
							class="btn btn-primary">Edit</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>





	<!-- admin details -->
	<div class="modal fade" id="exampleModalAdmin" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content shadow">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Admin Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="text-center text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<table class="table">
								<tbody>

									<tr>
										<th scope="row" style="font-size: 16px; font-weight: 700">Name</th>
										<th style="font-size: 16px; font-weight: 400">Admin</th>
									</tr>

									<tr>
										<th scope="row" style="font-size: 16px; font-weight: 700">Email</th>
										<th style="font-size: 16px; font-weight: 400">admin@gmail.com</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script>

const onloadfncs = ()=>{
	if(window.location.pathname==="/Job_Portal/login.jsp"){
		const loginBtn = document.getElementById("login-btn")
		loginBtn.style.display = "none"
	}
}

onloadfncs()

</script>
</body>
</html>



