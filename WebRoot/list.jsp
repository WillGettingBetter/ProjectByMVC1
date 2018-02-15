<%@page import="java.text.SimpleDateFormat"%>
<!-- 引入jstl标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.eec.entity.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 80%;
	margin: 0px auto;
	border: 1px solid green;
	border-collapse: collapse;
}

table tr td, th, caption {
	border: 1px solid green;
	padding: 15px;
}

.addEmployee {
	width: 78%;
	margin: 0px auto;
	text-align: right;
	padding: 20px;
}
</style>
</head>
<body>
	<h1>欢迎${sessionScope.CURRENT_USER.realName}登录</h1>
	<div class="addEmployee">
		<a href="departmentListServlet">新增雇员</a>
	</div>
	<table border="1">
		<caption>雇员信息列表</caption>
		<thead>
			<tr>
				<th>编号</th>
				<th>登录名</th>
				<th>密码</th>
				<th>姓名</th>
				<th>邮箱</th>
				<th>生日</th>
				<th>电话</th>
				<th>地址</th>
				<th>部门名称</th>
				<th>部门编号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.elist }" var="e">
				<tr>
					<td>${e.employeeId }</td>
					<td>${e.loginId }</td>
					<td>${e.loginPwd }</td>
					<td>${e.realName }</td>
					<td>${e.email }</td>
					<td><fmt:formatDate value="${e.birth}" pattern="yyyy-MM-dd" /></td>
					<td>${e.phone }</td>
					<td>${e.address }</td>
					<td>${e.deptName }</td>
					<td>${e.deptId }</td>
					<td><a
						href="javascript:onclick=del('${e.employeeId }','${e.realName }')">删除</a>
						<a href="to_update?employeeId=${e.employeeId }">更新</a></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="11" align="center"><a href="list?pageIndex=1">首页</a>|
					<a
					href="list?pageIndex=${requestScope.pageIndex-1 }<= 1
					? 1
					: ${requestScope.pageIndex-1 }%>">上一页</a>|
					<label>当前是第--${requestScope.pageIndex }--页 </label>| <%-- <a href="list?pageIndex=<%=Integer.parseInt(request.getAttribute("pageIndex").toString()) + 1 >= Integer.parseInt(request.getAttribute("pageCount").toString())? Integer.parseInt(request.getAttribute("pageCount").toString()): (Integer.parseInt(request.getAttribute("pageIndex").toString()) + 1)%>">下一页</a>| --%>
					<!-- 下一页新写法 --> <a
					href="javascript:onclick=nextPage(${requestScope.pageIndex+1 },${requestScope.pageCount })">下一页</a>|
					<a href="list?pageIndex=${requestScope.pageCount }">尾页</a></td>
			</tr>
		</tfoot>
	</table>
	<script type="text/javascript">
		function nextPage(pageIndex, pageCount) {
			if (pageIndex > pageCount) {
				alert("当前已经是最后一页，没有下一页了");
			} else {
				location.href = "list?pageIndex=" + pageIndex;
			}
		}
		function del(empId, empName) {
			var isDel = confirm("您确定要删除雇员【" + empName + "】的信息吗？");
			if (isDel) {
				location.href = "delemp?employeeId=" + empId;
			} else {
				alert("取消删除");
			}
		}
	</script>

</body>
</html>