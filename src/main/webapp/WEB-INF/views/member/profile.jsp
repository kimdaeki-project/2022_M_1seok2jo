<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Insert title here</title>
		
		<%-- 보통 타이틀밑에 BootStrap 링크를 넣는다 --%>
    	<%-- Bootstrap CSS --%>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link href="https://fonts.googleapis.com/css2?family=Arvo&family=Dongle&family=Montserrat:wght@200&family=PT+Serif&family=Playfair+Display:wght@600&family=Prompt&family=Vollkorn:wght@500&display=swap" rel="stylesheet"/>
		<!-- jquery -->
		<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<%-- favicon --%>
		<link rel="shortcut icon" href="/resources/images/favicon.ico">
		<link rel="stylesheet" href="/resources/css/admin/bscommon.css">
</head>
<div class="container-fluid" style="height: 80px;">
	<c:import url="../template/header.jsp"></c:import>
</div>
<body>
	<div class="container ilseok">
		<div class="row justify-content-md-center">
			<div class="col-md-8 col-lg-7 mt-5">

				<div class="mb-4 text-center">
					<h1><b>프로필✒</b></h1>
				</div>

				<%-- 프로필 수정 form --%>
				<form action="./profile" method="post" enctype="multipart/form-data">
					
					<!-- 프로필사진 카드 -->
					<div class="card border-success mb-3">
						<div class="row my-3">
							<img src="http://20.249.88.100/resources/member/${member.memberFileDTO.f_name}" style=" max-width: 300px;  height: 300px;">
						</div>
						<div class="row">
							<div class="col-6 text-end" id="addFile">
								<!--하단 파일 추가 input과 연결된 라벨-->
								<label for="file" class="file_add btn btn-outline-success btn-sm"><b>파일추가📂</b>
							</div>
							<div class="col-6 text-start" id="tcherProfile">
								<!-- 강사프로필로 가는 버튼 -->
								<!-- <button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='/member/tcherProfile';"><b>프로필수정✏</b></button> -->
								<a href="/member/tcherProfile" class="btn btn-outline-success btn-sm"><b>프로필수정✏</b></a>
							</div>
						</div>
						<div class="row">
							<!-- 파일 추가 input -->
							<input type="file" id="file" style="display: none;">
						</div>
						<div class="card-body">
							<!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
							<ul class="list-group list-group-flush">
								<li class="list-group-item border-success text-center">
									<label for="ipId" class="form-label card-title"><h5><b>${member.id}</b></h5></label>
									<p class="card-text"><input type="hidden" name="id" class="form-control" id="ipId" value="${member.id}"></p>
								</li>
								<li class="list-group-item border-success">
									<label for="ipNname" class="form-label card-title"><h6><b>닉네임</b></h6></label>
									<p class="card-text"><input type="text" name="n_name" class="form-control input-border-success" id="ipNname" value="${member.n_name}"></p>
								</li>
							</ul>
						</div>
						<!-- <div class="card-footer bg-transparent border-success">
							<ul class="list-group list-group-flush">
								<li class="list-group-item border-success">
									<label for="ipNname" class="form-label card-title"><h6><b>닉네임</b></h6></label>
									<p class="card-text"><input type="text" name="n_name" class="form-control" id="ipNname" value="${member.n_name}"></p>
								</li>
								<li class="list-group-item border-success">A second item</li>
								<li class="list-group-item border-success">A third item</li>
							</ul>
						</div> -->
					</div>
					
					<!-- <div class="mb-3">
						<label for="ipName" class="form-label">이름</label>
						<input type="text" name="name" class="form-control" id="ipName" value="${member.name}">
					</div> -->
					
					<!-- <div class="mb-3">
						<label for="ipBdate" class="form-label">생년월일</label>
						<input type="number" name="b_date" class="form-control" id="ipBdate" value="${member.b_date}">
					</div> -->
					
					<!-- 프로필정보 카드 -->
					<div class="card border-success mb-3">
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item border-success">
									<label for="ipGender" class="form-label card-title"><h6><b>성별</b></h6></label>
									<p class="card-text"><input type="text" name="gender" class="form-control" id="ipGender" value="${member.gender}"></p>
								</li>
								<li class="list-group-item border-success">
									<label for="ipEmail" class="form-label card-title"><h6><b>이메일</b></h6></label>
									<p class="card-text"><input type="text" name="email" class="form-control" id="ipEmail" value="${member.email}"></p>
								</li>
								<li class="list-group-item border-success">
									<label for="ipPhone" class="form-label card-title"><h6><b>전화번호</b></h6></label>
									<p class="card-text"><input type="tel" name="phone" class="form-control" id="ipPhone" value="${member.phone}"></p>
								</li>
							</ul>
						</div>
						<!-- <div class="card-footer bg-transparent border-success">
							<ul class="list-group list-group-flush">
								<li class="list-group-item border-success">
									<label for="ipNname" class="form-label card-title"><h6><b>닉네임</b></h6></label>
									<p class="card-text"><input type="text" name="n_name" class="form-control" id="ipNname" value="${member.n_name}"></p>
								</li>
								<li class="list-group-item border-success">A second item</li>
								<li class="list-group-item border-success">A third item</li>
							</ul>
						</div> -->
					</div>

					<!-- 구분선 -->
					<hr class="my-5 border-success">

					<!-- 회원가입 버튼 -->
					<div class="d-grid gap-2 mt-3">
						<button type="submit" class="btn btn-outline-success"><b>프로필수정✏</b></button>
					</div>
				</form>
			</div>
		</div>
	</div>
<c:import url="../template/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="/resources/js/member_file.js"></script>
<script>save()</script>
</body>
</html>
