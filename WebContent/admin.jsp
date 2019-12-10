<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.travels.repository.BusesDao" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
    
<%
	HttpSession login=request.getSession();
	
	try{
	if(login.getAttribute("email")!=null){
%>
      <jsp:include page="header.jsp" />

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <a href="buses.jsp">
						<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Buses</div>
					  </a>

                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=BusesDao.getBusesCount() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-bus fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
						<a href="routes.jsp">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Routes</div>
						</a>
						
						 <!-- JSTL DbConnection -->
                <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/db_travels" user="root"  password="password"/>  
				<sql:query dataSource="${db}" var="rs"> SELECT count(*) AS rcnt from route </sql:query>
				<sql:query dataSource="${db}" var="rs1"> SELECT count(*) AS tcnt from travels </sql:query>
					<c:forEach var="result" items="${rs.rows}">
                      	<div class="h5 mb-0 font-weight-bold text-gray-800">${result.rcnt }</div>
                    </c:forEach>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-road fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
						<a href="travels.jsp">
							<div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Travels</div>
						</a>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <c:forEach var="result" items="${rs1.rows}">
                      	<div class="h5 mb-0 font-weight-bold text-gray-800">${result.tcnt }</div>
                    </c:forEach>
                        </div>

                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shuttle-van fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            
          </div>

          <!-- Content Row -->

          <div class="row">

            <br><br><br><br><br><br><br><br><br>
      <jsp:include page="footer.jsp" />

<%
}else{
	response.sendRedirect("login.jsp");
}
	} catch(Exception e){response.sendRedirect("login.jsp");}
%>