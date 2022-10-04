<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>게시판 상세보기</title>
    <link rel="stylesheet" href="/resources/css/board/cs_myList.css" />
    <!-- jquery -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js" ></script>
    <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <%-- Bootstrap CSS --%>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Arvo&family=Dongle&family=Montserrat:wght@200&family=PT+Serif&family=Playfair+Display:wght@600&family=Prompt&family=Vollkorn:wght@500&display=swap"
      rel="stylesheet"
    />
    <%-- favicon --%>
    <link rel="shortcut icon" href="/resources/images/favicon.ico" />
  </head>
  <body>
    <div class="container-fluid" style="height: 80px;">
      <c:import url="../template/header.jsp"></c:import>
    </div>
    <section class="container" >
      <div class="row mt-5  text-center">
        <h3>내 문의</h3>
      </div>
      <div class="row text-end mx-auto mt-1" style="width: 70%;">
        <button
        class="btn-st btn btn-outline-secondary"
        onclick="location.href='./add';"
      >
        문의하기
      </button>
      </div> 
      <c:forEach items="${myList}" var="csboard">

      <div class="board">
        <!--내가 문의한 부분-->
        <div class="board_contents">
          <div class="row py-2">
            <div class="col-10 align-content-center" style="padding: 8px 8px 8px 0px; font-size: 14px; margin-top: 0.5rem">
              <h5><b>${csboard.cs_title}</b></h5>
            </div>
            <div class="col-2 align-content-center my-auto">
              <c:if test="${csboard.cs_status eq '미답변'}">  
              <div class="b2 d-flex">
                <div class="mx-auto">
                  <b>
                    ${csboard.cs_status}
                  </b>
                </div>
              </div>
              </c:if>
              <c:if test="${csboard.cs_status eq '답변완료'}">  
              <div class="b1 d-flex">
                <div class="mx-auto">
                  <b>
                    ${csboard.cs_status}
                  </b>
                </div>
              </div>
              </c:if>

            </div>
          </div>
          <hr style="margin: 0;">
          <div class="row p-3 text-muted flex-row-reverse">
            ${csboard.regdate}
          </div>
          <div class="row">
            ${csboard.cs_contents}
          </div>
        </div>

        <!--답변부분-->
        <div class="sb_contents">
          <div class="mb-3">
            <h5 style="text-align: justify; text-justify: auto">
              <c:if test="${not empty csboard.cs_answer}">
                ${csboard.cs_answer}
              </c:if>
              <c:if test="${empty csboard.cs_answer}">
                <span><b>미답변 문의입니다. 답변을 기다려주세요</b></span>
              </c:if>              
            </h5>
          </div>
        </div>
      </div>

      <!--board-Writer-Button-->
      <div
        class="d-flex flex-row-reverse"
        style="width: 70%; margin: 0px auto"
      >
        <div class="p-2">
          <button
            class="btn-st btn btn-outline-secondary"
            onclick="location.href='sb_delete?sb_num=${studyBoardDTO.getSb_num()}';"
          >
            삭제하기(작성자)
          </button>
        </div>
        <div class="p-2">
          <button
            type="button"
            class="btn-st btn btn-outline-secondary"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal"
            data-bs-whatever="@mdo"
          >
            수정하기(작성자)
          </button>
        </div>
      </div>
      </c:forEach>
      <!--modal-->
      <div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                <b style="color: gray">글 수정하기📚</b>
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <form
                action="sb_update"
                method="post"
                enctype="multipart/form-data"
              >
                <input
                  value="${studyBoardDTO.getSb_num()}"
                  style="display: none"
                />
                <div class="mb-3">
                  <label
                    for="recipient-name"
                    class="col-form-label"
                    style="color: gray"
                    ><b>글제목</b></label
                  >
                  <input
                    type="text"
                    name="title"
                    value="${studyBoardDTO.title}"
                    class="form-control"
                    id="exampleFormControlInput1"
                  />
                </div>
                <div class="mb-3">
                  <label for="message-text" class="col-form-label" style="color: gray"><b>내용</b></label>
                  <textarea name="contents"  class="form-control mt-1"  id="contents"  rows="3" >
                    ${studyBoardDTO.contents}
                  </textarea>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                id="close"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                취소
              </button>
              <button
                class="btn btn-warning"
                id="update_btn"
                data-board-num="${studyBoardDTO.getSb_num()}"
              >
                등록하기
              </button>
            </div>
          </div>
        </div>
      </div>

      <!--modal/강사답글-->
      <div
        class="modal fade"
        id="exampleModal2"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                <b style="color: gray">답글작성 😺</b>
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <form
                action="sb_update"
                method="post"
                enctype="multipart/form-data"
              >
                <input
                  value="${studyBoardDTO.getSb_num()}"
                  style="display: none"
                />
                <div class="mb-3">
                  <label
                    for="message-text"
                    class="col-form-label"
                    style="color: gray"
                    ><b>내용</b></label
                  >
                  <textarea
                    name="contents"
                    class="form-control mt-1"
                    id="t_answer"
                    rows="2"
                    style="height: 150px"
                  ></textarea>
                </div>
                <div id="addFiles">
                  <button class="mt-2 file_add"><b>파일추가📂</b></button>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                id="close"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                취소
              </button>
              <button
                class="btn btn-warning"
                id="answer_btn"
                data-board-num="${studyBoardDTO.sb_num}"
              >
                작성하기
              </button>
            </div>
          </div>
        </div>
      </div>

      <div>
        <!-- 강사 답글 위치-->
        <div id="teacher"></div>

        <!--container-box-->
      </div>
    </section>

    <c:import url="../template/footer.jsp"></c:import>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript">
      $("#contents").summernote({
        placeholder: "글 내용 수정",
        height: 260,
        minHeight: null,
        maxHeight: null,
        focus: true,
      });
    </script>

  </body>
</html>