<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자로그인 모달 -->
<div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" style="border-radius:10px;">
      <div class="modal-header" >
        <h1 class="modal-title fs-5" id="msgModalLabel">관리자 로그인</h1>
      </div>
      <div class="modal-body" id="newsmsgModalBody" style="padding:30px;">
		<form action="/login.jsp" method="post" id="loginForm">
			<label class="form-label" for="pw">비밀번호</label>
			<input class="form-control mb-3" type="password" name="pw" id="pw">
		</form>
      </div>
      <div class="modal-footer">
        <button style="border-radius:10px;" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		<button style="border-radius:10px;" type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="login()">로그인</button>
      </div>
    </div>
  </div>
</div>


<!-- 소식 등록 모달 -->
<div class="modal fade" id="newsUploadModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" style="border-radius:10px;">
      <div class="modal-header" >
        <h1 class="modal-title fs-5" id="msgModalLabel">사진 등록</h1>
      </div>
      <div class="modal-body" id="newsmsgModalBody" style="padding:30px;">
		<form action="/newsUpload.jsp" method="post" enctype="multipart/form-data" id="newsimgForm">
			<label class="form-label" for="title">제목</label>
			<div>예) 2월 26일 주일예배</div>
			<input class="form-control mb-3" type="text" name="title" id="title">
			<label class="form-label" for="image">사진 선택</label>
			<input class="form-control" type="file" accept="image/*" name="image" id="image" >
		</form>
      </div>
      <div class="modal-footer">
        <button style="border-radius:10px;" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		<button style="border-radius:10px;" type="button" class="btn btn-warning" data-bs-dismiss="modal" id="newsdoneBtn">등록</button>
      </div>
    </div>
  </div>
</div>


<!-- 주보 등록 모달 -->
<div class="modal fade" id="postUploadModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content"  style="border-radius:10px;">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="msgModalLabel">주보 등록</h1>
      </div>
      <div class="modal-body" id="postmsgModalBody" style="padding:30px;">
		<form action="/postUpload.jsp" method="post" enctype="multipart/form-data" id="postimgForm">
			<label class="form-label" for="title">제목</label>
			<div>예) 2월 19일 주보</div>
			<input class="form-control mb-3" type="text" name="title" id="title">
			<label class="form-label" for="image">사진 선택</label>
			<input class="form-control" type="file" accept="image/*" name="image" id="image" value="1" multiple>
			<div><br> 사진 파일 이름 맨 뒤에 페이지 번호(001 또는 002)가 있는지 꼭 확인해주세요.
				<br> '1'이 아닌 '001' 3글자가 필요합니다.
				<br> 예) 주보001.jpg</div>
		</form>
      </div>
      <div class="modal-footer" id="modal-footer">
        <button style="border-radius:10px;" type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-dismiss="modal">취소</button>
		<button style="border-radius:10px; "type="button" class="btn btn-warning" data-bs-dismiss="modal" id="postdoneBtn">등록</button>
      </div>
    </div>
  </div>
</div>
