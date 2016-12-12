<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<title>UserDetails</title>
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
String id = "";
String whether = "";
String zero = "0";
String one = "1";
if (cookies != null) {  
    for (Cookie c : cookies) {  
        if ("Email".equals(c.getName())) {  
            email = c.getValue();  
        }  
        if ("ACID".equals(c.getName())){
        	id = c.getValue();
        }
        if ("Whether".equals(c.getName())){
        	whether = c.getValue();
        }
    }  
}  
%>  
<script>
	window.onload=function(){
		var w = '<%=whether%>';
		var o = '<%=one%>';
		if (w == o){
			document.getElementById("111").style.display = "none";
		}else{
			document.getElementById("222").style.display = "none";
		}
	}
					
</script>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/activitymanagement"
     user="root"  password="fuyilei@96"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from activity where ID = <%= id %>;
</sql:query>

 <div class="header head1">
	<div class="container">
		<div class="head-top">
			<div class="logo">
				<a href="Home1.jsp"><img src="images/logo.png" alt="" title="Academic"></a>
			</div>
			<div class="login">
				<ul class="nav-login">
					<li><a href="#" data-toggle="modal" data-target="#myModal3">Help</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal4">Contact us</a></li>
					<li style="color:white;">Hello!<%= email %></li>
					<li><a href="LogOut?Email=<%=email%>">Logout</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
		<!-- login -->
			
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
								<li ><a href="Home1.jsp">Home</a></li>
								<li><a class="active" href="ViewAll1.jsp">ViewAll</a></li>
							</ul>
						</div><!-- /.navbar-collapse -->
					</div>
					
					<div class="clearfix"></div>
				</div> 
			</div> 
		</div> 
</div> 
<!-- about -->
<!-- about -->
<div class="about">
		<c:forEach var="row" items="${result.rows}">
				<div class="container">
				<div class="about-head">
					<h2><c:out value="${row.Title}"/>的详细信息</h2>
					<p> <c:out value="${row.Details}"/> <%=id %></p>
				</div>
					<div class="about-grids">
					<div class="col-md-5 about-grid1">
						
							<h3 >活动海报，规格要求为竖版</h3>
							<div class="about-img">
								<img src="images/aa.jpg" class="img-responsive" alt="">
							</div>							
						</div>
						<div class="col-md-7 about-grid">
							<h3></h3>
							<h5>此处给出活动的详细地点。</h5>
							<p><c:out value="${row.Site}"/></p>
							<div class="about-top">
								<div class="col-md-6 about-left">
									<h4>活动时间</h4>
									<p>日期：<c:out value="${row.Date}"/>时间：<c:out value="${row.Time}"/></p>
								</div>
								<div class="col-md-6 about-right">
								<h4>活动主办方</h4>
									<p><c:out value="${row.Holder}"/></p>
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
							<a href="javascript:history.back(-1)">返回上一页</a>
					</li>
						
							<li role="presentation" class="active" id="111">

								<a href="Like?userEmail=<%= email%>&activityID=<%=id%>">收藏</a>

							</li>
						<li role="presentation" class="active" id="222">

							<a>已收藏</a>
							</li>

						
					</ul>
				</div>
			</div>
		</div>
		</c:forEach>
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
<!---->
<!--footer-->
<div class="footer">
	<div class="container">
		<div class="col-md-6 footer-left">
			<h3>Information</h3>
			<p class="para">At vero eos et accusamus et iusto odio dignissimos
			ducimus qui blanditiis praesentium voluptatum deleniti at
			que corrupti quos dolores et quas molestias excepturi sint
			occaecati cupiditate non provident, similique sunt.</p>
			<h3>Newsletter<label></label></h3>
			<form action="#" method="post">
				<input type="text" value="Name" name="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
				<input type="email" value="Email" name="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
				<input type="submit" value="Submit">
			</form>
		</div>
		<div class="col-md-6 footer-right">
			<h3>Contact Us</h3>
			<ul class="con-icons">
				<li><span class="glyphicon glyphicon-phone" aria-hidden="true"></span>+123 456 7890</li>
				<li><a href="mailto:info@example.com"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>info@example.com</a></li>
			</ul>
			<p class="copy-right">Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!--//footer-->
</body>

</html>