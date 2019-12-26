<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	fieldset{
		width: 500px;
		margin: 30px auto;
		padding: 0 20px;
	}
	legend{
		font-size: 18px;
		font-weight: bold;
	}
	p{
		overflow: hidden;
	}
	label{
		width: 110px;
		float: left;
		text-align: right;
		margin-right: 20px;
	}
	textarea{
		margin-left: 130px;
	}
	span.contentErr{
		margin-left: 130px;
	}
	span.error{
		color: red;
		font-size: 10px;
		display: none;
	}
	span.notMatch{
	 	color: red;
		font-size: 10px;
	}
	p:last-child {
		text-align: center;
		margin-top: 50px;
	}
	input.btn{
		font-size: 14px;
		background: #ccc;
		color: #fff;
		border: 1px solid #ccc;
		padding: 5px;
	}
	input.btn:hover {
		text-shadow: 1px 1px 1px #ccc;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
	$(function() {
		$("#f1").submit(function() {
			var result = checkInputEmpty($("input[name], textarea, select"));
			
			/* 날짜 확인 */
			var startVal = $("#start").val();
			var endVal = $("#end").val();
			
			var sYear = startVal.substring(0,4);
			var sMonth = startVal.substring(5,7);
			var sDay = startVal.substring(8,10);
			var startDate = new Date(sYear, sMonth-1, sDay);
			
			var eYear = endVal.substring(0,4);
			var eMonth = endVal.substring(5,7);
			var eDay = endVal.substring(8,10);
			var endDate = new Date(eYear, eMonth-1, eDay);

			if(endDate < startDate){
				$(".dateErr").css("display", "inline");
				result = false;
			}
			
			/* 최종 결과 */
			if(result == false){
				return false;
			}
		})
		
		$("#reset").click(function() {
			history.back();
		})
		
 		var progress = "${vo.progress}";
		$("select").val(progress).attr("selected", "selected");
	})
</script>
</head>
<body>
	<form id="f1" action="modify" method="post">
		<fieldset>
			<legend>프로젝트 수정</legend>
			<input type="hidden" name="no" value="${vo.no}">
			<input type="hidden" name="page" value="${cri.page}">
			<p>
				<label>프로젝트 이름</label>
				<input type="text" name="name" value="${vo.name}">
				<span class="error">프로젝트 이름을 입력하세요.</span>
			</p>
			<p>
				<label>프로젝트 내용</label>
				<textarea rows="10" cols="50" name="content">${vo.content}</textarea>
				<span class="error contentErr">프로젝트 내용을 입력하세요.</span>
			</p>
			<p>
				<label>시작 날짜</label>
				<fmt:formatDate var="startdate" value="${vo.startdate}" pattern="yyyy-MM-dd"/>
				<input type="date" name="startdate" value="${startdate}" id="start">
				<span class="error">시작 날짜를 선택하세요.</span>
			</p>
			<p>
				<label>종료 날짜</label>
				<fmt:formatDate var="enddate" value="${vo.enddate}" pattern="yyyy-MM-dd"/>
				<input type="date" name="enddate" value="${enddate}" id="end">
				<span class="error">종료 날짜를 선택하세요.</span>
				<span class="error dateErr">날짜를 확인하세요.</span>
			</p>
			<p>
				<label>상태</label>
				<select name="progress">
					<option>준비</option>
					<option>진행중</option>
					<option>종료</option>
					<option>보류</option>
				</select>
			</p>
			<p>
				<input type="submit" value="수정" class="btn">
				<input type="button" value="취소" class="btn" id="reset">
			</p>
		</fieldset>
	</form>
</body>
</html>