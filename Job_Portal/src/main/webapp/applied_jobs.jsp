
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applied Jobs</title>

<style type="text/css">
</style>

<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background: #ffffff;">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${(userobj.role ne 'user') } ">
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


	<a href='home.jsp' class="btn btn-secondary mt-1 ms-1 px-3 py-1"><i
		class="fa-sharp fa-solid fa-circle-arrow-left"></i></a>

	<form>

		<div class="container h-100">
			<div class="row">
				<div class="col-md-12">
					<h5 class="text-center mt-4">APPLIED JOBS</h5>

					<table class="table border shadow">
						<thead>
							<tr class="border-0">
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Job
									Title</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Location</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Status</th>


							</tr>
						</thead>
						<%
						
						int user_id = Integer.parseInt(request.getParameter("user_id"));
						AppliedJobsDAO dao = new AppliedJobsDAO(DBConnect.getConn());
						List<Integer> list = dao.getAppliedJobs(user_id);
	
						for (int a : list) {
							JobDAO jdao = new JobDAO(DBConnect.getConn());
							Jobs j = jdao.getJobById(a);
						%>
						<tbody>
							<tr class="border-0">
								<%-- <input type="hidden" name="title" value=<%=j.getid()%>> --%>

								<td class="border-0" style="font-size: 16px; font-weight: 400"><%=j.getTitle()%></td>
								<td class="border-0" style="font-size: 16px; font-weight: 400"
									scope="row"><%=j.getLocation()%></td>
								<td class="border-0 badge text-bg-success" style="font-size: 16px; font-weight: 400">Applied</td>



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