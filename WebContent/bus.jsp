<%@ page import="java.sql.*, com.travels.repository.UserSearchDao, com.travels.entity.UserSearchBean" %>

<%

String from= request.getParameter("from");
String to= request.getParameter("to");
String date= request.getParameter("date");

UserSearchBean usb=new UserSearchBean();
usb.setFrom(from);
usb.setTo(to);
usb.setDate(date);

ResultSet rs=null;
try {
	rs=UserSearchDao.getAllDetails(usb);
	
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>


<!DOCTYPE HTML>
<html>
<head>
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




  <div id="myModal" class="modal fade">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <a href="index.jsp"><button type="button" class="close" data-dismiss="modal">&times;</button></a>
        </div>
        <div class="modal-body">
        <div class="alert alert-warning">
  <strong>Buses are not available on this date.</strong> </div>
        </div>
        <div class="modal-footer">
          <a href="index.jsp"><button type="button" class="btn btn-default">Close</button></a>
        </div>
      </div>
    </div>
</div>



<!-- top-header -->
<div class="top-header">
	<div class="container">
		<ul class="tp-hd-lft wow fadeInLeft animated" data-wow-delay=".5s">
			<li class="hm"><a href="index.jsp"><i class="fa fa-home"></i></a></li>
			<% 
			HttpSession user=request.getSession();
			String email=(String)user.getAttribute("uemail");
			if(email==null){ %>
			<li class="prnt"><a href="login.jsp">Admin Login</a></li>
			<% } %>
				
		</ul>
		<ul class="tp-hd-rgt wow fadeInRight animated" data-wow-delay=".5s"> 
			<% 
			
			if(email!=null){ %>
			<li class="sig"><a href="UserLogout" >Logout</a></li> 
			<% }else{ %>
			<li class="sig"><a href="#" data-toggle="modal" data-target="#myModal" >Sign Up</a></li> 
			<li class="sigi"><a href="#" data-toggle="modal" data-target="#myModal4" >/ Sign In</a></li>
			<% } %>
        </ul>
		<div class="clearfix"></div>
	</div>
</div>
<!--- /top-header ---->
<!--- header ---->
<div class="header">
	<div class="container">
		<div class="logo wow fadeInDown animated" data-wow-delay=".5s">
			<a href="index.jsp">Travels</a>	
		</div>
		
		<div class="lock fadeInDown animated" data-wow-delay=".5s"> 
			<li><i class="fa fa-lock"></i></li>
            <li><div class="securetxt">SAFE &amp;<br> SECURE </div></li>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!--- /header ---->
<!--- banner-1 ---->
<div class="banner-1 ">
	<div class="container">
		<h1 class="wow zoomIn animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: zoomIn;"> Travels - Best in Class for Travel</h1>
	</div>
</div>
<!--- /banner-1 ---->
<!--- bus-tp ---->
<div class="bus-tp">
	<div class="container">
		<p><%= request.getParameter("date") %></p>
		<h2>Buses from <%= request.getParameter("from") %> to <%= request.getParameter("to") %></h2>
		
		<div class="clearfix"></div>
	</div>
</div>
<!--- /bus-tp ---->
<!--- bus-btm ---->
<div class="bus-btm">
	<div class="container">
		<ul>
			<li class="trav"><a href="#">Travels</a></li>
			<li class="dept"><a href="#">Depart</a></li>
			<li class="seat"><a href="#">Arrival</a></li>
			<li class="fare"><a href="#">Fare</a></li>
				<div class="clearfix"></div>
		</ul>
	</div>
</div>
<!--- /bus-btm ---->
<!--- bus-midd ---->
<div class="bus-midd wow zoomIn animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: zoomIn;">
	<div class="container">
	
	<%  int flag=0;
		while(rs.next()){ 
		flag=1;
	%>
	<ul class="first">
			<li class="trav">
				<div class="bus-ic">
					<img src="images/bus.png" class="img-responsive" alt="">
				</div>
				<div class="bus-txt">
					<h4><%= rs.getString(1) %></h4>
					<p><%= rs.getString(2) %></p>
				</div>
				<div class="clearfix"></div>
			</li>
			<li class="dept">
				<div class="bus-ic1">
					<i class="fa fa-clock-o"></i>
				</div>
				<div class="bus-txt1">
					<h4><a href="#"><%= rs.getString(3) %></a></h4>
					<p>Duration</p>
				</div>
				<div class="clearfix"></div>
			</li>
			<li class="arriv">
				<div class="bus-txt2">
					<h4><a href="#"><%= rs.getString(4) %> Hrs</a></h4>
				</div>
			</li>

			<li class="fare">
				<div class="bus-txt4">
					<h5><%= rs.getString(5) %></h4>
					<a href="seats.jsp?busid=<%= rs.getString(8) %>&travels=<%= rs.getString(1) %>&type=<%= rs.getString(2) %>&depart=<%= rs.getString(3) %>&arrival=<%= rs.getString(4) %>&fare=<%= rs.getString(5) %>&from=<%= request.getParameter("from") %>&to=<%= request.getParameter("to") %>&date=<%= request.getParameter("date") %>#img1" class="view">View Seats</a>
						<div class="lightbox" id="img1">
						  <div class="box">
							<a class="close" href="#">X</a>
								<div class="set-left">
									<ul class="set">
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<div class="clearfix"></div>
									</ul>
									<ul class="set-1">
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<div class="clearfix"></div>
									</ul>
									<ul class="set">
										<li><img src="images/seat-1.png" class="img-responsive" alt=""></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-5.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<li><a href="#"><img src="images/seat-1.png" class="img-responsive" alt=""></a></li>
										<div class="clearfix"></div>
									</ul>
								</div>
								<div class="set-right">
									<ul class="ste1">
										<li><img src="images/seat-5.png" class="img-responsive" alt=""> </li>
										<li><p class="aval">Available Seat</p></li>
										<div class="clearfix"></div>
									</ul>
									
									<ul class="ste1">
										<li><img src="images/seat-1.png" class="img-responsive" alt=""> </li>
										<li><p class="aval">Selected Seat</p></li>
										<div class="clearfix"></div>
									</ul>
								
									
								</div>
								<div class="clearfix"></div>
						  </div>
						</div>   

				</div>
			</li>
				<div class="clearfix"></div>
		</ul>
		<!--- /ul-first  ---->
		
		
		
		<%}
		if(flag==0){
		%>
			<script>
				$(document).ready(function(){
				$("#myModal").modal('show');
				});
			</script>
		<%
		}
		%>
		<!--- ul-first-1 ---->
			</div>
</div>
<!--- /bus-midd ---->
<!--- footer-top ---->

<!---copy-right ---->
<div class="copy-right">
	<div class="container">
	
		
		<p class="wow zoomIn animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: zoomIn;">© 2019 Travels . All Rights Reserved</p>
	</div>
</div>
<!--- /copy-right ---->
<!-- sign -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
							<section>
								<div class="modal-body modal-spa">
									<div class="login-grids">
										<div class="login">
											<div class="login-left">
												<ul>
													<li><a class="fb" href="#"><i></i>Sign in with Facebook</a></li>
													<li><a class="goog" href="#"><i></i>Sign in with Google</a></li>
													<li><a class="linkin" href="#"><i></i>Sign in with Linkedin</a></li>
												</ul>
											</div>
											<div class="login-right">
												<form>
													<h3>Create your account </h3>
													<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
													<input type="text" value="Mobile number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Mobile number';}" required="">
													<input type="text" value="Email id" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email id';}" required="">	
													<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">	
													<input type="submit" value="CREATE ACCOUNT">
												</form>
											</div>
												<div class="clearfix"></div>								
										</div>
											<p>By logging in you agree to our <a href="terms.jsp">Terms and Conditions</a> and <a href="privacy.jsp">Privacy Policy</a></p>
									</div>
								</div>
							</section>
					</div>
				</div>
			</div>
<!-- //sign -->
<!-- signin -->
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Ã—</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-left">
										<ul>
											<li><a class="fb" href="#"><i></i>Sign in with Facebook</a></li>
											<li><a class="goog" href="#"><i></i>Sign in with Google</a></li>
											<li><a class="linkin" href="#"><i></i>Sign in with Linkedin</a></li>
										</ul>
									</div>
									<div class="login-right">
										<form>
											<h3>Signin with your account </h3>
											<input type="text" value="Enter your mobile number or Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your mobile number or Email';}" required="">	
											<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">	
											<h4><a href="#">Forgot password</a></h4>
											<div class="single-bottom">
												<input type="checkbox" id="brand" value="">
												<label for="brand"><span></span>Remember Me.</label>
											</div>
											<input type="submit" value="SIGNIN">
										</form>
									</div>
									<div class="clearfix"></div>								
								</div>
								<p>By logging in you agree to our <a href="terms.jsp">Terms and Conditions</a> and <a href="privacy.jsp">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- //signin -->
<!-- write us -->
			<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
							<section>
								<div class="modal-body modal-spa">
									<div class="writ">
										<h4>HOW CAN WE HELP YOU</h4>
											<ul>
												<li class="na-me">
													<input class="name" type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
												</li>
												<li class="na-me">
													<input class="Email" type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
												</li>
												<li class="na-me">
													<input class="number" type="text" value="Mobile Number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Mobile Number';}" required="">
												</li>
												<li class="na-me">
													<select id="country" onchange="change_country(this.value)" class="frm-field required sect">
														<option value="null">Select Issue</option> 		
														<option value="null">Booking Issues</option>
														<option value="null">Bus Cancellation</option>
														<option value="null">Refund</option>
														<option value="null">Wallet</option>														
													</select>
												</li>
												<li class="na-me">
													<select id="country" onchange="change_country(this.value)" class="frm-field required sect">
														<option value="null">Select Issue</option> 		
														<option value="null">Booking Issues</option>
														<option value="null">Bus Cancellation</option>
														<option value="null">Refund</option>
														<option value="null">Wallet</option>														
													</select>
												</li>
												<li class="descrip">
													<input class="special" type="text" value="Write Description" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Write Description';}" required="">
												</li>
													<div class="clearfix"></div>
											</ul>
											<div class="sub-bn">
												<form>
													<button class="subbtn">Submit</button>
												</form>
											</div>
									</div>
								</div>
							</section>
					</div>
				</div>
			</div>
<!-- //write us -->
</body>
</html>