<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${context}/home/main.do">
      <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"> 추천도서 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">베스트셀러</a></li>
        <li><a href="#">신간도서</a></li>
        <li><a href="#">리 뷰</a></li>
        <li><a href="#">게시판</a></li>
        <li><a href="#">방명록</a></li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">도서검색</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
           <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#joinForm" id="aJoin" class="popupOpen">회원가입</a></li>
            <li><a href="#loginForm" id="aLogin" class="popupOpen">로그인</a></li>
            <li><a href="#" id="admin">관리자</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

</header>

<div id="joinForm" class="white-popup-block mfp-hide" 
	style='width:300px; height : 500px; background-color: white; margin : 0 auto;'>
	<!-- <h1>모달 테스트</h1>
	 -->
	<jsp:include page="../member/joinForm.jsp"></jsp:include>

</div>
<div id="loginForm" class="white-popup-block mfp-hide" 
style='width:300px; height : 500px; background-color: white; margin : 0 auto;'>
	<!-- <h1>모달 테스트</h1>
	 -->
	<jsp:include page="../member/loginForm.jsp"></jsp:include>

</div>
<div class="clear"></div>
<script src="${context}/js/member.js"></script>
<script src="${context}/js/magnific-popup.js"></script>
<script type="text/javascript">
	$(function() {
		$('.popupOpen').magnificPopup({
			type : 'inline',
			preloader : false,
			focus : '#username',
			modal : true,
			closeContentPos : true,
			fixedContentPos: true,
	        alignTop: false, /* 최상단위치 */
			showCloseBtn: true
		});
		$(document).on('click','.popupClose',function(e){
			e.preventDefault();
			$.magnificPopup.close();
		});
		$('#admin').click(function() {
			
			member.checkAdmin('${root}/admin/member.do?command=list&pageNo=1');
		});
	});
</script>







