<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!---->
<script src="js/bootstrap.min.js"></script>

</head>
<body>
<%  
Cookie[] cookies = request.getCookies();  
String email = "";  
if (cookies != null) {  
    for (Cookie c : cookies) {  
        if ("Email".equals(c.getName())) {  
            email = c.getValue();  
            break;  
        }  
    }  
}  
%>  
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Date currentTime = new java.util.Date();
String str = formatter.format(currentTime);  
%>
 <div class="header">
	<div class="container">
		<div class="head-top">
			<div class="logo">
				<a href="Home0.jsp"><img src="images/logo.png" alt="" title="Academic"></a>
			</div>
			<div class="login">
				<ul class="nav-login">
					<li><a href="#" data-toggle="modal" data-target="#myModal3">Help</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal4">Contact us</a></li>
					<li style="color:white;">Hello!<%= email %></li>
					<li><a href="Home0.jsp">Logout</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
			<!--  help -->
			<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabe3">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
									<div class="login-right" align="center">
										<h3>Want know how to use?</h3>
										<h3>Please Pay!</h3>
										<img src="images/AliPay.png" class="img-responsive" alt>
									</div>
									
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //help -->
			<!--  contact us -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabe4">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
							
									<div class="login-right">
										<h3>want to contact us?</h3>
										<h3>NO WAY!</h3>
									</div>
									
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //contact us -->
		
			
		
		<div class="nav-top">
			<div class="container">
				<div class="nav1">
					<div class="navbar1">
					<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" >
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
		 
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav cl-effect-8">
								<li ><a class="active" href="Home2.jsp">Back </a></li>
								
							
							</ul>
						</div><!-- /.navbar-collapse -->
					</div>
					
					<div class="clearfix"></div>
				</div> 
			</div> 
		</div> 
</div> 

	


	
	<script>
		function check_required(field,alerttxt){
			with(field){
				if (!/^((0[0-9])|(1[0-9])|(2[0-3]))\:([0-5][0-9])$/.test(value)){
					alert(alerttxt)
					return false;
				}else{
					return true;
				}
			}
		}
		function check(thisform){
			with(thisform){
				if (check_required(time,"wrong time!") == false){
					time.focus();
					return false;
				}
			}
		}
	</script>
	<div class="modal-dialog" role="document">
	<div class="login-grids">
		<div class="login-right">
			<form action="CreateActivity" method="post" onsubmit="return check(this)">
			<h3>Create a new activity </h3>
			<input type="text" placeholder="title" name="title">
			<p><input type="date" name="date" required min=<%= str %>>
			<p><input type="text" placeholder="time" name="time">
			<input type="text" placeholder="site" name="site">
			<input type="text" placeholder="speaker" name="speaker">
			<input type="hidden" name="holder" value=<%=email %>>
			<p><input type="reset" value="reset">
			<input type="submit" value="CREATE">
			</form>
		</div>
	</div>
	</div>
		


</body>
</html>