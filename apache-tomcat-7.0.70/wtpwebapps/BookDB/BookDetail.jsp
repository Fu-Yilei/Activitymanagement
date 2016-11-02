<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.blue {
			position: relative;
			color: rgba(255,255,255,1);
			text-decoration: none;
			background-color: rgba(100,87,200,1);
			font-family: 'Yanone Kaffeesatz';
			font-weight: 700;
			font-size: 3em;
			display: block;
			padding: 4px;
			-webkit-border-radius: 8px;
			-moz-border-radius: 8px;
			border-radius: 8px;
			-webkit-box-shadow: 0px 9px 0px rgba(100,87,100,1), 0px 9px 25px rgba(0,0,0,.7);
			-moz-box-shadow: 0px 9px 0px rgba(100,87,100,1), 0px 9px 25px rgba(0,0,0,.7);
			box-shadow: 0px 9px 0px rgba(100,87,100,1), 0px 9px 25px rgba(0,0,0,.7);
			margin: 100px auto;
			width: 320px;
			text-align: center;
			
			-webkit-transition: all .1s ease;
			-moz-transition: all .1s ease;
			-ms-transition: all .1s ease;
			-o-transition: all .1s ease;
			transition: all .1s ease;
}

.blue:active {
			-webkit-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			-moz-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			position: relative;
			top: 6px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:url('Backgrounds/bg5.jpg')">
<object height="0" width="0" data="1.mp3"></object>

	<p style= "font-family:Georgia; height: 20px; left: 100px; position:absolute; color : blue;"><s:iterator value = "Bk" var = "b">
		<br>ISBN:			${Bk.book_ISBN}
		<br>Title:			${Bk.book_Title}
		<br>Publisher:		${Bk.book_Publisher}
		<br>PublishDate:	${Bk.book_PublishDate}
		<br>Price:			${Bk.book_Price}
		<br>AuthorID:		${Bk.book_AuthorID}
	</s:iterator></p>
		<a href=".//WelcomeView.jsp" class="blue" style="position:absolute; left:200px; top:500px;">Home Page</a>
</body>
</html>