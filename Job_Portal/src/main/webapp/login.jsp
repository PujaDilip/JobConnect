<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- linking css file -->
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



	<%-- <div class="container-fluid pt-5">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login</h5>
						</div>

						<!-- msg showing -->

						<c:if test="${not empty succMsg}">
							<c:if test="${msgStatus eq 'fail'}">
								<div class="alert alert-danger alert-dismissible" role="alert">
									<c:out value="${succMsg}" />
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<c:remove var="succMsg" />
							</c:if>
							<c:if test="${msgStatus eq 'success'}">
								<div id="alert" class="alert alert-success alert-dismissible"
									role="alert">
									<c:out value="${succMsg}" />
									<button id="close" type="button" class="close"
										data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<c:remove var="succMsg" />
							</c:if>
						</c:if>

						<form action="Login" method="post">
							<div class="form-group">

								<input type="email" placeholder="Enter email"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">
							</div>
							<div class="input-group mb-3">

								<input placeholder="Enter password" required="required"
									type="password" class="form-control" id="password"
									name="password" style="border-right: none">
								<div class="input-group-prepend">
									<div class="input-group-text"
										style="border-left: none; background: transparent;">
										<i id="eye" class="fa-regular fa-eye" style="cursor: pointer"
											onclick="handleEyeClick()"></i> <i id="eye-close"
											class="fa-regular fa-eye-slash" style="cursor: pointer"
											onclick="handleEyeCloseClick()"></i>
									</div>
								</div>
							</div>
							<a></a>
							<button type="submit"
								class="btn btn-primary badge-pill  btn-block">Login</button>
							<span class="psw"> <a href="signup.jsp">Don't have an
									account?</a></span>
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
			<div class="w-75">
				<h3 class="text-center mb-3">SIGN IN</h3>
				<ul class="nav nav-pills justify-content-center">
					<li class="nav-item cursor-pointer" id="user-link"
						onclick="handleUserLinkClick()"><a class="nav-link"
						aria-current="page" id='user-nav-link'>USER</a></li>
					<li class="nav-item cursor-pointer" id="recruiter-link"
						onclick="handleRecruiterLinkClick()"><a class="nav-link"
						id="recruiter-nav-link">RECRUITER</a></li>
				</ul>

				<div id="user-form" style="display: none">
					<form action="user_login" method="post">
						<div class="form-group my-2">
							<label>Email</label> <input type="email"
								placeholder="Enter email" required="required"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email">
						</div>
						<div class="my-2">
							<label>Password</label>
							<div class="input-group">
								<input placeholder="Enter password" required="required"
									type="password" class="form-control" id="password"
									name="password" style="border-right: none">
								<div class="input-group-prepend">
									<div class="input-group-text h-100 rounded-right"
										style="border-left: none; background: transparent; border-top-left-radius: 0px; border-bottom-left-radius: 0px">
										<i id="eye" class="fa-regular fa-eye" style="cursor: pointer"
											onclick="handleEyeClick()"></i> <i id="eye-close"
											class="fa-regular fa-eye-slash" style="cursor: pointer"
											onclick="handleEyeCloseClick()"></i>
									</div>
								</div>
							</div>
						</div>
						<div
							class="my-2 d-flex align-items-center justify-content-between">
							<span> <a href="signup.jsp">Don't have an account?</a></span>
							<button type="submit" class="btn btn-primary py-2 px-5">Login</button>
						</div>
					</form>
				</div>

				<div id="recruiter-form" style="display: none">
					<form action="recruiter_login" method="post">
						<div class="form-group my-2">
							<label>Email</label> <input type="email"
								placeholder="Enter email" required="required"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email">
						</div>
						<div class="my-2">
							<label>Password</label>
							<div class="input-group">
								<input placeholder="Enter password" required="required"
									type="password" class="form-control" id="recruiter-password"
									name="password" style="border-right: none">
								<div class="input-group-prepend">
									<div class="input-group-text h-100 rounded-right"
										style="border-left: none; background: transparent; border-top-left-radius: 0px; border-bottom-left-radius: 0px">
										<i id="recruiter-eye" class="fa-regular fa-eye"
											style="cursor: pointer" onclick="handleRecruiterEyeClick()"></i>
										<i id="recruiter-eye-close" class="fa-regular fa-eye-slash"
											style="cursor: pointer"
											onclick="handleRecruiterEyeCloseClick()"></i>
									</div>
								</div>
							</div>
						</div>
						<div
							class="my-2 d-flex align-items-center justify-content-between">
							<span> <a href="signup.jsp">Don't have an account?</a></span>
							<button type="submit" class="btn btn-primary py-2 px-5">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div
			class="col-6 d-flex align-items-center justify-content-center h-100">
			<img src="img/login.jpg" width="80%" height="75%" />
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
		const eyeCloseIcon = document.getElementById("eye-close");
		eyeCloseIcon.style.display="none";
		
		const userNavLink = document.getElementById("user-nav-link");
		userNavLink.classList.add("active")
		const userForm = document.getElementById("user-form");
		userForm.style.display = "block"
		
		const recruiterEyeCloseIcon = document.getElementById("recruiter-eye-close");
		recruiterEyeCloseIcon.style.display="none";
	}
	onloadfns()
	
	const handleEyeClick = ()=>{
		const eyeIcon = document.getElementById("eye");
		const eyeCloseIcon = document.getElementById("eye-close");
		eyeIcon.style.display = "none";
		eyeCloseIcon.style.display="block";
		
		const passField = document.getElementById("password")
		passField.setAttribute('type','text')
	}
	
	const handleEyeCloseClick = ()=>{
		const eyeIcon = document.getElementById("eye");
		const eyeCloseIcon = document.getElementById("eye-close");
		eyeIcon.style.display = "block";
		eyeCloseIcon.style.display="none";
		
		const passField = document.getElementById("password")
		passField.setAttribute('type','password')
	}	
	
	const handleRecruiterEyeClick = ()=>{
		const eyeIcon = document.getElementById("recruiter-eye");
		const eyeCloseIcon = document.getElementById("recruiter-eye-close");
		eyeIcon.style.display = "none";
		eyeCloseIcon.style.display="block";
		
		const passField = document.getElementById("recruiter-password")
		passField.setAttribute('type','text')
	}
	
	const handleRecruiterEyeCloseClick = ()=>{
		const eyeIcon = document.getElementById("recruiter-eye");
		const eyeCloseIcon = document.getElementById("recruiter-eye-close");
		eyeIcon.style.display = "block";
		eyeCloseIcon.style.display="none";
		
		const passField = document.getElementById("recruiter-password")
		passField.setAttribute('type','password')
	}	
	
	const handleUserLinkClick = ()=>{
		const userForm = document.getElementById("user-form");
		userForm.style.display = "block"
		
		const recruiterForm = document.getElementById("recruiter-form");
		recruiterForm.style.display = "none"
		
		const userNavLink = document.getElementById("user-nav-link");
		userNavLink.classList.add("active")
		
		const recruiterNavLink = document.getElementById("recruiter-nav-link");
		recruiterNavLink.classList.remove("active")
		
		const eyeCloseIcon = document.getElementById("eye-close");
		eyeCloseIcon.style.display="none";
		const eyeIcon = document.getElementById("eye");
		eyeIcon.style.display="block";
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
		
		const recruiterEyeCloseIcon = document.getElementById("recruiter-eye-close");
		recruiterEyeCloseIcon.style.display="none";
		const recruiterEyeIcon = document.getElementById("recruiter-eye");
		recruiterEyeIcon.style.display="block";
		
	}
	
</script>

</body>
</html>