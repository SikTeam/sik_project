<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nowpage" value="1" /> 
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }"/>
</c:if>

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
</head>
<body>
	<c:set var="nowpage" value="${ currentPage }"/>
	<div class="container-fluid">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<h1 align="center">${ listCount }개의브랜드list</h1>
		<hr>
		<c:forEach var="r" items="${ roll }">
			<c:if test="${ r.key eq 'Create' }">
				<c:set var="Create" value="${r.value }"></c:set>
			</c:if>
			<c:if test="${ r.key eq 'Update' }">
				<c:set var="Update" value="${r.value }"></c:set>
			</c:if>
			<c:if test="${ r.key eq 'Delete' }">
				<c:set var="Delete" value="${r.value }"></c:set>
			</c:if>
		</c:forEach>
		<table align="center" width="700" border="1" cellspacing="0"
			cellpadding="0">
			<tr>
				<th align="center">브랜드명</th>
				<th align="center">제목</th>
				<th align="center">작성자</th>
				<th align="center">작성일</th>
				<th align="center">삭제일</th>
				<th align="center">조회수</th>
			</tr>

			<c:forEach items="${ requestScope.list }" var="n">
				<tr>
					<td align="center">${ n.brandName }</td>
					<td><a href="noticeDetailView.do?noid=${ n.noId }&page=${nowpage}">${ n.noTitle }</a></td>
					<td>${ n.memberName }</td>
					<c:if test="${ n.noUdate eq null }">
					<td align="center"><fmt:formatDate value="${ n.noCdate }"
							pattern="yyyy-MM-dd" /></td>
					</c:if>
					<c:if test="${ n.noUdate ne null }">
					<td align="center"><fmt:formatDate value="${ n.noUdate }"
							pattern="yyyy-MM-dd" /></td>
					</c:if>
					<td align="center"><fmt:formatDate value="${ n.noDdate }"
							pattern="yyyy-MM-dd" /></td>
					<td align="center">${ n.noVcount }</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 검색폼 입력 -->
		<form id="titleform" class="sform" action="brandNoticeListView.do"
			method="post" align="center">
			<input type="hidden" name="page" value="${ nowpage }">

			<input type="hidden" name="action" value="title">
			<input type="hidden" name="board" value="${ board }">

			<select name="brand">
				<option value="all">모두</option>
				<c:forEach var="b" items="${ brandList }">
					<option value="${b.brandName }">${b.brandName }</option>
				</c:forEach>
			</select>
			<fieldset>
				<input type="search" name="keyword" size="50"> &nbsp; <input
					type="submit" value="검색">
			</fieldset>
		</form>
		<c:if test="${ Create eq 'Y' }">

			<button type="button" class="btn btn-dark" onclick="javascript:location.href='brandNoticeInsert.do?roll=${Create}&board=${ board }';">신규 작성</button>

		</c:if>
		<c:import url="/WEB-INF/views/common/pagingView.jsp" />
	</div>
</body>
</html>