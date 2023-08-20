<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Recruiter"%>
<%@page import="com.dao.RecruiterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter edit</title>
</head>
<!-- linking css file -->
<%@include file="all_component/all_css.jsp"%>
<body style="background: #ffffff;">

	<!-- adding navbar -->
	<%@include file="all_component/navbar.jsp"%>


	<!-- checking if logged in -->
	<%-- <c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if> --%>


	<div class="container-fluid">
		<div class="d-flex align-items-center justify-content-center mt-2">
			<div class="col-md-10">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<%
							int id = Integer.parseInt(request.getParameter("id"));
							RecruiterDAO dao = new RecruiterDAO(DBConnect.getConn());
							Recruiter r = dao.getRecruiterById(id);
							%>
							<h5>Edit profile</h5>
						</div>

						<c:if test="${userobj.role eq 'admin' }">
							<form action="set_recruiter_status" method="post">
								<input type="hidden" value="<%=r.getId()%>" name="id">




								<div class="row">
									<div class="col-6 form-group my-2">
										<label>Company Name</label><input type="text"
											name="company_name" readonly="readonly" class="form-control"
											placeholder="Enter company name"
											value="<%=r.getCompany_name()%>">
									</div>
									<div class="col-6 form-group my-2">
										<label>Recruiter Name</label> <input type="text"
											name="recruiter_name" readonly="readonly"
											class="form-control" placeholder="Enter recruiter name"
											value="<%=r.getRecruiter_name()%>">
									</div>
								</div>
								<div class="row">
									<div class="col-6 form-group my-2">
										<label>Location</label> <input type="text" name="location"
											placeholder="Enter location" readonly="readonly"
											class="form-control" value="<%=r.getLocation()%>">
									</div>
									<div class="col-6 form-group my-2">
										<label>Mobile Number</label> <input type="text" name="phno"
											placeholder="Enter mobile number" readonly="readonly"
											class="form-control" value="<%=r.getPhno()%>">
									</div>
								</div>
								<div class="row">
									<div class="col-6 form-group my-2">
										<label>Email</label> <input type="text" name="email"
											placeholder="Enter email" readonly="readonly"
											class="form-control" value="<%=r.getEmail()%>">
									</div>
									<div class="col-6 form-group my-2">
									
									
										<label>Status</label> <select name="status"
											class="form-select" id="inlineFormCustomSelectPref" >
											<option value="<%=r.getStatus()%>"><%=r.getStatus()%></option>
											<option value="ACTIVE">ACTIVE</option>
											<option value="INACTIVE">INACTIVE</option>

										</select>
									</div>
								</div>

								<div class="text-end">

									<button class="btn btn-primary">Set status</button>



									<a href="recruiter.jsp" class="btn btn-secondary">Back</a>
								</div>
							</form>
						</c:if>

						<c:if test="${userobj.role eq 'Recruiter' }">
							<form action="update_recruiter_profile" method="post">
								<input type="hidden" value="<%=r.getId()%>" name="id">




								<div class="row">
									<div class="col-6 form-group my-2">
										<label>Company Name</label><input type="text"
											name="company_name" class="form-control"
											placeholder="Enter company name"
											value="<%=r.getCompany_name()%>">
									</div>
									<div class="col-6 form-group my-2">
										<label>Recruiter Name</label> <input type="text"
											name="recruiter_name" class="form-control"
											placeholder="Enter recruiter name"
											value="<%=r.getRecruiter_name()%>">
									</div>
								</div>
								<div class="row">
									<div class="col-4 form-group my-2">
										<label>Location</label> <input type="text" name="location"
											placeholder="Enter location" class="form-control"
											value="<%=r.getLocation()%>">
									</div>
									<div class="col-4 form-group my-2">
										<label>Mobile Number</label> <input type="text" name="phno"
											placeholder="Enter mobile number" class="form-control"
											value="<%=r.getPhno()%>">
									</div>
									<div class="col-4 form-group my-2">
										<label>Password</label> <input type="text" name="password"
											placeholder="Enter password" class="form-control"
											value="<%=r.getPassword()%>">
									</div>

								</div>
								<div class="row">
									<div class="col-6 form-group my-2">
										<label>Email</label> <input type="text" name="email"
											placeholder="Enter email" readonly="readonly"
											class="form-control" value="<%=r.getEmail()%>">
									</div>
									<div class="col-6 form-group my-2">
										<label>Status</label> <select name="status"
											class="form-select" id="inlineFormCustomSelectPref" disabled="disabled">
											<option value="<%=r.getStatus()%>"><%=r.getStatus()%></option>
											<option value="ACTIVE">ACTIVE</option>
											<option value="INACTIVE">INACTIVE</option>

										</select>
									</div>
								</div>

								<div class="text-end">

									<button class="btn btn-primary">Edit Profile</button>



									<a href="home.jsp" class="btn btn-secondary">Back</a>
								</div>
							</form>
						</c:if>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>