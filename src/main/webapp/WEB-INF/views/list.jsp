<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		width: 500px;
		margin: 30px auto;
		text-align: center;
	}
	table{
		width: 100%;
	}
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
		margin: 0 auto;
	}
	a{
		text-decoration: none;
		color: black;
	}
	p{
		overflow: hidden;
	}
	p>a{
		background: #ccc;
		color: #fff;
		border: 1px solid #ccc;
		padding: 0px 5px;
		font-size: 14px;
		float: right;
	}
	a:hover {
		font-weight: bold;
	}
	ul#btnPage{
		width: 100%;
		list-style: none;
		text-align: center;
		padding: 0;
	}
	li{
		display: inline-block;
		border: 1px solid #ccc;
		width: 25px;
		height: 25px;
		margin: 5px;
	}
	li.active{
		background: #ccc;
	}
</style>
</head>
<body>
	<div>
		<h1>프로젝트 목록</h1>
		<p>
			<a href="regist">새 프로젝트 등록</a>
		</p>
		<table>
			<tr>
				<th>번호</th>
				<th>프로젝트 이름</th>
				<th>시작 날짜</th>
				<th>종료 날짜</th>
				<th>상태</th>
			</tr>
			
			<c:forEach var="spms" items="${list}">
				<tr>
					<td>${spms.no}</td>
					<td><a href="read?no=${spms.no}&page=${pageMaker.cri.page}">${spms.name}</a></td>
					<fmt:formatDate var="startdate" value="${spms.startdate}" pattern="yyyy-MM-dd"/>
					<td>${startdate}</td>
					<fmt:formatDate var="enddate" value="${spms.enddate}" pattern="yyyy-MM-dd"/>
					<td>${enddate}</td>
					<td>${spms.progress}</td>
				</tr>
			</c:forEach>
		</table>
		
		<ul id="btnPage">
			<c:if test="${pageMaker.prev == true}">
				<li><a href="list?page=1">&ltrif;</a></li>
				<li><a href="list?page=${pageMaker.startPage-1}">&ltri;</a></li>
			</c:if> 
			<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li ${idx == pageMaker.cri.page ? 'class=active' : ''}> <!-- pageMaker.cri.page : 현재 페이지 번호 -->
					<a href="list?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next == true}">
				<li><a href="list?page=${pageMaker.endPage+1}">&rtri;</a></li>
				<li><a href="list?page=${pageMaker.lastPage}">&rtrif;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>