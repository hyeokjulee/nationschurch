<%-- 
작성자 : 유범석
작성일 : 2023.02.16
수정자 : 김지수
버전 정보 : V2.0
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나라가 임하는 교회</title>
	<!-- viewport (모바일) -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- bootstrap CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- bootstrap icons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<!-- css -->
	<link href="/resources/css/common.css" rel="stylesheet">

<!-- lightbox2 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.css" integrity="sha512-Woz+DqWYJ51bpVk5Fv0yES/edIMXjj3Ynda+KWTIkGoynAMHrqTcDUQltbipuiaD5ymEo9520lyoVOo9jCQOCA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
</style>
<%@ include file="include/head.jsp"%>
</head>
<body>
<%@ include file="include/login.jsp"%>

  <section class="py-4 text-center container"></section>
<!-- 게시판 영역 -->
<div class="container">
	<div class="container mb-3">
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="row">
					<div class="col-4 text-muted">
			        </div>
			        <div class="col-4 text-center">
			        	<a href="index.html">
			        	<img src="images/home-icon.png" style="width:30px; "></a>
			        </div>
					<div class="col-4 text-end">
						<%if(admin) { %>
						<button class="btn btn-sm btn-outline-secondary" type="button" onclick="regPhoto()">사진 등록</button>
						<%} %>
					</div>
		        </div>
				
				<hr class="my-4">
				
				<div class="row photos" id="imgList"></div>
				
				<hr class="my-4">
				<div class="row">
					<div class="col-8">
						<ul class="pagination pagination-sm justify-content-center" id="pagination">
						
						</ul>
					</div>
		        </div>
			</div>
		</div>
	</div>
</div>


<!-- 등록 모달 -->
<div class="modal fade" id="uploadModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="msgModalLabel">사진 등록</h1>
      </div>
      <div class="modal-body" id="msgModalBody">
		<form action="photoUpload.jsp" method="post" enctype="multipart/form-data" id="imgForm">
			<label class="form-label" for="title">제목</label>
			<input class="form-control mb-3" type="text" name="title" id="title">
			<label class="form-label" for="image">사진 선택</label>
			<input class="form-control" type="file" accept="image/*" name="image" id="image" multiple>
		</form>
      </div>
      <div class="modal-footer" id="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		<button type="button" class="btn btn-warning" data-bs-dismiss="modal" id="doneBtn">등록</button>
      </div>
    </div>
  </div>
</div>
<!-- lightbox2 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js" integrity="sha512-k2GFCTbp9rQU412BStrcD/rlwv1PYec9SNrkbQlo6RZCf75l6KcC3UwDY8H5n5hl4v77IDtIPwOk9Dqjs/mMBQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
/*
[form id 이걸로 하셈]

검색 버튼 : searchBtn
검색 입력 인풋 : keyword
검색 선택 셀렉트 : selectType
게시글 표시 갯수 셀렉트 : selectAmount
리스트 다시 띄우기 : pageObj.pageCal(cri);
*/
function searchFunction() {
	//TODO: 리스트 출력 처리 하세요
		$.ajax({
			type:'post',
			url:'galleryProc.jsp',

			success:function(data){
				
				var data = JSON.parse(data.trim());
				
				var str = '';
				for(var i = 0; i < data.length; i++){
					var img = data[i].gupfolder + '/' +data[i].guuid + '_' + data[i].gfilename;
					str += ''
						+ '<div class="col-sm-6 col-md-4 col-lg-3 item h-100">'
						+ '<a class="col-lg-4 col-md-12 mb-4 mb-lg-0" href="'+ img +'" data-title="'+data[i].gtitle +'" data-lightbox="photos">'
						+ '<img class="img-fluid shadow bg-body rounded" src="'+img+'" style="width: 200px;height: 150px;object-fit: cover;">'
						+ '</a><div class="row">'
						<% if (admin) { %>
						+ '<div class="col-6 text-end"><i class="btn bi bi-trash3-fill" onclick="photoRemove(\''+data[i].gno+'\',\''+data[i].guuid+'\', \''+data[i].gfilename+'\')"></i></div>'
						<% } else {%>
						+ '<br>'
						<% } %>
						+ '</div></div>';
				} $("#imgList").html(str);
			}
		});	
}
window.onload = function() {
	searchFunction();
}

function photoRemove(gno, gfilename, guuid) {
	if (confirm('정말로 삭제 하시겠습니까?')){
		location.href="galleryDel.jsp?gno=" + gno +"&gfilename="+gfilename + "&guuid=" + guuid;
	}
}

/* if (confirm('정말로 삭제 하시겠습니까?')){
	fetch('galleryDel.jsp', {	
		method: "post",
		body: new URLSearchParams({
				gno: gno,
				guuid: guuid,
				gfilename: gfilename,
			})
        })
		.then(resp => resp.text())
		.then(data => {
			data.trim()
			console.log(data);
			pageObj.pageCal(cri);
		})
} */



lightbox.option({
    resizeDuration: 200,
    wrapAround: false,
    disableScrolling: true,
    fitImagesInViewport: true
});

function regPhoto(){
	$('#uploadModal').modal('show');
}

$('#doneBtn').on('click', function(){
	if ($('#title').val() != '' && $('#image').val() != '') {
		$('#imgForm').submit();
	} else {
		popModal('사진 등록 실패', '입력 값이 없는 항목이 있습니다.')
	}
});
</script>
<!-- Libs JS -->
<!-- Tabler Core -->
<script src="/resources/js/tabler.min.js?1674944402" defer></script>
<script src="/resources/js/demo.min.js?1674944402" defer></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>