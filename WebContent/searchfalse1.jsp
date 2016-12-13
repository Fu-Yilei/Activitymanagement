<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>

<title>无结果</title>
<% String url=request.getHeader("Referer"); 
System.out.println(url);
%>
<META HTTP-EQUIV="Refresh" CONTENT="5; URL=http://localhost:8080/ActivityManagement/Search1.jsp ">
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
<style> 
a:link {color: #FFFFFF}	
a:visited {color: #FF66CC}	
a:hover {color: #FFFF33}	
a:active {color: #0000FF}	
</style>
</head>
<body>
<%  
Cookie[] cookies = request.getCookies();  
String email = "";  
String id = "";
String title="";
if (cookies != null) {  
    for (Cookie c : cookies) {  
        if ("Email".equals(c.getName())) {  
            email = c.getValue();  
        }  
        if ("ACID".equals(c.getName())){
        	id = c.getValue();
        }
        if ("ACTITLE".equals(c.getName())){
        	title=c.getValue();
        }
    }  
}
%>  




 <div class="header head1">
	<div class="container">
		<div class="head-top">
			<div class="logo">
				<a href="Home1.jsp"><img src="images/logo.png" alt="" title="Academic"></a>
			</div>
			<div class="login">
				<ul class="nav-login">
					<li><a href="#" data-toggle="modal" data-target="#myModal3">帮助</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal4">联系我们</a></li>
					<li style="color:white;"><%= email %>您好！</li>
					<li><a href="Home0.jsp">登出</a></li>
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
								
								<li><a href="javascript:history.back(-1)">返回</a></li>
							</ul>
						</div><!-- /.navbar-collapse -->
					</div>
					<!-- start search-->
				<!-- 	<ul class="social-ic">
						<li><a href="#"><i></i></a></li>
						<li><a href="#"><i class="ic"></i></a></li>
						<li><a href="#"><i class="ic1"></i></a></li>
						<li><a href="#"><i class="ic2"></i></a></li>
					</ul> -->
					<div class="clearfix"></div>
				</div> 
			</div> 
		</div> 
</div> 



<table align=center border=0 >
    <tr>
      <td style="FILTER: glow(strength=4)mask(color=#E1E4EC)" height=109 align="center" valign="middle"><font face="Verdana" color="#8C96B5" 

size="5">
      <b><i>并没有符合查询条件的结果</i></b></font></td>
    </tr>
 </table>




<table >
    <tr>
      <td style="FILTER: glow(strength=4)mask(color=#E1E4EC)" height=109 align="center" valign="middle"><font face="Verdana" color="#8C96B5" 

size="4">
      <b><i>5秒后自动返回上衣用户界面或手动点击Back按键.........</i></b></font></td>
    </tr>
 </table>



</body>
</html>