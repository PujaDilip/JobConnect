<%@ page language="java" pageEncoding="UTF-8"%>

<!-- jstl link -->
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Job</title>

<%@include file="all_component/all_css.jsp"%>

</head>

<body style="background: #ffffff;">

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
							<c:out value="${succMsg}"  />
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

	<!-- only admin can access addd_job -->
	<c:if test="${userobj.role ne 'Recruiter' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${userobj.status ne 'ACTIVE' }">
		
		<c:redirect url="home.jsp"></c:redirect>
	</c:if>


	<%@include file="all_component/navbar.jsp"%>


	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card shadow">
				<div class="card-body">
					<div class="text-center">
						<i class="fa-regular fa-user fa-xl"></i>
						<h5>ADD JOB</h5>
					</div>
					<form action="add_job" method="post">
						<div class="row my-2">
							<div class="col-6">
								<input type="hidden" name="recruiter_id"
									value="<c:out value="${userobj.id}" />">
								<div class="form-group">
									<label>Title</label> <input type="text" name="title"
										placeholder="Enter title" required="required"
										class="form-control">
								</div>
							</div>

							<div class="form-group col-6">
								<label>Company Name</label> <input type="text" name="company"
									placeholder="Enter company name" required="required"
									class="form-control">
							</div>
						</div>




						<div class="row my-2">
							<div class="form-group col-4">

								<label>Location</label> <select name="location"
									class="form-select" id="inlineFormCustomSelectPref">
									<option selected>Choose...</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujarath">Gujarath</option>
									<option value="Bhubaneshwar">Bhubaneshwar</option>
									<option value="Delhi">Delhi</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Chennai">Chennai</option>
									<option value="Hyderabad">Hyderabad</option>
								</select>
							</div>
							<div class="form-group col-4">
								<label>Category</label> <select name="category"
									class="form-select" id="inlineFormCustomselectPref">
									<option selected>Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
									<option value="Business">Business</option>

								</select>
							</div>
							<div class="form-group col-4">
								<label>Experience</label> <select name="experience"
									class="form-select" id="inlineFormCustomselectPref">
									<option selected>Choose...</option>
									<option value="Fresher">Fresher</option>
									<option value="Experienced">Experienced</option>
									<option value="Experienced">Fresher/Experienced</option>

								</select>
							</div>
						</div>
						<div class="row my-2">

							<div class="form-group col-6">
								<label>Package(LPA)</label> <input placeholder="0.0 "
									type="text" name="package" required="required"
									class="form-control">

							</div>
							<div class="form-group col-6">
								<label>Status</label> <select name="status" class="form-select">

									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>

								</select>
							</div>
						</div>


						<div class="form-group my-2">
							<label>Description</label>
							<textarea required rows="4" cols="" name="desc"
								placeholder="Enter Description" class="form-control"></textarea>
						</div>
						<div class="text-end my-2">
							<button class="btn btn-primary">Publish Job</button>
							<a href="home.jsp" class="btn btn-secondary">Back</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	
	if(document.getElementById("alert")){
		setTimeout(() => {
			const closeBtn = document.getElementById("close")
			closeBtn.click()
		}, 2500);
	}
	
	</script>
</body>
</html>