<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>
<script src="http://malsup.github.com/jquery.form.js"></script>
<div class="box"></div>
<script type="text/javascript">
$(function() {
	user.detail();
	$('#btnUpdateImage').click(function() {});
	
});
var user = {} 
user.detail = function() {
	$.getJSON('${root}/member/mypage/${member.userid}',
			function(data){
				var table ="<table class='tab'>"
					+ "<tr><td rowspan='5' style='width:400px'>"
					+ "<img src='${context}/image/member/${member.profile}' style='width:400px;' alt='' /></td>"
					+ "<td>ID</td>"
					+ "<td>${member.userid}</td></tr>"
					+ "<tr><td>비밀번호</td>"
					+ "<td><input type='text' name='password' readonly value='${member.password}'/></td>"
					+ "</tr><tr><td>이름</td>"
					+ "<td>${member.name}</td></tr>"
					+ "<tr><td>나이</td>"
					+ "<td>${member.age}</td></tr><tr>"
					/* + "<input type='button' id='image' style='width:100px' value='이미지변경'></td>" */
					+ "<td>이메일</td>"
					+ "<td><input type='text' name='email' readonly value='${member.email}'/></td></tr>"
					+ "<tr><td style='text-align:center' colspan='3'>"
					+ "<input type='button' id='update' style='width:100px' value='수 정'>"
					+ "<input type='button' id='remove' style='width:100px' value='탈 퇴'>"
					+ "</td></tr>"
					+ "</table>";
					
					$('.box').html(table);
					$('#update').click(function() {
						user.updateForm();	
					});
		});
	
	
	
}
user.updateForm = function() {
	$.getJSON('${root}/member/mypage/${member.userid}',
			function(data){
				$('.box').empty();
				var form = $('.box').append("<form action='${root}/member/update' id='frm' method='post' enctype='multipart/form-data'>");
				var table ="<table class='tab'>"
					+ "<tr><td rowspan='4' style='width:400px;'>"
					+ "<img src='${context}/image/member/${member.profile}' style='width:400px;' alt='' /></td>"
					+ "<td>ID</td>"
					+ "<td>${member.userid}</td></tr>"
					+ "<tr><td>비밀번호</td>"
					+ "<td><input type='text' name='password' value='${member.password}'/></td>"
					+ "</tr><tr><td>이름</td>"
					+ "<td>${member.name}</td></tr>"
					+ "<tr><td>나이</td>"
					+ "<td>${member.age}</td></tr><tr><td style='text-align:center'>"
					+ "<input type='file' id='file' name='file' style='width:100px' value='이미지변경'/></td>"
					+ "<td>이메일</td>"
					+ "<td><input type='text' name='email' value='${member.email}'/></td></tr>"
					+ "<tr><td style='text-align:center' colspan='3'>"
					+ "<input type='submit' id='confirm' style='width:100px' value='확 인'>"
					+ "<input type='button' id='cancel' style='width:100px' value='취 소'>"
					+ "</td></tr>"
					+ "</table>";
					+"<div id='progress'><div id='bar'></div><div id='percent'>0%</div ></div>";
					$('#frm').html(table);
					$('#frm').submit(function(e) {
						e.preventDefault();
						var form = $('#frm')[0];
						var postData = new FormData(form);
						
						$.ajax({
							url : '${root}/member/update',
							type : 'post',
							data : postData,
							async : true, /* 비동기를 활성화 */
							dataType : 'json',
							mimeType : 'multipart/form-data',
							processData : false,
							contentType : false,
							success : function(data) {
								user.detail();
							},
							error : function(xhr, status, msg){
								alert(' 에러 발생 상태:'+status + ' 내용:'+msg);
							}
						});	
					});
		});
	
}
var errorFn = function(xhr, status, msg){
	alert(' 에러 발생 상태:'+status + ' 내용:'+msg);
}
var options = {
		beforeSend: function() { $("#progress").show(); //clear everything 
			$("#bar").width('0%'); $("#message").html(""); 
			$("#percent").html("0%"); 
		}, 
		uploadProgress: function(event, position, total, percentComplete) {
			$("#bar").width(percentComplete+'%'); $("#percent").html(percentComplete+'%'); 
		}, 
		success: function() {
			$("#bar").width('100%'); $("#percent").html('100%'); 
		}, 
		complete: function(response) {
			$("#message").html("<font color='green'>"+response.responseText+"</font>"); 
		}, 
		error: function() {
			$("#message").html("<font color='red'> ERROR: unable to upload files</font>"); 
		}
}
user.update = function() {
	
	
}
</script>