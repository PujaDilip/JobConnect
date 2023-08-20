<%@page import="com.dao.UserDAO"%>
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
<title>All User</title>

<style type="text/css">
</style>

<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background: #ffffff;">
	<%@include file="all_component/navbar.jsp"%>
	<%-- <c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if> --%>


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



	<a href='admin.jsp' class="btn btn-secondary mt-1 ms-1 px-3 py-1"><i
		class="fa-sharp fa-solid fa-circle-arrow-left"></i></a>
	<form>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h5 class="text-center text-dark mt-4">ALL USERS</h5>

					<table class="table border shadow">
						<thead>
							<tr class="border-0">
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Full
									Name</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Email</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Mobile
									no.</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Skill</th>
								<th class="mb-2 border-0"
									style="font-size: 16px; font-weight: 500" scope="col">Experience</th>

								<!-- <th class="mb-2" style="font-size: 16px; font-weight: 500"
									scope="col">Action</th> -->
							</tr>
						</thead>
						<%
						UserDAO dao = new UserDAO(DBConnect.getConn());
						List<User> list = dao.getAllUser();
						for (User u : list) {
						%>
						<tbody>
							<tr class="border-0">
								<td class="border-0" style="font-size: 14px; font-weight: 400"
									scope="row"><%=u.getFname()%></td>
								<td class="border-0" style="font-size: 14px; font-weight: 400"><%=u.getEmail()%></td>
								<td class="border-0" style="font-size: 14px; font-weight: 400"><%=u.getPhno()%></td>
								<td class="border-0" style="font-size: 14px; font-weight: 400"><%=u.getSkill()%></td>
								<td class="border-0" style="font-size: 14px; font-weight: 400"><%=u.getExperience()%></td>

								<%-- <td style="font-size: 14px; font-weight: 400"><a
									href="edit_recruiter.jsp?id=<%=u.getId()%>"
									class="btn btn-primary">Edit</a></td> --%>
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
</body>
</html>