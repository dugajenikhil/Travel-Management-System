<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<%@ page import="java.sql.*, com.travels.repository.UserSearchDao, com.travels.entity.UserSearchBean" %>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<body>

<h2>Book Ticket</h2>
<div class="row">
  <div class="col-75">
    <div class="container" style="padding: 15px 122px 18px 122px;">
      <form action="BookTicket">
        <div class="row">
          
          <div class="col-50">
          
            <h2><%=request.getParameter("travels") %> <span>Travels</span></h2>
            <div class="col-25">
    <div class="container" style="font-size: 20px;padding: 46px 110px 46px 110px;">
      <p>Type: <span class="price"><%=request.getParameter("type") %></span></p>
      <p>From: <span class="price"><%=request.getParameter("from") %></span></p>
      <p>To: <span class="price"><%=request.getParameter("to") %></span></p>
      <p>Number of seats booked: <span class="price"><%=request.getParameter("seats") %></span></p>
      <p>Arrival: <span class="price"><%=request.getParameter("arrival") %></span></p>
      <p>Amount per seat: <span class="price"><%=request.getParameter("fare") %></span></p>

      <hr>
      <p>Total <span class="price" style="color:black"><b><%=Integer.parseInt(request.getParameter("fare"))*Integer.parseInt(request.getParameter("seats")) %></b></span></p>
    </div>
  </div>

            
        </div>
  
  
  <input type="hidden" name="travels" value="<%=request.getParameter("travels") %>" />
  <input type="hidden" name="travels" value="<%=request.getParameter("type") %>" />
  <input type="hidden" name="travels" value="<%=request.getParameter("from") %>" />
  <input type="hidden" name="travels" value="<%=request.getParameter("to") %>" />
  <input type="hidden" name="travels" value="<%=request.getParameter("seats") %>" />
  <input type="hidden" name="travels" value="<%=Integer.parseInt(request.getParameter("fare"))*Integer.parseInt(request.getParameter("seats")) %>" />
        <a href="https://p-y.tm/1I-fAp8" onclick="return confirm('Do you want to proceed?')" class="btn" style="padding-left: 550px;">Continue to Payment</a>
      </form>
      
      
      <% HttpSession user=request.getSession();%>
      
      
      <!-- JSTL DbConnection -->
            <c:catch var ="catchException">
      
                <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/db_travels" user="root"  password="password"/>  
				<sql:query dataSource="${db}" var="rs"> INSERT into `ticket` SET `travel`='<%=request.getParameter("travels") %>',`type`='<%=request.getParameter("type") %>',`from`='<%=request.getParameter("from") %>',`to`='<%=request.getParameter("to") %>',`seats`=<%=request.getParameter("seats") %>,`amount`=<%=Integer.parseInt(request.getParameter("fare"))*Integer.parseInt(request.getParameter("seats"))%>, `uemail`='<%=user.getAttribute("uemail")%>'  </sql:query>
            </c:catch>
      
      
      
      
    </div>
  </div>
  
</div>

</body>
</html>
