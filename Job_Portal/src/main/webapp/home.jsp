<%@page import="com.dao.RecruiterDAO"%>

<%@ page import="java.util.Date"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: View Jobs</title>

<!-- linking css file -->
<%@include file="all_component/all_css.jsp"%>
</head>
<style type="text/css">
body {
	background: #ffffff;
}
</style>

<body>

	<!-- adding navbar -->
	<%@include file="all_component/navbar.jsp"%>

	<!-- checking if logged in -->
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>



	<%-- <c:if test="${userobj.role ne 'Recruiter' }">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if> --%>

	<div class="container">
		<div class="row">
			<div class="col-md-12 pt-4 pb-2">


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




				<c:if test="${userobj.role eq 'Recruiter' }">
					<c:if test="${userobj.status ne 'ACTIVE' }">

						<div id="alert" aria-live="polite" aria-atomic="true"
							class="position-relative">
							<div class="toast-container top-0 end-0 p-3">
								<div class="toast fade show bg-danger text-white" role="alert"
									aria-live="assertive" aria-atomic="true">

									<div
										class="toast-body d-flex align-items-center justify-content-between">
										<c:out value="You are not an active recruiter." />
										<button type="button" class="btn-close" id="close"
											data-bs-dismiss="toast" aria-label="Close"></button>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<div class="row">
						<div class="col-4">

							<div
								class="d-flex align-items-center justify-content-around h-100">
								<div style="font-size: 16px; font-weight: 700">
									<a href="add_job.jsp" class="text-decoration-none"
										style="color: #080202">
										<div
											class="d-flex align-items-center justify-content-center flex-column">
											<img src="img/curriculum.png" width="64px" height="64px">
											<span class="w-100"> ADD JOB</span>
										</div>
									</a>
								</div>
								<div style="font-size: 16px; font-weight: 700">
									<a class="text-decoration-none" style="color: #080202"
										href="view_jobs.jsp?id=<c:out value="${userobj.id}" />">
										<div
											class="d-flex align-items-center justify-content-center flex-column">
											<img src="img/id-card.png"> <span>VIEW JOB</span>
										</div>
									</a>
								</div>

							</div>
						</div>
						<div
							class="col-8 d-flex align-items-center justify-content-center">
							<img src="img/recruiter_img.jpg" width="80%" height="70%" />
						</div>
					</div>

				</c:if>



				<c:if test="${userobj.role eq 'user' }">

					<div class="card bgimg" style="border-radius: 20px">
						<div class="card-body">
							<form class="row" action="filtered_jobs.jsp" method="get">
								<div class="form-group col-5">
									<label>Location</label> <select name="loc" class="form-select"
										id="inlineFormCustomSelectPref">
										<option selected value="lo">Choose...</option>
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

								<div class="form-group col-5">
									<label>Category</label> <select name="cat" class="form-select"
										id="inlineFormCustomselectPref">
										<option selected value="ca">Choose...</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>

									</select>
								</div>
								<div
									class="col-2 d-flex align-items-center justify-content-center">
									<button class="btn btn-primary px-5">Submit</button>
								</div>
							</form>
						</div>
					</div>

					<%
					JobDAO dao = new JobDAO(DBConnect.getConn());
					List<Jobs> list = dao.getAllJobsForUser();

					for (Jobs j : list) {
					%>

					<div class="card my-2" style="border-radius: 20px">
						<div class="card-body">
							<div class="text-center text-primary">
								<i class="far fa-clipboard fa-2x"></i>
							</div>


							<h6><%=j.getTitle()%></h6>

							<p class="mb-0"><%=j.getCompany()%></p>


							<p>
								<%=j.getLocation()%></p>

							<div class="row mb-1">
								<%-- <div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-location-dot"></i>
									<p class="mb-0 ml-1"><%=j.getLocation()%></p>
								</div> --%>


								<div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-user-tie me-1"></i>
									<p class="mb-0 ml-1"><%=j.getCategory()%></p>
								</div>


								<div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-business-time me-1"></i>
									<p class="mb-0 ml-1"><%=j.getExperience()%></p>
								</div>


								<div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-user-tie me-1"></i>
									<p class="mb-0 ml-1"><%=j.getPkg()%>
										LPA
									</p>
								</div>
							</div>



							<div class="form-row">
								<%-- <div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-location-dot"></i>
									<p class="mb-0 ml-1"><%=j.getCategory()%></p>
								</div> --%>
								<%-- <div class="form-group col-md-3">
									<input type="text" class="form-control form-control-sm"
										value="Location : <%=j.getLocation()%>" readonly>
								</div>
								<div class="form-group col-md-3">
									<input type="text" class="form-control form-control-sm"
										value="Category : <%=j.getCategory()%>" readonly>
								</div>
							</div> --%>
								<%
								if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
								%>
								<p><%=j.getDescription()%>
								</p>
								<%
								} else {
								%>
								<p><%=j.getDescription().substring(0, 120)%>...
								</p>
								<%
								}
								%>



								<p>

									Posted:
									<%=j.getPdate().toString()%>









									<%-- <fmt:formatDate type="date" value="${date}" /> --%>
									<%-- </p><p>
							<%=j.getPdate().toString()%></p> --%>
								<div class="text-center">
									<a href="one_view.jsp?id=<%=j.getId()%>"
										class="btn btn-sm bg-primary text-white">View More</a>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</c:if>

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