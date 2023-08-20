<%@page import="com.dao.RecruiterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Jobs</title>

<style type="text/css">
</style>

<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background: #ffffff;">
	<%@include file="all_component/navbar.jsp"%>
	<c:if
		test="${(userobj.role ne 'Recruiter')||(userobj.role ne 'admin') } ">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


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


	<a href='recruiter.jsp' class="btn btn-secondary mt-1 ms-1 px-3 py-1"><i
		class="fa-sharp fa-solid fa-circle-arrow-left"></i></a>

	<form method="get" action="delete_job">

		<div class="container h-100">
			<div class="row">
				<div class="col-md-12">
					<h5 class="text-center mt-4">ALL JOBS</h5>

					<table class="table border shadow">
						<thead>
							<tr class="border-0">
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Title</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Category</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Status</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Location</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Published
									date</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Package</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Company</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Experience</th>
								<c:if test="${userobj.role eq 'Recruiter'}">
									<th class="mb-2 border-0"
										style="font-size: 16px; font-weight: 500" scope="col">Action</th>
								</c:if>
							</tr>
						</thead>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDAO dao = new JobDAO(DBConnect.getConn());
						List<Jobs> list = dao.getJobByRecruiterId(id);

						for (Jobs j : list)

						{
						%>
						<tbody>
							<tr class="border-0">
								<input type="hidden" name="id" value=<%=j.getId()%>>
								<input type="hidden" name="recruiter_id" value="<c:out value="${userobj.id}" />">
								<td class="border-0" style="font-size: 16px; font-weight: 400"
									scope="row"><%=j.getTitle()%></td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getCategory()%></td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getStatus()%></td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getLocation()%></td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getPdate()%></td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getPkg()%>
									LPA</td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getCompany()%></td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getExperience()%></td>
								<c:if test="${userobj.role eq 'Recruiter'}">
									<td class="border-0" style="font-size: 16px; font-weight: 400"><a
										href="edit_job.jsp?id=<%=j.getId()%>" class="btn btn-primary">Edit</a>
										<%--  <a
										href="edit_recruiter.jsp?id=<%=j.getId()%>"
										class="btn btn-danger">Delete</a></td> --%>

										<button class="btn btn-primary">DELETE</button>
								</c:if>
							</tr>


							<%
							}
							%>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</form>


	<script type="text/javascript">
	
	/* Toaster close function starts from here */
	if(document.getElementById("alert")){
		setTimeout(() => {
			const closeBtn = document.getElementById("close")
			closeBtn.click()
		}, 2500);
	}
	/* Toasster close function end here	 */
	
	</script>
</body>
</html>