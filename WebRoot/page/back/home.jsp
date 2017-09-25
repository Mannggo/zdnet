<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/zdnet/page/bootstrap/css/bootstrap.min.css" />
</head>

<body>
	<div class="page-header">
		<h1>
			Hello! <small>${admin.arealname }</small>
		</h1>
	</div>
</body>
</html>
