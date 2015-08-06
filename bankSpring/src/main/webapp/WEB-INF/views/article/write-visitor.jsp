<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>
<div class="box">
<form action="${root}/article/write" name="frmWrite" id="frmWrite">
	<input type="hidden" name="userid" value="${member.userid}" />
	<input type="hidden" name="thmSeq" value="1000" />
	<table class="tab" style="width: 700px;margin: 0 auto;">
		<tr>
			<td style="width: 100%;height: 50px;">
				<input type="text" name="title" style="width: 90%" placeholder="제 목" />
			</td>
		</tr>
		<tr>
			<td>
				<textarea rows="10" cols="100" name="content">
				</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<div style="width: 300px;margin: 0 auto;">
				<button id="btnWrite" style="width: 100px;">전 송</button>
				<button id="btnCancel" style="width: 100px;">취 소</button>
				</div>
			</td>
		</tr>
	</table>
</form>
</div>
<script type="text/javascript">
	$(function() {
		$('#frmWrite').submit(function(event) {
			event.preventDefault(); // 한 이벤트를 실행 중에 이전 이벤트가
			// 초기화로 돌아가는 것을 방지
			var $form = $(this); // form 태그 내부의 모든 값
			var $data = $form.serialize(); 
			//  form 태그 내부의 모든 값을 GET 방식 스트링으로 처리
			// title=title&.....
			var $url = $form.attr('action'); // 파라미터가 하나이면 getAction 의미
			article.write($url,$data);
		});
		article.write = function($url,$data) {
			
				
				$.ajax({
					url : $url,
					type : 'GET',
					data : $data,
					dataType : 'json',
					contentType : 'application/json',
					success : function(data) {
						if (data==null) {
							article.noData();
						}else{
							article.table(data);
						}
					}
				});
			
		}
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
			table += '<input type="text" name="title" style="width: 90%" value='+data.title+'/></td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td><textarea rows="10" cols="100" name="content">'+data.content+'</textarea></td>';
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
			var table = '<table class="tab" style="width: 700px; margin: 0 auto;">';
			table += '<tr>';
			table += '<td style="width: 100%; height: 50px;">';
			table += '<input type="text" name="title" style="width: 90%" placeholder="'+data.title+'"/></td>';
			table += '</tr>';
			table += '<tr>';
			table += '<td><textarea rows="10" cols="100" name="content" placeholder="'+data.content+'"></textarea></td>';
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
			
			$('.box').html(table);
		}

	});
</script>





