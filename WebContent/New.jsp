<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>新建</title>
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
 <div class="header head1">
	<div class="container">
		<div class="head-top">
			<div class="logo">
				<a href="Home0.jsp"><img src="images/logo.png" alt="" title="Academic"></a>
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
								<li ><a class="active" href="Home2.jsp">返回 </a></li>
								
							
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
		<div class="alert alert-success" role="alert">
        	<strong name="AlertStr">${AlertStr}</strong>
      	</div>
			<form action="CreateActivity" method="post" onsubmit="return check(this)" enctype="multipart/form-data">
			<h2>创建活动</h2>
			<br><br><br><br><br><br>
			<h3>活动标题</h3>
			<input type="text" placeholder="title" name="title">
			<h3>活动日期和时间</h3>
			<input type="date" name="date" required min=<%= str %>>
			<input type="text" placeholder="time" name="time">(输入格式: HH:MM)
			<br><br>
			<h3>活动种类</h3>
			<input type="checkbox" name="tag" value="1"/>思想品德教育
			<input type="checkbox" name="tag" value="2"/>文化艺术
			<input type="checkbox" name="tag" value="3"/>课外学术科技
			<input type="checkbox" name="tag" value="4"/>体育
			<input type="checkbox" name="tag" value="5"/>社会实践
			<input type="checkbox" name="tag" value="6"/>创业
			<input type="checkbox" name="tag" value="7"/>志愿活动
			<br>请至少选择一个标签
			<br>
			<h3>活动地点</h3>
			<input type="text" placeholder="site" name="site"><br><br>
			<h3>活动细节</h3>
			<textarea name = "Details" rows="8" cols="95"></textarea><br><br>
			<h3>如果您有自己的海报，请上传</h3>
			<input type ="file" name = "file"style="border:1px white;color:white; background:white;height:40px;width:600px" ><br>只支持.jpg格式<br>
			<!-- input type="text" placeholder="Details" name="Details"-->
			<input type="hidden" name="holder" value=<%=email %>>
			<p><p><input type="reset" value="RESET">
			<input type="submit" value="CREATE">
			</form>
		</div>
	</div>
	</div>
		


</body>
</html>