<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>


<div class="container">

<div class="path" style="display: block; float: right; position: relative; height: auto;">
	<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home > </a></li>
		<li style="display: inline;"><a href="${pageContext.request.contextPath}/member/memberLogin">로그인 > </a></li>
		<li style="display: inline;" title="현재 위치"><strong>아이디 찾기</strong></li>
	</ol>
</div>


<div style="margin-top: 100px; text-align: center; border: 1px solid red; display: block; border-bottom: 3px solid black;">
<h1 style=" margin-top: 50px; font-weight: bold; font-size: 36px; margin-bottom: 15px;">아이디 찾기</h1>
</div>
<div style="border: 1px solid #d7d5d5; height: 400px;">
<div style="border: 1px solid black; width: 400px; height:100%; margin: 0 auto; text-align: center;">
	<i class='fas fa-paw' style="font-size: 36px; margin-top: 30px;" ></i>
	<div class="contensts" style="margin-top: 10px;">
	<p>${user.name} 고객님의 <br>
	아이디를 찾았습니다!</p>
	<span style="margin-bottom: 30px;">${user.id}</span>
	</div>
	
	<button id="find_btn" class="btn btn-info" style="background-color: #FF324D; border: none; width: 300px; margin-top: 10px;" onclick="login()">로그인하기</button>
	
	<div style="margin-top: 10px; font-size: small;">
		<p style="display: inline;">비밀번호도 찾으시나요? </p>
		<a href="${pageContext.request.contextPath}/member/memberJoin">비밀번호 찾기</a> 
	</div>
</div>
	

</div>

</div>

<script type="text/javascript">

function login() {
	location.href="./memberLogin";
};




</script>

</body>
</html>