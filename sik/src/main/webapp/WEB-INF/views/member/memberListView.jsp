<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식플루언서</title>
<style>
.content-area {
  display: flex;
  justify-content: center;
}
</style>
<script type="text/javascript" src="/first/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//input 태그의 name 이 item 의 값이 바뀌면(change) 작동되는 이벤트 핸들러 작성
	$('input[name=item]').on('change', function(){
		//여러 개의 태그 중에서 체크표시가 된 태그를 선택
		$('input[name=item]').each(function(index){
			//선택된 radio 순번대로 하나씩 checked 인지 확인함
			if($(this).is(':checked')){
			}else{
				//체크 표시 안된 아이템의 폼은 안 보이게 처리함
				$('form.sform').eq(index).css('display', 'none');
			}
		});  //each
	});  //on
});  //document ready
</script>

</head>
<body>
<div class="container-fluid">
   <c:import url="/WEB-INF/views/common/header.jsp"/>
   <%-- <%@ include file="../views/common/header.jsp" %> --%>
     <div class="row" style="margin-top:20px;">
<!-- 콘텐츠 영역 -->
<!-- 메인 1열 -->
       <div class="container-fluid pb-3" id="content-area"style="max-width: 100%; max-height: 100%;">
       <div class="d-grid gap-3" style="grid-template-columns: 0.3fr 1.4fr 0.3fr">
          <div class="bg-body-tertiary border rounded-3" style="visibility: hidden;">
            <br />
          </div>
          <div class="bg-body-tertiary border rounded-3">

          	<div class="table-responsive table-bordered" style="padding: 10px;">
				<table class="table table-hover border rounded-5">
					<a href="${ pageContext.servletContext.contextPath }/mlist.do?page=1">
					<h4 style="text-align: center; margin-top:10px; margin-bottom:15px;">
					직	원	조	회
					</h4></a>
				  <thead class="table-dark">
				    <tr>
				      <th scope="col">사번
				      	<div class="btn-group">
	  						<button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						      <span class="visually-hidden"></span>
						    </button>
						    <ul class="dropdown-menu">
						      <form class="d-flex" role="search" action="msearchMId.do" method="post">
						      	<input type="hidden" name="action" value="id">	
								<fieldset>
									<input class="form-control me-1" type="Search" placeholder="사번" aria-label="Search" name="keyword">
						        	<button class="btn btn-outline-success btn-sm" type="submit">검색</button>
								</fieldset>
						      </form>
						    </ul>
  					  	</div>
				      </th>
				      <th scope="col">이름
				      	<div class="btn-group">
	  						<button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						      <span class="visually-hidden"></span>
						    </button>
						    <ul class="dropdown-menu">
						      <form class="d-flex" role="search" action="msearchName.do" method="post">
						      	<input type="hidden" name="action" value="name">	
								<fieldset>
									<input class="form-control me-1" type="Search" placeholder="이름" aria-label="Search" name="keyword">
						        	<button class="btn btn-outline-success btn-sm" type="submit">검색</button>
								</fieldset>
						      </form>
						    </ul>
  					  	</div>
				      </th>
				      <th scope="col">패스워드</th>
				      <th scope="col">관리자여부</th>
				      <th scope="col">부서
				      	<div class="btn-group">
	  						<button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						      <span class="visually-hidden"></span>
						    </button>
						    <ul class="dropdown-menu">
						      <form class="d-flex" role="search" action="msearchDept.do" method="post">
					        	<input type="hidden" name="action" value="dept">	
								<fieldset>
									<input class="form-control me-1" type="search" placeholder="부서" aria-label="Search" name="keyword">
					        		<button class="btn btn-outline-success btn-sm" type="submit">검색</button>
								</fieldset>
						      </form>
						    </ul>
  					  	</div>
				      </th>
				      <th scope="col">직책
				      	<div class="btn-group">
	  						<button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						      <span class="visually-hidden"></span>
						    </button>
						    <ul class="dropdown-menu">
						      <form class="d-flex" role="search" action="msearchPosition.do" method="post">
						        <input type="hidden" name="action" value="position">	
								<fieldset>
						        	<input class="form-control me-1" type="search" placeholder="직책" aria-label="Search" name="keyword">
						        	<button class="btn btn-outline-success btn-sm" type="submit">검색</button>
								</fieldset>
						      </form>
						    </ul>
  					  	</div>
				      </th>
				      <th scope="col">입사일
					      <div class="btn-group">
	  						<button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						      <span class="visually-hidden"></span>
						    </button>
						    <ul class="dropdown-menu">
						      <form class="d-flex" role="search" action="msearchEnrollDate.do" method="post">
						        <input type="hidden" name="action" value="date">	
								<fieldset>
						          <input type="date" name="begin">~<input type="date" name="end"> &nbsp;
								  <button class="btn btn-outline-success btn-sm" type="submit">검색</button>
								</fieldset>
							  </form>
						    </ul>
	  					  </div>
					  </th>
				      <th scope="col">프로필사진</th>
				      <th scope="col">사인</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				  	<c:forEach items="${ requestScope.list }" var="m">
					    <tr>
					      <td>${ m.memberId }</td>
					      <td>${ m.memberName }</td>
					      <td>${ m.pw }</td>
					      <td style="text-align:center">${ m.adminYn }</td>
 					      <td>${ m.deptName }</td>
					      <td>${ m.positionName }</td>
					      <c:if test="${ m.enrollDate ne null }">
							<td><fmt:formatDate value="${ m.enrollDate }" pattern="yyyy-MM-dd" /></td>
						  </c:if>
					      <td>${ m.profileImage }</td>
					      <td>${ m.signImage }</td>
					    </tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
          </div>
          
          <div class="bg-body-tertiary border rounded-3" style="visibility: hidden;">
            <br />
          </div>
        </div>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />
        <br>
        <br>
        <br>
        <br>
<!-- 메인 2열 -->
         <div class="d-grid gap-3" style="grid-template-columns: 0.5fr 0.5fr 0.5fr">
          <div class="bg-body-tertiary border rounded-3" style="visibility: hidden;">
            <br />
          </div>
          <div class="bg-body-tertiary" style= "justify-self: center;">
             <img src = "/sik/resources/common/images/logo_dark.png" style="max-height:50px; background: white;"/>
          </div>
          <div class="bg-body-tertiary border rounded-3" style="visibility: hidden;">
            <br />
          </div>
        </div> 
      </div>
      </div>
    </div>
    

</body>
</html>