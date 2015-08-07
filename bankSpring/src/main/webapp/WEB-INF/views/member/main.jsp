<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>

<div class="box"></div>
<script type="text/javascript">
$(function() {
	/*방명록 시퀀스번호 1000*/
	$('#userVisitor').on('click',function(){
		$.getJSON('${root}/article/search/1000/${member.userid}/1',function(data){
			article.table(data);
		});
	});
	$('#writeVisitor').on('click',function() {
		article.load('.box','${root}/article/path/write-visitor');
	});
	article.table = function(data) {
		var table = '<table class="tab">';
		table += '<tr><th>글번호</th><th>ID</th><th>이름</th><th>제목</th><th>등록일</th></tr>';
		$.each(data,function(){
			table += '<tr>';
			table += '<td>'+this.artSeq+'</td><td>'+this.userid+
			'</td><td>'+this.name+'</td><td><a href="#" onclick="return article.detail('+this.artSeq+')">'+this.title+'</a></td><td>'+this.postingDate+'</td>';
			table += '</tr>';
		});
		table += '</table>';
		$('.box').html(table);
	}
	article.noData = function() {
		var table = '<table class="tab">';
		table += '<tr><th>글번호</th><th>ID</th><th>이름</th><th>제목</th><th>등록일</th></tr>';
		
			table += '<tr>';
			table += '<td colspan="5"><p>등록된 데이터가 없습니다.<p></td>';
			table += '</tr>';
		
		table += '</table>';
		$('.box').html(table);
	}
	article.detail = function(seq){ /*int 타입 get이 theme 이라서 seq 를 대체함*/
		
		$.ajax({
			url : '${root}/article/detail/${member.userid}/'+seq,
			type : 'get',
			dataType : 'json',
			contentType : 'application/json',
			success : function(data) {
				article.detailForm(data);
			},
			error : function(xhr, status, msg) {
				alert('[상세]에러발생 !! 상태 :'+status+", 내용:"+msg);
			}
		});
	}
	article.update = function(data) {
		$('#btnUpdate').click(function() {
			article.updateForm(data);
		});
	}
	article.detailForm = function(data) {
		var table = '<table class="tab" style="width: 700px; margin: 0 auto;">';
		table += '<tr>';
		table += '<td style="width: 100%; height: 50px;">';
		table += '<input type="text" name="title" style="width: 90%" readonly value="'+data.title+'"/></td>';
		table += '</tr>';
		table += '<tr>';
		table += '<td><textarea rows="10" cols="100" name="content" readonly>'+data.content+'</textarea></td>';
		table += '</tr>';
		table += '<tr>';
		table += '<td>';
		table += '<div style="width: 300px; margin: 0 auto;">';
		table += '<button id="btnUpdate" style="width: 100px">수정</button>';
		table += '<button id="btnCancel" style="width: 100px">취소</button>';
		table += '</div>';
		table += '</td>';
		table += '</tr>';
		table += '</table>';
		$('.box').empty();
		$('.box').html(table);
		article.update(data);
	}
	article.updateForm = function(data) {
		$('.box').empty();
		$('.box').append('<form action="${root}/article/update" id="frmUpdate"> ');
		var table = '<input type="hidden" name="userid" value="${member.userid}"/>';
		table += '<input type="hidden" name="thmSeq" value="1000"/>';
		table += '<input type="hidden" name="artSeq" value="'+data.artSeq+'"/>';
		table += '<table class="tab" style="width: 700px; margin: 0 auto;">';
		table += '<tr>';
		table += '<td style="width: 100%; height: 50px;">';
		table += '<input type="text" name="title" style="width: 90%" value="'+data.title+'"/></td>';
		table += '</tr>';
		table += '<tr>';
		table += '<td><textarea rows="10" cols="100" name="content" >'+data.content+'</textarea></td>';
		table += '</tr>';
		table += '<tr>';
		table += '<td>';
		table += '<div style="width: 300px; margin: 0 auto;">';
		table += '<input type="submit" id="btnConfirm" style="width: 100px" value="수정확인"/>';
		table += '<input type="button" id="btnCancel" style="width: 100px" value="취소"/>';
		table += '<input type="button" id="btnRemove" style="width: 100px" value="삭제"/>';
		table += '</div>';
		table += '</td>';
		table += '</tr>';
		table += '</table>';
		
		$('#frmUpdate').html(table);
		article.updateConfirm();
		article.remove();
		
	}
	article.updateConfirm = function() {
		$('#btnConfirm').click(function() {
			$('#frmUpdate').submit(function(event) {
				event.preventDefault();
				var $form = $('#frmUpdate');
				var $data = $form.serialize();
				var $url = $form.attr('action');
				$.ajax({
					url : $url,
					type : 'get',
					data : $data,
					dataType : 'json',
					contentType : 'application/json',
					success : function(data) {
						if (data==null) {
							article.noData();
						} else {
							article.detailForm(data);
						}
					},
					error : function(xhr, status, msg) {
						alert("수정 에러 발생 상태 :"+status + "내용 :"+msg);
					}
				});
				
			});
		});
	}
	article.remove = function() {
		$('#btnRemove').click(function() {
			var $form = $('#frmUpdate');
			var $data = $form.serialize();
			$.ajax({
				url : '${root}/article/remove',
				type : 'get',
				data : $data,
				dataType : 'json',
				contentType : 'application/json',
				success : function(data) {
					article.table(data);
				},
				error : function(xhr, status, msg) {
					alert("삭제 에러 발생 상태 :"+status + "내용 :"+msg);
				}
			});
		});
	}
});
</script>

