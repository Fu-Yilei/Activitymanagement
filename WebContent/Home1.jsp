
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<meta charset="gb2312"/>
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

<script type="text/javascript">
function count_down(o,id){
        var datatime=/^[\d]{4}-[\d]{1,2}-[\d]{1,2}( [\d]{1,2}:[\d]{1,2}(:[\d]{1,2})?)?$/ig,str='',conn,s;
        if(!o.match(datatime)){
                alert('参数格式为2020-01-01[ 01:01[:01]].\r其中[]内的内容可省略');
                return false;
        }
        var sec=(new Date(o.replace(/-/ig,'/')).getTime() - new Date().getTime())/1000;
        if(sec > 0){
                conn='还有';
        }else{
                conn='已过去';
                sec*=-1;
        }
        s={'天':sec/24/3600,'小时':sec/3600%24};
        for(i in s){
                if(Math.floor(s[i])>0 ) str += Math.floor(s[i]) + i;
        }
        if(Math.floor(sec)==0){ str='0秒'; }
        document.getElementById(id).innerHTML = conn +'<u>' + str + '</u>' + "举行";
        setTimeout(function(){count_down(o)},1000);
     //   return '距离<u>' + o + '</u>' + conn +'<u>' + str + '</u>';
}

</script>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/activitymanagement"
     user="root"  password="fuyilei@96"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * 
from activity where ID in (select ActivityID from userlike where Email = "<%=email %>");
</sql:query>

<sql:query dataSource="${snapshot}" var="result1">
SELECT * 
from activity where ID in (select ActivityID from tmprectable where Email = "<%=email %>");
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
			
			<!--  Exit -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabe4">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
							
									<div class="login-right">
										<h3>Really want to quit in your name?</h3>
										<h3>Then will jump to the home page!</h3>
										<li><a href="Home0.jsp">Exit</a></li>
									</div>
									
								<p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //Exit -->
			
			

		
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
								<li><a class="active" href="Home1.jsp">Home</a></li>
								<li><a href="ViewAll1.jsp">ViewAll</a></li>
								<li ><a href="Search1.jsp">Search</a></li>
							
							</ul>
						</div><!-- /.navbar-collapse -->
					</div>
					
					<div class="clearfix"></div>
				</div> 
			</div> 
		</div> 
</div> 

<div class="about">
<div class = "container">
<div class = "page">
	<div class="page-header">
        <h3><%= email %>收藏的活动</h3>
    </div>
<table class="table">
	<thead>
		<tr>
			<th>活动标题</th>
			<th>活动日期</th>
			<th>活动时间</th>
			<th>活动地点</th>
			<th>活动内容</th>
			<th>主办方</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${result.rows}">
		<tr>
			<td><c:out value="${row.Title}"/></td>
			<td><c:out value="${row.Date}"/></td>
			<td><c:out value="${row.Time}"/></td>
			<td><c:out value="${row.Site}"/></td>
			<td><c:out value="${row.Details}"/></td>
			<td><c:out value="${row.Holder}"/></td>
			<td><span id="${row.ID }"><script>count_down('${row.Date}','${row.ID}')</script></span></td>
			
			<td><a href="DontLike?delID=${row.ID}&delUser='<%= email %>'"><button type="button" class="btn btn-sm btn-default">取消收藏</button></a></td>
		
		</tr>
	</c:forEach>
	</tbody>
</table>

</div>
</div>
</div>
<p>您可能喜欢：</p>

	<c:forEach var="r" items="${result1.rows}">
  			<a href="ToDetail1?ID=${r.ID}&Email=<%=email %>">
  					<c:out value="${r.Title}"/>
  			</a><br>
  	
  						

	</c:forEach>
</body>
</html>