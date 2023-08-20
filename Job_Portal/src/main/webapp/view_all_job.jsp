<!-- jstl link -->
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entity.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Job</title>

<%@include file="all_component/all_css.jsp"%>

</head>

<body style="background: #ffffff;">

	<%@include file="all_component/navbar.jsp"%>

	<!-- only admin can access view_job -->
	<%-- <c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if> --%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-dark my-2">ALL JOBS</h5>

				<!-- message display -->
				<c:if test="${not empty succMsg}">
					<c:if test="${msgStatus eq 'fail'}">
						<div id="alert" class="alert alert-danger alert-dismissible"
							role="alert">
							<c:out value="${succMsg}" />
							<button id="close" type="button" class="close"
								data-dismiss="alert" aria-label="Close">
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
				List<Jobs> list = dao.getAllJobs();
				for (Jobs j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">

						<div class="text-center text-primary">
							<i class=" far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>

						<h6><%=j.getCompany()%></h6>

						<p><%=j.getDescription()%></p>

						<br>

						<div class="row mb-3">
							<%-- <div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="location: <%=j.getLocation()%>" readonly>
							</div> --%>

							<div class="form-group col-md-3 d-flex align-items-center">
								<i class="fa-solid fa-location-dot"></i>
								<p class="mb-0 ml-1"><%=j.getLocation()%></p>
							</div>

							<%-- <div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="category:<%=j.getCategory()%> " readonly>
							</div> --%>
							<div class="form-group col-md-3 d-flex align-items-center">
								<i class="fa-solid fa-user-tie"></i>
								<p class="mb-0 ml-1"><%=j.getCategory()%></p>
							</div>

							<%-- <div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="status:<%=j.getStatus()%> " readonly>
							</div> --%>
							<%-- <div class="form-group col-md-2 d-flex align-items-center">
								<p class="mb-0 ml-1"><%=j.getStatus()%></p>
							</div> --%>

							<%-- <div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="experience:<%=j.getExperience()%> " readonly>
							</div>--%>
							<div class="form-group col-md-3 d-flex align-items-center">
								<i class="fa-solid fa-business-time"></i>
								<p class="mb-0 ml-1"><%=j.getExperience()%></p>
							</div>

							<%-- <div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="package:<%=j.getPkg()%> " readonly>
							</div> --%>
							<div class="form-group col-md-3 d-flex align-items-center">
								<p class="mb-0 ml-1"><%=j.getPkg()%>
									LPA
								</p>
							</div>


						</div>

						<h6>
							Published Date:<%=j.getPdate()%>
						</h6>

						<div class="text-center">
							<%-- <a href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-primary text-white">View</a> --%>
							<a href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white px-5 py-2">Apply</a>
						</div>
					</div>
				</div>

				<%
				}
				%>


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