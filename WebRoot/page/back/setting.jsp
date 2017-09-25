<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="page/js/jquery-3.2.1.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="/zdnet/page/bootstrap/css/bootstrap.min.css"/>
  	<link rel="stylesheet" type="text/css" href="/zdnet/page/css/info.css"/>
  	<script type="text/javascript" src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
<script type="text/javascript">
    	function ondelete(aid){
   			if(confirm("确定要删除该条目？")){
	   			location.replace("/zdnet/delAdmin.action?aid="+aid);
   			}
   		}
   		
   	</script>
<style type="text/css">
body {
	text-align: center;
	margin: 0;
}

table {
	width: 70%;
}

td, th {
	max-width: 10%;
	font-size: 10pt;
	text-align: center;
}

a {
	height: 30px;
}
.input-group{
	margin:5px auto;
	width:70%;
}
</style>
</head>

<body>
<body>
	<div class="panel panel-primary"
		style="margin-top:20px;margin-right:10px;">
		<div class="panel-heading">所有管理员</div>
		<table class="table table-hover ">
			<tr>
				<th>编号</th>
				<th>管理员账号</th>
				<th>管理员密码</th>
				<th>管理员真实姓名</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${allAdmins }" var="a">
				<tr>
					<td>${a.aid }</td>
					<td>${a.account }</td>
					<td>${a.apassword }</td>
					<td>${a.arealname }</td>
					<td><a href="#" onclick="ondelete(${a.aid })"><span
							class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td>
					<a href="javascript:void(0)" class="btn btn-primary" data-toggle="modal" data-target="#Modal">新增</a>
				</td>
			</tr>
		</table>
		<br>
		<div class="panel-footer"></div>
	</div>
<div class="modal fade" id="Modal">  
    <div class="modal-dialog" style="width: 40%;">  
        <div class="modal-content">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                    <span aria-hidden="true">×</span>  
                </button>  
                <h4 class="modal-title" id="myModalLabel">新增管理员</h4>  
            </div> 
	<form onsubmit="" action="/zdnet/insertAdmin.action" method="post">
		<div class="form-group">
			<br>
			<div class="input-group">
 				<span class="input-group-addon" id="basic-addon1">编号</span>
  				<input type="text" class="form-control" placeholder="自动生成" disabled="disabled""basic-addon1">
			</div>
		</div>
		<div class="form-group">
			<div class="input-group">
 				<span class="input-group-addon" id="basic-addon1">账号</span>
  				<input type="text" class="form-control"name="account" aria-describedby="basic-addon1">
			</div>
			
		</div>
		<div class="form-group">
			<div class="input-group">
 				<span class="input-group-addon" id="basic-addon1">密码</span>
  				<input type="text" class="form-control" name="apassword"aria-describedby="basic-addon1">
			</div>
			
		</div>
		<div class="form-group">
			<div class="input-group">
 				<span class="input-group-addon" id="basic-addon1">真实姓名</span>
  				<input type="text" class="form-control" name="arealname" aria-describedby="basic-addon1">
			</div>
			
		</div>

		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<input type="submit" class="btn btn-primary" value="提交"></input>
		</div>
		
	</form>
	</div>
	</div>
	</div>
</body>
</html>
