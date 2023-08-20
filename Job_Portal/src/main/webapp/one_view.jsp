<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Single Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>

<body style="background: #ffffff;">
	<%@include file="all_component/navbar.jsp"%>

	<%-- <c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if> --%>
	<form method="post" action="send_mail">
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%
					int id = Integer.parseInt(request.getParameter("id"));
					JobDAO dao = new JobDAO(DBConnect.getConn());
					Jobs j = dao.getJobById(id);
					%>
					<div class="card mt-5">
						<div class="card-body">
							<div class="text-center text-primary">
								<i class="far fa-clipboard fa-2x"></i>
							</div>

							<input type="hidden" value="<%=j.getId()%>" name="job_id">
							<h6><%=j.getTitle()%></h6>
							<input name="title" type="text"
								class="form-control form-control-sm d-none"
								value="<%=j.getTitle()%>" readonly>

							<P class="mb-0"><%=j.getCompany()%></P>
							<input name="company" type="text"
								class="form-control form-control-sm d-none"
								value="<%=j.getCompany()%>" readonly>



							<p><%=j.getLocation()%></p>


							<div class="row">





								<%-- <div class="form-group col-md-3"><i class="fa-solid fa-user-tie"></i>
									<input name="category" type="text"
										class="form-control form-control-sm"
										value="<%=j.getCategory()%>" readonly>
								</div> --%>

								<div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-user-tie"></i>
									<p class="mb-0 ms-1"><%=j.getCategory()%></p>
								</div>
								<%-- <div class="form-group col-md-3">
									<input name="category" type="text"
										class="form-control form-control-sm"
										value="<%=j.getExperience() %>" readonly>
								</div> --%>

								<div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-business-time"></i>
									<p class="mb-0 ms-1"><%=j.getExperience()%></p>
								</div>
								<%-- <div class="form-group col-md-3">
									<input name="category" type="text"
										class="form-control form-control-sm"
										value="<%=j.getPkg() %>" readonly>
								</div> --%>

								<div class="form-group col-md-3 d-flex align-items-center">
									<i class="fa-solid fa-user-tie"></i>
									<p class="mb-0 ms-1"><%=j.getPkg()%>
										LPA
									</p>
								</div>
							</div>
							<p><%=j.getDescription()%></p>

							<input type="text" class="form-control form-control-sm d-none"
								value="<%=j.getTitle()%>" readonly> <input type="text"
								placeholder="Enter name" required="required"
								class="form-control d-none" id="exampleInputEmail1"
								aria-describedby="emailhelp" name="email"
								value="<c:out value="${userobj.email}" />"> <input
								type="text" placeholder="Enter id" required="required"
								class="form-control d-none" id="exampleInputEmail1"
								aria-describedby="emailhelp" name="user_id"
								value="<c:out value="${userobj.id}" />"> <input
								type="text" placeholder="Enter name" required="required"
								class="form-control d-none" id="exampleInputEmail1"
								aria-describedby="emailhelp" name="name"
								value="<c:out value="${userobj.fname}" />"> Posted:
							<%=j.getPdate().toString()%></p>
							<div class="text-center">
								<button class="btn btn-primary">Apply</button>
								<a href="home.jsp" class="btn btn-primary">Back</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>