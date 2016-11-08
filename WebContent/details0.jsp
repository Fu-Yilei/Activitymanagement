<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Details</title>
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
 <div class="header head1">
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
										<form action="#" method="post">
											<h3>Signin with your account </h3>
											<input type="text" value="Enter your Email" name=" Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Enter your Email';}" required="">	
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
										<form action="SignUp" method="post">
											<h3>Create your account </h3>
											<input type="text" value="Name" name="Name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}" required="">	
											<input type="password" value="Password" name="Password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Password';}" required="">	
											<input type="radio" value="normal" name="Usertype">User
											<input type="radio" value="holder" name="Usertype">Holder
											<input type="submit" value="CREATE ACCOUNT" >
										</form>
									</div>
								
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //signup -->
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
</div> 
<!-- about -->
<div class="about">
				<div class="container">
				<div class="about-head">
					<h2>XXX活动的详细信息</h2>
					<p> 此处按照模板给出详细的信息</p>
				</div>
					<div class="about-grids">
					<div class="col-md-5 about-grid1">
						
							<h3 >活动海报，规格要求为竖版</h3>
							<div class="about-img">
								<img src="images/aa.jpg" class="img-responsive" alt="">
							</div>							
						</div>
						<div class="col-md-7 about-grid">
							<h3>活动地点</h3>
							<h5>此处给出活动的详细地点。</h5>
							<p></p>
							<div class="about-top">
								<div class="col-md-6 about-left">
									<h4>活动时间</h4>
									<p>此处给出活动的详细时间</p>
								</div>
								<div class="col-md-6 about-right">
								<h4>活动主办方</h4>
									<p>此处给出活动的主办方</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="about-top">
								<div class="col-md-6 about-left">
									<h4>其他信息</h4>
									<p>给出活动的其他信息，例如：讲座的演讲者信息等。</p>
								</div>
								<div class="col-md-6 about-right">
								<div class="clearfix"></div>
							</div>
						</div>
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="about-grids">
				<div class="page-header ">
					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active">
							<a href = "ViewAll0.jsp">返回</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
</div>
<div class="content-bottom">
	<h1>Gallery</h1>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                   <img src="images/P1.png" alt="" class="img-responsive">
               </div>
                <div class="text-desc">
					<h6>随机活动</h6>
					<p>随机活动的标题</p>   
                </div>
           </div>
         </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P2.png" alt="" class="img-responsive">
                </div>
				<div class="text-desc">
					<h6>随机活动</h6>
					<p>随机活动的标题</p>   
                </div>
            </div>
        </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P3.png" alt="" class="img-responsive">
                </div>
				<div class="text-desc">
					<h6>随机活动</h6>
					<p>随机活动的标题</p>   	
				</div>
			</div>
        </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P4.png" alt="" class="img-responsive">
                </div>
                <div class="text-desc">
					<h6>随机活动</h6>
					<p>随机活动的标题</p>   
                </div>
            </div>
        </div>
		<div class="content-in">
            <div class="port effect-1">
                <div class="image-box">
                    <img src="images/P5.png" alt="" class="img-responsive">
                </div>
                <div class="text-desc">
					<h6>随机活动</h6>
					<p>随机活动的标题</p>   
                </div>
            </div>
        </div>
        <div class="clearfix"> </div>
</div>

</body>
</html>