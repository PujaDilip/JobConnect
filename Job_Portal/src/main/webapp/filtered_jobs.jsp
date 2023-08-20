<%@page import="org.apache.catalina.tribes.ChannelSender"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : View Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background: #ffffff;">
	<%-- <c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>  --%>
	<%@include file="all_component/navbar.jsp"%>
	<a href='home.jsp' class="btn btn-secondary mt-1 ms-1 px-3 py-1"><i
		class="fa-sharp fa-solid fa-circle-arrow-left"></i></a>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All jobs</h5>


				<%
				String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				String msg = "";

				JobDAO dao = new JobDAO(DBConnect.getConn());

				List<Jobs> list = null;

				//value in select 
				if ("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<Jobs>();
					msg = "Job not available";
				}

				//value in select
				else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobORLocAndCat(loc, cat);
				} else {
					list = dao.getJobAndLocAndCat(loc, cat);
				}
				if (list.isEmpty()) {
				%>
				<h5 class="text-center text-danger">Job not available</h5>
				<%
				}
				if (list != null) {

				for (Jobs j : list) {
				%>


				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>


						<h6><%=j.getTitle()%></h6>

						<p class="mb-0"><%=j.getCompany()%></p>

						<%-- <p><i class="fa-solid fa-location-dot"></i><%=j.getLocation()%></p> --%>

						<p><%=j.getLocation()%></p>



						<div class="row">



							<div class="form-group col-md-3 d-flex align-items-center">
								<i class="fa-solid fa-user-tie"></i>
								<p class="mb-0 ms-1"><%=j.getCategory()%></p>
							</div>


							<div class="form-group col-md-3 d-flex align-items-center">
								<i class="fa-solid fa-business-time"></i>
								<p class="mb-0 ms-1"><%=j.getExperience()%></p>
							</div>


							<div class="form-group col-md-3 d-flex align-items-center">
								<i class="fa-solid fa-user-tie"></i>
								<p class="mb-0 ms-1"><%=j.getPkg()%>
									LPA
								</p>
							</div>
						</div>



						<%-- <div class="form-row">
						<div class="form-group col-md-3 d-flex align-items-center" >
								<i class="fa-solid fa-location-dot"></i>
									<p class="mb-0 ml-1"><%=j.getCategory()%></p>
								</div>
							<div class="form-group col-md-3">
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
							<%=j.getPdate().toString()%></p>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-primary text-white">View More</a> <!-- <a
								href="home.jsp" class="btn btn-sm bg-primary text-white">Back</a> -->
						</div>
					</div>
				</div>


				<%-- <div class="card mt 2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<P><%=j.getCompany()%></P>
						<P><%=j.getLocation()%>
						<p><%=j.getDescription()%></p>
						<p><%=j.getLocation() %></p>
						<p><i class="fa-solid fa-user-tie"></i><%=j.getCategory()%></p>
						<p><i class="fa-solid fa-business-time"></i><%=j.getExperience() %></p>
						<p><%=j.getPkg()%></p>
						<p><%=j.getPdate()%></p>
						
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="location: <%=j.getLocation() %>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="category:<%=j.getCategory() %> " readonly>
							</div>
						</div>
						<p>
							Posted:<%=j.getPdate()%></p>

						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-primary text-white">View More</a>
								<a href="home.jsp"
								class="btn btn-sm bg-primary text-white">Back</a>

						</div>
						
						
						
					</div>
				</div> --%>

				<%
				}
				} else {
				%>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
				}
				%>

			</div>
		</div>
	</div>

</body>
</html>