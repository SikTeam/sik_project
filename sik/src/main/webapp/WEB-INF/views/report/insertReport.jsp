<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/sik/resources/common/js/jquery-3.7.0.min.js"></script>
<script type='text/javascript'>
$(document).ready(function() {
    $('#dept, #position').change(function() {
        $.ajax({
            url: 'addApprover.do',
            type: 'post',
            dataType: 'json',
            data: { dept: dept, position: position },
            success: function(data) {
            	console.log(data);
            	
            	var dataStr = JSON.stringify(data);
            	var jsonObj = JSON.parse(dataStr);
            	
            	var output = $('#name').html();
                
                for(var i in jsonObj.list){
                	output +='<option value="' + jsonObj.list[i].memberName + '">' + jsonObj.list[i].memberName + '</option>';
                }
                
                $('#name').html(output);
            },
            error : function(request, status, errorData){
                connsole.log("error code : " + request.status + "\nMessage : " + request.responseText 
                + "\nError : " + errorData);
             }
        });
    });
});
</script>

</head>

<body>
	<div class="container-fluid">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div class="row" style="margin-top: 20px;">
			<!-- 콘텐츠 영역 -->
			<div class="table-responsive table-bordered" style="padding: 10px;">
				<div class="d-grid gap-3"
					style="grid-template-columns: 0.4fr 0.6fr 0.4fr">
					<div class="bg-body-tertiary border rounded-3"
						style="visibility: hidden;">
						<br />
					</div>
					<div class="container mt-4">
						<form action="insertReport.do" method="POST"
							enctype='multipart/form-data'>
							<div class="mb-3">
								<div>
									결재자 정보 등록<br>
									<hr>
									<select id="dept" class="btn btn-secondary btn-sm dropdown-toggle">
									    <option class="dropdown-item" value="부서">부서</option>
									  	<option class="dropdown-item" value="가맹관리팀">가맹관리팀</option>
									  	<option class="dropdown-item" value="물류팀">물류팀</option>
									  	<option class="dropdown-item" value="메뉴개발팀">메뉴개발팀</option>
									  	<option class="dropdown-item" value="가맹영업팀">가맹영업팀</option>
									  	<option class="dropdown-item" value="상품관리팀">상품관리팀</option>
									  	<option class="dropdown-item" value="광고기획팀">광고기획팀</option>
									  	<option class="dropdown-item" value="대표이사">대표이사</option>
									 </select>
									<select id="position" class="btn btn-secondary btn-sm dropdown-toggle">
									    <option class="dropdown-item" value="직급">직급</option>
									  	<option class="dropdown-item" value="사원">사원</option>
									  	<option class="dropdown-item" value="대리">대리</option>
									  	<option class="dropdown-item" value="주임">주임</option>
									  	<option class="dropdown-item" value="과장">과장</option>
									  	<option class="dropdown-item" value="팀장">팀장</option>
									  	<option class="dropdown-item" value="대표이사">대표이사</option>
									 </select>
									 <select id="name" class="btn btn-secondary btn-sm dropdown-toggle">
										    <!-- 옵션을 생성하는 영역 ★ -->
									</select>
																 
									</form>
									<button>+</button>				
								</div>
								<hr>

								<br> <br>
								<div>
									<span>Date: 2023 - 10 - 15 &nbsp&nbsp&nbsp&nbsp&nbsp</span> <span>보고서
										번호 : ${ reportId }</span>
								</div>
								<br> <br> <label for="proposalTitle"
									class="form-label">제목</label> <input type="text"
									class="form-control" id="proposalTitle" name="title" required>


								<div class='mb - 3'>
									<label for='proposalContent' class='form-label'>내용 : </label>
									<textarea rows=10 cols=30 wrap=hard id='proposalContent'
										name='content' class='form-control'></textarea>
								</div>

								파일 첨부 :
								<div class='mb-3'>
									<input type='file' id='fileUpload' name='fileUpload' />
								</div>

								<button type="submit" class="btn btn-primary">등록</button>
						</form>
					</div>
					<div class="bg-body-tertiary border rounded-3"
						style="visibility: hidden;">
						<br />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>