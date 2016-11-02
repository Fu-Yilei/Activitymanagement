<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
button.blue {
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

button.blue:active {
			-webkit-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			-moz-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			position: relative;
			top: 6px;
}


a.blue {
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

a.blue:active {
			-webkit-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			-moz-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
			position: relative;
			top: 6px;
}
</style>
<head>
		<link href = "CSS/style.css" rel="stylesheet"  type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Fancy 3D-Button" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" /> 
        <!-- ink rel="stylesheet" type="text/css" href="http://www.cssmoban.com/statics/css/code-demo.css" /-->
		
		<!-- WEB字体调用 -->
		<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:700' rel='stylesheet' type='text/css'>
	<title>Welcome!</title>
</head>
	<body style="background:url('Backgrounds/bg5.jpg')">
	<object height="0" width="0" data="1.mp3"></object>
		<h1 style="position:absolute; left:350px; top:10px; color:Blue;" >WELCOME TO BOOK SEARCH SYSTEM!</h1>
		<a href=".//AuthorSearch.jsp" class="blue" style="position:absolute; left:40px; top:100px;">Author Search</a>
		<form action = "listbooks" method = "post">
			<button type = "submit"  class="blue" style="position:absolute; left:900px; top:100px;">View All Books</button>
		</form>
		<h3 style="position:absolute; left:40px; top:900px;">Presented By Fu Yilei</h3>
	</body>
</html>