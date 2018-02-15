<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.eec.entity.Employee"%>
<%@page import="com.eec.entity.Department"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
table {
	width: 500px;
	height: 400px;
	text-align: center;
	border: 1px solid red;
	margin: 0 auto;
	border-collapse: collapse;
	border: 1px solid red;
}

table tr td {
	border: 1px solid red;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<form action="do_update" method="post">
		<table>
			<caption>新增雇员</caption>
			<tr>
				<td>登录名</td>
				<input type="hidden" name="employeeId" value="${emp.employeeId}" />
				<td><input type="text" name="loginId" value="${emp.loginId}" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="text" name="loginPwd" value="${emp.loginPwd}" /></td>
			</tr>
			<tr>
				<td>生日</td>
				<td><input type="text" name="birth"
					value="<fmt:formatDate value="${emp.birth}"
						pattern="yyyy-MM-dd" type="both" />"
					onclick="WdatePicker({isShowWeek:true})" /></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input type="text" name="email" value="${emp.email }" /></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input type="text" name="realName" value="${emp.realName }" /></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input type="text" name="phone" value="${emp.phone }" /></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="address" value="${emp.address }" /></td>
			</tr>
			<tr>
				<td>所属部门</td>
				<td><select name="deptId">
						<!-- c:forEach是jstl标签，${requestScope.dList }是el表达式 -->
						<c:forEach items="${requestScope.dList }" var="e">
							<option
								<c:if test="${e.deptId eq emp.deptId }">
							selected="selected"</c:if>
								value="${e.deptId }">${e.deptName }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="更新" /></td>
			</tr>
		</table>
	</form>
</body>
</html>