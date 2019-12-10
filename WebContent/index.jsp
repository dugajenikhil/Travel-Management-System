<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
try{
	
	if(request.getParameter("login").equals("0")){
		out.println("<script>alert('You have not Logged In!');</script>");
	}
	if(request.getParameter("password").equals("0")){
		out.println("<script>alert('Incorrect password!');</script>");
	}
} catch(Exception e){}
%>
<!DOCTYPE HTML>
<html>
<head>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
<title>Travels a Travel Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Travels Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!--<link href='//fonts.googleapis.com/css?family=Open+Sans:400,700,600' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>-->
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
			<% }else{ %>
				<li class="prnt"><a href="viewticket.jsp">View Tickets</a></li>
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

<!--- banner ---->
<div class="banner">
	<div class="container">
		<h1 class="wow zoomIn animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: zoomIn;"> Travels - Best in Class for Travel</h1>
	</div>
</div>
<div class="container">
	
	<div class="col-md-7 bann-info wow fadeInRight animated" data-wow-delay=".5s">
		<h2>Online Tickets with Zero Booking Fees</h2>
		<script type="text/javascript">
		function checkDate() {//alert("Ready");
			 var selectedDate = document.getElementById('date').value;//alert(Date.parse(selectedDate));
			 function format(date) {
				    var d = date.getDate();
				    var m = date.getMonth() + 1;
				    var y = date.getFullYear();
				    return '' + y + '-' + (m<=9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
			}

				var today = new Date();
				var dateString = format(today);
				//alert(Date.parse(dateString));
			
			   if (Date.parse(selectedDate) < Date.parse(dateString)) {
			    alert("Date must be in the future");
			   }
		}
		</script>
		
		<form action="bus.jsp" onsubmit="return checkDate()">
		
		<!-- JSTL DbConnection -->
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/db_travels" user="root"  password="password"/>  
		<sql:query dataSource="${db}" var="rs"> SELECT distinct `from` FROM `route`; </sql:query>
		<sql:query dataSource="${db}" var="rs2"> SELECT distinct `to` FROM `route`; </sql:query>
		
		<div class="ban-top">
			<div class="bnr-left">
				<label class="inputLabel">From</label>
				<select name="from" class="form-control">               
                <c:forEach var="result" items="${rs.rows}">              
                	<option value="${result.from}">${result.from}</option>
                </c:forEach>
                </select>
			</div>
			<div class="bnr-left">
				<label class="inputLabel">To</label>
				<select name="to" class="form-control"> 
				<c:forEach var="result" items="${rs2.rows}">              
                	<option value="${result.to}">${result.to}</option>
                </c:forEach>
                </select>
			</div>
				<div class="clearfix"></div>
		</div>
		<div class="ban-bottom">
			<div class="bnr-right">
				<label class="inputLabel">Date of Journey</label>
				<input name="date" onchange="checkDate()" id="date" class="form-control" type="date" value="dd-mm-yyyy" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'dd-mm-yyyy';}" required>
			</div>
			
				<div class="clearfix"></div>
				<!---start-date-piker---->
				<link rel="stylesheet" href="css/jquery-ui.css" />
				<script src="js/jquery-ui.js"></script>
					<script>
						$(function() {
						$( "#datepicker,#datepicker1" ).datepicker();
						});
					</script>
			<!---/End-date-piker---->
		</div>
		<div class="sear">
				<button type="submit" value="Search Buses" class="seabtn"/>Search Buses</button>
			</form>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<!--- /banner ---->

<!---copy-right ---->
<div class="copy-right">
	<div class="container">
	
		
		<p class="wow zoomIn animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: zoomIn;">© 2019 Travels . All Rights Reserved </p>
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
											<!-- <div class="login-left">
												<ul>
													<li><a class="fb" href="#"><i></i>Sign in with Facebook</a></li>
													<li><a class="goog" href="#"><i></i>Sign in with Google</a></li>
													<li><a class="linkin" href="#"><i></i>Sign in with Linkedin</a></li>
												</ul>
											</div> -->
											<script type="text/javascript">
												function validatePassword(){
													var p1=document.registration.password.value;
													var p2=document.registration.password2.value;
													var b=p1==p2;
													if(b){
														return true;
													}else{
														alert("Password does not match!");
														return false;
													}
												}
											</script>
											<div class="login-right" style="float: left;width: 100%;">
												<form action="UserLogin" onsubmit="return validatePassword();" name="registration">
													<h3>Create your account </h3>
													<input type="text" name="name" placeholder="Name" required="">
													<input type="email" name="email" placeholder="Email id" style="width: 100%;padding: 10px;
    font-weight: normal;
    background: none;
    border: 1px solid #E6E4E4;
    color: #D2D1D1;
    outline: none;
    font-size: 14px;
    margin-top: 20px;" required="">	
													<input type="password" name="password" placeholder="Password" required="">	
													<input type="password" name="password2" placeholder="Retype Password" required="">
													<input type="submit" value="CREATE ACCOUNT">
												</form>
											</div>
												<div class="clearfix"></div>								
										</div>
											<!-- <p>By logging in you agree to our <a href="terms.jsp">Terms and Conditions</a> and <a href="privacy.jsp">Privacy Policy</a></p> -->
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
									<!-- <div class="login-left">
										<ul>
											<li><a class="fb" href="#"><i></i>Sign in with Facebook</a></li>
											<li><a class="goog" href="#"><i></i>Sign in with Google</a></li>
											<li><a class="linkin" href="#"><i></i>Sign in with Linkedin</a></li>
										</ul>
									</div> -->
									<div class="login-right" style="float: left;width: 100%;">
										<form action="UserLogin2">
											<h3>Signin with your account </h3>
											<input type="email" name="email" placeholder="Enter your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your mobile number or Email';}" style="width: 100%;padding: 10px;
    font-weight: normal;
    background: none;
    border: 1px solid #E6E4E4;
    color: #D2D1D1;
    outline: none;
    font-size: 14px;
    margin-top: 20px;" required="">		
											<input type="password" name="password" placeholder="Password" required="">	
											<!-- <div class="single-bottom">
												<input type="checkbox" id="brand" value="">
												<label for="brand"><span></span>Remember Me.</label>
											</div> -->
											<input type="submit" value="SIGNIN">
										</form>
									</div>
									<div class="clearfix"></div>								
								</div>
								<!-- <p>By logging in you agree to our <a href="terms.jsp">Terms and Conditions</a> and <a href="privacy.jsp">Privacy Policy</a></p> -->
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