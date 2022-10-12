<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시글 목록</title>
        <!--파비콘-->
        <link rel="shortcut icon" href="/resources/images/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/resources/temp/css/styles1.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
            <!-- jQuery -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
        <link href="/resources/css/admin/bscommon.css" rel="stylesheet" />
    </head>
    <body class="sb-nav-fixed ilseok">
    	<c:import url="./navbar.jsp"></c:import>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">게시글 목록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin/main">Dashboard</a></li>
                            <li class="breadcrumb-item active">게시글 목록</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <h6>
                                    <b>검색 조건 설정</b>
                                </h6>
                                <div class="row">
                                    <div class="col-7">
                                        <span class="text-muted">시작날짜</span>
                                        <input type="date" id="startDate" name="startDate" class="p-1"></input>
                                        ~
                                        <span class="text-muted">끝날짜</span>
                                        <input type="date" id="endDate" name="endDate" class="p-1"></input>
                                    </div>
                                    <div class="col-5">
                                        <div class="input-group">
                                        <select type="button" name="kind" id="kind" class="btn btn-outline-success dropdown-toggle" style="text-align: left;" data-bs-toggle="dropdown" aria-expanded="false">
                                            <option value="title">제목</option>
                                            <option value="fb_num">게시글번호</option>
                                            <option value="contents">내용</option>
                                            <option value="category">카테고리</option>
                                            <option value="ID">작성자</option>
                                        </select>
                                        <input type="text" name="search" id="search" class="form-control"></input>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <span class="text-muted">게시판 구분</span>
                                        <input type="checkbox" id="free" name="status" value="free" class="form-check-input" checked>
                                        <label id="freelb" for="free" style="font-weight:bold; color:black">자유게시판</label>
                                        <input type="checkbox" id="study" name="status" value="study" class="form-check-input" checked>
                                        <label id="studylb" for="study" style="font-weight:bold; color:black">학습게시판</label>
                                        <input type="checkbox" id="notice" name="status" value="notice" class="form-check-input" checked>
                                        <label id="noticelb" for="notice" style="font-weight:bold; color:black">공지사항</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <button type="button" class="btn btn-outline-success mx-auto" id="btnSearch" style="width: 100px;">검색</button>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="d-flex ms-3 justify-content: flex-start;">
                                <div class="p-2 flex-grow-3"><b>VIEW</b></div>
                                <div class="p-2 flex-grow-3" style="color: gray">|</div>
                                <div class="p-2 flex-grow-3">
                                    <input type="radio" id="new" name="orderby" value="new" style="display: none;" checked>
                                    <label id="newlb" for="new" style="font-weight:bold; color:black">⏳ 최신 순</label>
                                </div>
                                <div class="p-2 flex-grow-3">
                                    <input type="radio" id="old" name="orderby" value="old" style="display: none;" >
                                    <label id="oldlb" for="old">⌛ 오래된 순</label>
                                </div>
                                <div class="p-2 flex-fill text-end pe-5">
                                    <button type="button" onclick="location.href='/board/nb_add'">공지사항 작성</button>
                                    <button type="button" id="deleteboard">게시글 삭제</button>
                                </div>
                              </div>
                        </div>
                        <div class="card mb-4 mt-2">
                            <div class="card-header" id="postResult">
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/temp/js/scripts.js"></script>
        <script src="/resources/js/admin.js"></script>
        <script>
            initboards()
        </script>
        
    </body>
</html>
