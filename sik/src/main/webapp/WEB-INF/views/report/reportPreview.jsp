<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.custom-table{
    font-size: 14px;
}
</style>
</head>
<body>
<div class="table-responsive table-bordered" style="padding: 10px;">
<table class="table custom-table table-hover border rounded-5">
	<a href="${ pageContext.servletContext.contextPath }/reportList.do">
	<h6 style="text-align: center; margin-top:10px; margin-bottom:15px;">
	결&nbsp&nbsp&nbsp&nbsp&nbsp재
	</h6></a>
  <thead class="table-dark">
    <tr>
      <th scope="col">No</th>
      <th scope="col">제 목</th>
      <th scope="col">처리상태</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">1</th>
      <td>계육 발주관련 보고</td>
      <td>미결재</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>브랜드 홍보 계획안</td>
      <td>미결재</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>신입직원 채용의 건</td>
      <td>결재완료</td>
    </tr>
    <tr>
      <th scope="row">4</th>
      <td>조류독감 관련 지역분포 및 발주관련의 건</td>
      <td>결재완료</td>
    </tr>
    <tr>
      <th scope="row">5</th>
      <td>사장 탄핵의 건</td>
      <td>결재완료</td>
    </tr>
    <tr>
    <th scope="row">6</th>
      <td>경력직 개발자 선발의 건</td>
      <td>결재완료</td>
    </tr>
    <th scope="row">7</th>
      <td>test sample</td>
      <td>미결재</td>
    </tr>
    <th scope="row">8</th>
      <td>test sample</td>
      <td>미결재</td>
    </tr>
    <th scope="row">9</th>
      <td>test sample</td>
      <td>미결재</td>
    </tr>
    <th scope="row">10</th>
      <td>test sample</td>
      <td>미결재</td>
    </tr>
  </tbody>
</table>
</div>
</body>
</html>