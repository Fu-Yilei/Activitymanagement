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
					<li><a href="#" data-toggle="modal" data-target="#myModal1">Login</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal2">Signup</a></li>
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
										<h3>本系统面对三种用户：游客，普通用户和主办方。</h3>
										<h3>游客可以查询活动并查看活动详细信息。</h3>
										<h3>普通用户在游客的基础上增加了收藏功能并提供邮件提醒功能。</h3>
										<h3>主办方可以增加或者修改活动，但不提供收藏功能。</h3>
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
										<h3>Eamil:1730848262@qq.com</h3>
										<h3>Tel:15858283456</h3>
									</div>
									
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //contact us -->
		<!-- login -->
			<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
							
									<div class="login-right">
										<form action="SignIn" method="post">
											<h3>Signin with your account </h3>
											<input type="text" value="Enter your Email" name="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Enter your Email';}" required="">	
											<input type="password" value="Password" name="Password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Password';}" required="">	
											<input type="submit" value="SIGNIN" >
										</form>
									</div>
									
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //login -->
			<!-- signup -->
			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
							
									<div class="login-right">
										<script>
											function check_required(field,alerttxt){
												with(field){
													if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value)){
														alert(alerttxt)
														return false;
													}else{
														return true;
													}
												}
											}
											function check(thisform){
												with(thisform){
													if (check_required(Email,"unsupport email format!") == false){
														time.focus();
														return false;
													}
												}
											}
										</script>
										<form action="SignUp" method="post" name="form1" onsubmit="return check(this)">
											<h3>Create your account </h3>
											<input type="text" value="Email" name="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}">	
											<input type="password" value="Password" name="Password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Password';}">	
											<input type="radio" value="normal" name="Usertype">User
											<input type="radio" value="holder" name="Usertype">Holder
											<input type="submit" value="CREATE ACCOUNT">
										</form>
									</div>
								
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //signup -->
		<div class="banner">
			<div class="container">
				<div class="banner-text">
					<h2>小型在线活动管理系统</h2>
					<p>Via Team W.F.T.N</p>
				</div>
				<p class="banner-text1">您目前正在以游客的身份访问本网站，如果希望享受收藏活动和接受提醒的服务，敬请注册！</p>
			</div>
		</div>
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
								<li ><a class="active" href="Home0.jsp">Home </a></li>
								<li><a href="ViewAll0.jsp">ViewAll</a></li>
							
							</ul>
						</div><!-- /.navbar-collapse -->
					</div>
					
					<div class="clearfix"></div>
				</div> 
			</div> 
		</div> 
</div> 

	
	


<!---->
<div class="content-bottom">
	<h1>Gallery</h1>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                   <img src="images/P1.png" alt="" class="img-responsive">
               </div>
                <div class="text-desc">
					<h6>Activity</h6>
					<p>Title</p>   
                </div>
           </div>
         </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P2.png" alt="" class="img-responsive">
                </div>
				<div class="text-desc">
					<h6>Activity</h6>
					<p>Title</p>   
                </div>
            </div>
        </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P3.png" alt="" class="img-responsive">
                </div>
				<div class="text-desc">
					<h6>Activity</h6>
					<p>Title</p>   	
				</div>
			</div>
        </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P4.png" alt="" class="img-responsive">
                </div>
                <div class="text-desc">
					<h6>Activity</h6>
					<p>Title</p>   
                </div>
            </div>
        </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P5.png" alt="" class="img-responsive">
                </div>
                <div class="text-desc">
					<h6>Activity</h6>
					<p>Title</p>   
                </div>
            </div>
        </div>
        <div class="clearfix"> </div>
</div>

</body>
</html>