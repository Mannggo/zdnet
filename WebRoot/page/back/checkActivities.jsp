<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'showAllActivities.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="/zdnet/page/bootstrap/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
   	<script type="text/javascript">
   		function ondelete(aid,uemail,aname){
   			if(confirm("是否确定删除该活动？")){
	   			location.replace("/zdnet/delActivity.action?aid="+aid+"&uemail="+uemail+"&aname="+aname);
   			
   			}
   		}
   		function onpass(aid,uemail,aname){
   			if(confirm("是否确定通过该活动？")){
	   			location.replace("/zdnet/passActivity.action?aid="+aid+"&uemail="+uemail+"&aname="+aname);
   			
   			}
   		}
   		
   		
   		
   	</script>
	<style type="text/css">
		body{
			text-align:center;
			margin:0;
		}
		table{
			width:70%;
			table-layout: fixed;
		}
		
		td,th{
			max-width: 10%;
			font-size:10pt;
			text-align:center;
			white-space:nowrap;
			overflow:hidden;
			text-overflow: ellipsis;
		}
		a{
			height:30px;
		}
	</style>
  </head>
  
  <body>
  	
  	<div class="panel panel-primary" style="margin-top:20px;margin-right:10px;">
  	<div class="panel-heading">未审核记录，总记录数:<span id="count">${count }</span></div>
  	<table class="table table-hover " >
  		<tr>
  			<th>编号</th>
  			<th>活动名称</th>
  			<th>组织单位</th>
  			<th>发起者邮箱</th>
  			<th>人数限制</th>
  			<th>活动时间</th>
  			<th>活动地点</th>
  			<th>活动描述</th>
  			<th>审核操作</th>
  			
  		</tr>
	    <c:forEach items="${passActs }" var="act">
	    	<tr>
	  			<td>${act.aid }</td>
	  			<td>${act.aname }</td>
	  			<td>${act.aunit }</td>
	  			<td>${act.uemail }</td>
	  			<td>${act.apersonlimit }</td>
	  			<td>${act.aholdDate.toLocaleString() }</td>
	  			<td>${act.aholdPlace }</td>
	  			<td>${act.aintroduction }</td>
	  			
	  			<td>
	  				<a href="#" onclick="onpass(${act.aid },'${act.uemail }','${act.aname }')"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>通过</a>
	  				<a href="#" onclick="ondelete(${act.aid },'${act.uemail }','${act.aname }')"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>不通过</a>
	  			</td>
  			</tr>
	    </c:forEach>
    </table>
    <br>
    </div>
  </body>
</html>
