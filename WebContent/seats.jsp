<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.travels.repository.UserSearchDao, com.travels.entity.UserSearchBean" %>

<%
	HttpSession user=request.getSession();
	
	try{
	if(user.getAttribute("uemail")!=null){
%>

<!DOCTYPE HTML>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Travels a Travel Category Flat Bootstrap Responsive Website Template | Bus :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Travels Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />

<link href="css/font-awesome.css" rel="stylesheet">
<!-- Custom Theme files -->
<script src="js/jquery-1.12.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
</head>
<body>

<% 
	int bus_id=0;
	ResultSet rs=null;
	try {
		bus_id=Integer.parseInt(request.getParameter("busid"));
		rs=UserSearchDao.getSeatsDetails(bus_id);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
				<div class="bus-txt4">
						<div class="lightbox" id="img1">
						  <div class="box">
								<div class="set-left">
									<ul class="set">
									
									
									<form action="SeatsServlet">
									
									<% int cnt=0;
									while(rs.next()){
										if(rs.getInt(3)==0){ 
											cnt++;
											out.print("<li><img src='images/seat-5.png' class='img-responsive'><input type='checkbox' name='seat_no_"+cnt+"' value='"+rs.getInt(1)+"'></li>");
										}else{
											out.print("<li><img src='images/seat-1.png' class='img-responsive'><input type='checkbox' name='vehicle1' value='Bike' disabled></li>");
		  								}	
									} %>
									<input type="hidden" name="totCnt" value="<%=cnt %>" />
									<input type="hidden" value="<%=request.getParameter("busid")%>" name="busid">
									<input type="hidden" value="<%=request.getParameter("travels")%>" name="travels">
									<input type="hidden" value="<%=request.getParameter("type")%>" name="type">
									<input type="hidden" value="<%=request.getParameter("depart")%>" name="depart">
									<input type="hidden" value="<%=request.getParameter("arrival")%>" name="arrival">
									<input type="hidden" value="<%=request.getParameter("fare")%>" name="fare">
									<input type="hidden" value="<%=request.getParameter("from")%>" name="from">
									<input type="hidden" value="<%=request.getParameter("to")%>" name="to">
									<input type="hidden" value="<%=request.getParameter("date")%>" name="date">
									</ul>
								
								</div>
								<div class="set-right">
									<ul class="ste1">
										<li><img src="images/seat-5.png" class="img-responsive" alt=""> </li>
										<li><p class="aval">Available Seats: <%=cnt %></p></li>
										<div class="clearfix"></div>
									</ul>
									
									<ul class="ste1">
										<li><img src="images/seat-1.png" class="img-responsive" alt=""> </li>
										<li><p class="aval">Selected Seat</p></li>
										<div class="clearfix"></div>
									</ul>
									
									
									
									<br><br><br><br><br><br><br><br><br><br>
									<button type="submit" class="btn btn-success">Book Now</button>
									</form>
									
								</div>
								<div class="clearfix"></div>
						  </div>
						</div>   

				</div>
</body>
</html>

<%
}else{
	response.sendRedirect("/Travels/index.jsp?login=0");
}
	} catch(Exception e){response.sendRedirect("/Travels");}
%>