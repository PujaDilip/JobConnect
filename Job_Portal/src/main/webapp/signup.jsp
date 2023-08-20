<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<style>
body {
	height: 100vh;
	width: 100vw;
	overflow-x: hidden;
}

.cursor-pointer {
	cursor: pointer
}
</style>
<body>

	<%-- <div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Sign Up</h5>
						</div>


<!-- msg showing -->						
						
						<c:if test="${not empty succMsg}">
						 <c:if test="${msgStatus eq 'fail'}">
							<div id="alert" class="alert alert-danger alert-dismissible" role="alert">
								<c:out value="${succMsg}" />
								<button id="close" type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<c:remove var="succMsg" />
							</c:if>
							<c:if test="${msgStatus eq 'success'}">
							<div  id="alert" class="alert alert-success alert-dismissible" role="alert">
								<c:out value="${succMsg}" />
								<button id="close" type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<c:remove var="succMsg" />
							</c:if>
						</c:if>
						
						
						<form action="add_user" method="post">
							<div class="form-group">
								<label>Enter full name</label> <input type="text"
									required="required" class="form-control" name="name">
							</div>
							<div class="form-group">
								<label>Enter qualification</label> <input type="text"
									required="required" class="form-control" name="qua">
							</div>
							<div class="form-group">
								<label>Enter email</label> <input type="email"
									required="required" class="form-control" name="email">
							</div>
							<div class="form-group">
								<label>Enter password</label> <input type="password"
									required="required" class="form-control" name="ps">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">SignUp</button>
								<span class="psw">
								 <a href="login.jsp">Already have   an account?</a></span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div> --%>


	<!-- Toaster starts from here -->
	<c:if test="${not empty succMsg}">
		<c:if test="${msgStatus eq 'fail'}">
			<div id="alert" aria-live="polite" aria-atomic="true"
				class="position-relative">
				<div class="toast-container top-0 end-0 p-3">
					<div class="toast fade show bg-danger text-white" role="alert"
						aria-live="assertive" aria-atomic="true">

						<div
							class="toast-body d-flex align-items-center justify-content-between">
							<c:out value="${succMsg}" />
							<button type="button" class="btn-close" id="close"
								data-bs-dismiss="toast" aria-label="Close"></button>
						</div>
					</div>
				</div>
			</div>
			<c:remove var="succMsg" />
		</c:if>

		<c:if test="${msgStatus eq 'success'}">
			<div id="alert" aria-live="polite" aria-atomic="true"
				class="position-relative">
				<div class="toast-container top-0 end-0 p-3">
					<div class="toast fade show bg-success text-white" role="alert"
						aria-live="assertive" aria-atomic="true">
						<div
							class="toast-body d-flex align-items-center justify-content-between">
							<c:out value="${succMsg}" />
							<button type="button" class="btn-close" id="close"
								data-bs-dismiss="toast" aria-label="Close"></button>
						</div>
					</div>
				</div>
			</div>
			<c:remove var="succMsg" />
		</c:if>
	</c:if>
	<!-- Toaster ends here  -->



	<div class="row h-100">
		<div
			class="col-6 d-flex align-items-center justify-content-center h-100">
			<img src="img/sign-up.jpg" width="80%" height="75%" />
		</div>
		<div
			class="col-6 d-flex align-items-center justify-content-center h-100">
			<div class="w-75">
				<ul class="nav nav-pills justify-content-center">
					<li class="nav-item cursor-pointer" id="user-link"
						onclick="handleUserLinkClick()"><a class="nav-link"
						aria-current="page" id='user-nav-link'>USER</a></li>
					<li class="nav-item cursor-pointer" id="recruiter-link"
						onclick="handleRecruiterLinkClick()"><a class="nav-link"
						id="recruiter-nav-link">RECRUITER</a></li>
				</ul>

				<div id="user-form" style="display: none">
					<form action="add_user" method="post">
						<div class="form-group my-2">
							<label>Full Name</label> <input type="text"
								placeholder="Enter full name" required="required"
								class="form-control" name="fname">
						</div>
						<div class="form-group my-2">
							<label>Email</label> <input type="email"
								placeholder="Enter email" required="required"
								class="form-control" name="email">
						</div>
						<div class="form-group my-2">
							<label>Mobile</label> <input type="text"
								placeholder="Enter mobile" required="required"
								class="form-control" name="phno">
						</div>
						<div class="form-group my-2">
							<label>Skill</label> <input type="text" placeholder="Enter skill"
								required="required" class="form-control" name="skill">
						</div>
						<div class="form-group my-2">
							<label>Experience</label> <input type="text"
								placeholder="Enter experience" required="required"
								class="form-control" name="experience">
						</div>
						<div class="form-group my-2">
							<label>Password</label> <input type="password"
								placeholder="Enter password" required="required"
								class="form-control" name="password">
						</div>
						<div
							class="my-2 d-flex align-items-center justify-content-between">
							<span> <a href="login.jsp">Already have an account?</a>
							</span>
							<button type="submit" class="btn btn-primary py-2 px-5">SignUp</button>
						</div>
					</form>
				</div>

				<div id="recruiter-form" style="display: none">
					<form action="add_recruiter" method="post">
						<div class="form-group my-2">
							<label>Company Name</label> <input type="text"
								placeholder="Enter company name" required="required"
								class="form-control" name="company_name">
						</div>
						<div class="form-group my-2">
							<label>Recruiter Name</label> <input type="text"
								placeholder="Enter recruiter name" required="required"
								class="form-control" name="recruiter_name">
						</div>
						<div class="form-group my-2">
							<label>Location</label> <input type="text"
								placeholder="Enter mobile" required="required"
								class="form-control" name="location">
						</div>
						<div class="form-group my-2">
							<label>Mobile</label> <input type="text"
								placeholder="Enter mobile" required="required"
								class="form-control" name="phno">
						</div>
						<div class="form-group my-2">
							<label>Email</label> <input type="email"
								placeholder="Enter email" required="required"
								class="form-control" name="email">
						</div>
						<div class="form-group my-2">
							<label>Password</label> <input type="password"
								placeholder="Enter password" required="required"
								class="form-control" name="password">
						</div>
						<div
							class="my-2 d-flex align-items-center justify-content-between">
							<span> <a href="login.jsp">Already have an account?</a>
							</span>
							<button type="submit" class="btn btn-primary py-2 px-5">SignUp</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	/* Toaster close function starts from here */
	if(document.getElementById("alert")){
		setTimeout(() => {
			const closeBtn = document.getElementById("close")
			closeBtn.click()
		}, 2500);
	}
	/* Toasster close function end here	 */
	
	const onloadfns = ()=>{
		const userNavLink = document.getElementById("user-nav-link");
		userNavLink.classList.add("active")
		const userForm = document.getElementById("user-form");
		userForm.style.display = "block"
	}
	onloadfns();
	
	
	const handleUserLinkClick = ()=>{
		const userForm = document.getElementById("user-form");
		userForm.style.display = "block"
		
		const recruiterForm = document.getElementById("recruiter-form");
		recruiterForm.style.display = "none"
		
		const userNavLink = document.getElementById("user-nav-link");
		userNavLink.classList.add("active")
		
		const recruiterNavLink = document.getElementById("recruiter-nav-link");
		recruiterNavLink.classList.remove("active")
	}
	
	const handleRecruiterLinkClick = ()=>{
		const userForm = document.getElementById("user-form");
		userForm.style.display = "none"
		
		const recruiterForm = document.getElementById("recruiter-form");
		recruiterForm.style.display = "block"
		
		const recruiterNavLink = document.getElementById("recruiter-nav-link");
		recruiterNavLink.classList.add("active")
		
		const userNavLink = document.getElementById("user-nav-link");
		userNavLink.classList.remove("active")
	}
	
	</script>
</body>
</html>