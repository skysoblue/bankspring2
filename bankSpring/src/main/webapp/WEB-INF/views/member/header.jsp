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
        <li class="active"><a href="#"> 내 서재 <span class="sr-only">(current)</span></a></li>
        <li><a href="#" id="review-inventory">도서리뷰</a></li>
        <li><a href="#" id="bbs-inventory">게시판</a></li>
        <li><a href="#" id="visitor-inventory">방명록</a></li>
        <li>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">
						글쓰기 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#" id="review-write">도서리뷰</a></li>
						<li><a href="#" id="bbs-write">게시판</a></li>
						<li><a href="#" id="visitor-write">방명록</a></li>
					</ul></li>
			</ul>
		</li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
          ${member.name} 님 환영합니다
           <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" id="member-detail">마이페이지</a></li>
            <li><a href="#" id="logout">로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</header>

<div class="clear"></div>
<script type="text/javascript">
	$('#review-inventory').click(function() {location.href='${root}/article/path/review/inventory';});
	$('#bbs-inventory').click(function() {location.href='${root}/article/path/bbs/inventory';});
	$('#visitor-inventory').click(function() {location.href='${root}/article/path/visitor/inventory';});
	$('#review-write').click(function() {location.href='${root}/article/path/review/write';});
	$('#bbs-write').click(function() {location.href='${root}/article/path/bbs/write';});
	$('#visitor-write').click(function() {location.href='${root}/article/path/visitor/write';});
	$('#member-detail').click(function() {location.href='${root}/member/detail';});
	$('#logout').click(function() {location.href='${root}/member/logout';});
</script>









