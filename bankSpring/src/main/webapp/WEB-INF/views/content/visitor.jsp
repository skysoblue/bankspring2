<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box"></div>
<script type="text/javascript">
$(function() {
	
	switch ('${action}') {
	case 'inventory':visitor.inventory(1);break;
	case 'write':visitor.writeForm();break;
	default: alert('경로 에러 발생');break;
		
	}
});	

/* ============  */
/* executeUpdate */
/* ============  */

var visitor = {}
visitor.writeForm = function() {
	$('.box').empty();
	$('.box').append('<form action="${root}/article/write" name="frm" id="frm">');
	   var table = "<input type='hidden' name='userid' value='${member.userid}' />"
		+"<input type='hidden' name='thmSeq' value='1000' />"
		+"<table class='tab' style='width:700px;margin:0 auto'>"
		+"<tr><td style='width:100%;height:50px'>"
		+"<input type='text' name='title' style='width:90%' placeholder='제 목' />"
		+"</td></tr><tr><td><textarea rows='10' cols='100' name='content'></textarea>"
		+"</td></tr><tr><td>"
		+"<div style='width:300px;margin:0 auto'>"
		+"<button id='btnWrite' style='width:100px'>전 송</button>"
		+"<button id='btnCancel' style='width:100px'>취 소</button>"
		+"</div></td></tr></table>";
		$('#frm').html(table);
}
visitor.write = function($url,$data) {
	
	
	$.ajax({
		url : $url,
		type : 'GET',
		data : $data,
		dataType : 'json',
		contentType : 'application/json',
		success : function(data) {
			if (data==null) {
				visitor.noData();
			}else{
				visitor.table(data);
			}
		}
	});

}
visitor.inventory = function(pageNo) {
	console.log('넘어온 pageNo : '+pageNo);
	console.log('넘어온 ID :'+'${member.userid}');
	$.getJSON('${root}/article/search/1000/${member.userid}/'+pageNo,function(data){
		visitor.list(data); 
	 	
	});
}
visitor.list = function(data) {
	$('.box').empty();
	var table = '<table class="tab" style="width:1000px;margin:0 auto">';
	table += '<tr><th>글번호</th><th>ID</th><th>이름</th><th>제목</th><th>등록일</th></tr>';
	$.each(data,function(){
		table += '<tr>';
		table += '<td>'+this.artSeq+'</td><td>'+this.userid+
		'</td><td>'+this.name+'</td><td><a href="#" onclick="return visitor.detail('+this.artSeq+')">'
		+this.title+'</a></td><td>'+this.postingDate+'</td>';
		table += '</tr>';
	});
	table += '<tr><td colspan="5">';
	table += '<div>';
	table += '<nav><ul  class="pagination"><li ><a href="#" aria-label="Previous" class="page-li"><span aria-hidden="true">&laquo;</span></a></li>';
	table += '<li ><a href="#" class="page-li" value="1">1</a></li>';
	table += '<li ><a href="#" class="page-li" value="2">2</a></li>';
	table += '<li ><a href="#" class="page-li" value="3">3</a></li>';
	table += '<li ><a href="#" class="page-li">4</a></li>';
	table += '<li ><a href="#" class="page-li">5</a></li>';
	table += '<li ><a href="#" class="page-li"  aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
	table += '</ul></nav></div></td></tr></table>';
	$('.box').html(table);
	visitor.pagination();
	
}
visitor.pagination = function() {
	$('.page-li').on('click',function(){
		var pageNo = $('li').each(function() {
			
		});
		alert('선택한 페이지 번호'+pageNo);
		visitor.inventory(pageNo);
	});
	
}
visitor.noData = function() {
	var table = '<table class="tab">';
	table += '<tr><th>글번호</th><th>ID</th><th>이름</th><th>제목</th><th>등록일</th></tr>';
	
		table += '<tr>';
		table += '<td colspan="5"><p>등록된 데이터가 없습니다.<p></td>';
		table += '</tr>';
	
	table += '</table>';
	$('.box').html(table);
}
visitor.detail = function(seq){ /*int 타입 get이 theme 이라서 seq 를 대체함*/

	$.ajax({
		url : '${root}/article/detail/${member.userid}/'+seq,
		type : 'get',
		dataType : 'json',
		contentType : 'application/json',
		success : function(data) {
			visitor.detailForm(data);
		},
		error : function(xhr, status, msg) {
			alert('[상세]에러발생 !! 상태 :'+status+", 내용:"+msg);
		}
	});
}
visitor.update = function(data) {
	$('#btnUpdate').click(function() {
		visitor.updateForm(data);
	});
}
visitor.detailForm = function(data) {
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
	visitor.update(data);
}
visitor.updateForm = function(data) {
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
 
/* ============  */
/* executeQuery */
/* ============  */
</script>

