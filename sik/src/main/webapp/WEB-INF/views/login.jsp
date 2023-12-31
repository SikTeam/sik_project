<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginCheckVar" value="fcLogin" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>sik</title>
<script type="text/javascript"
	src="/sik/resources/js/jquery-3.7.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<link href="/sik/resources/common/css/login.css" rel="stylesheet">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<div class="wrapper">
		<div class="content"
			style="display: flex; flex-direction: column; align-items: center;">
			<div>
				<img src="/sik/resources/common/images/logo_dark.png" height="100"
					width="200" style="margin-bottom: 50px;">
			</div>
			<form action="loginCheck.do" method="post">
				<select id="check" name="logincheck">
					<option value="login">본사</option>
					<option value="fcLogin">가맹점</option>
				</select> <input class="form-control" name="memberId" type="text"
					placeholder="ID" aria-label="default input example"> <input
					type="password" name="pw" placeholder="PASSWORD"
					class="form-control" aria-describedby="passwordHelpBlock"
					style="margin-top: 10px; margin-bottom: 20px;">
				<div class="container text-center">
					<div class="row">
						<div class="col">
							<div class="d-grid gap-2">
								<input type="submit" value="login" class="btn btn-primary"
									style="background: #7030A0; border-color: #7030A0 !important; width: 150px; height: 40px;">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>