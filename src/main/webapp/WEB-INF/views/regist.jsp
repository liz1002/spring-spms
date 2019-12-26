<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	})
</script>
</head>
<body>
	<form id="f1" action="regist" method="post">
		<fieldset>
			<legend>프로젝트 등록</legend>
			<p>
				<label>프로젝트 이름</label>
				<input type="text" name="name">
				<span class="error">프로젝트 이름을 입력하세요.</span>
			</p>
			<p>
				<label>프로젝트 내용</label>
				<textarea rows="10" cols="50" name="content"></textarea>
				<span class="error contentErr">프로젝트 내용을 입력하세요.</span>
			</p>
			<p>
				<label>시작 날짜</label>
				<input type="date" name="startdate" id="start">
				<span class="error">시작 날짜를 선택하세요.</span>
			</p>
			<p>
				<label>종료 날짜</label>
				<input type="date" name="enddate" id="end">
				<span class="error">종료 날짜를 선택하세요.</span>
				<span class="error dateErr">날짜를 확인하세요.</span>
			</p> 
			<p>
				<label>상태</label>
				<select name="progress">
					<option selected="selected"></option>
					<option>준비</option>
					<option>진행중</option>
					<option>종료</option>
					<option>보류</option>
				</select>
				<span class="error">진행 상태를 선택하세요.</span>
			</p>
			<p>
				<input type="submit" value="저장" class="btn">
				<input type="reset" value="취소" class="btn" id="reset">
			</p>
		</fieldset>
	</form>
</body>
</html>