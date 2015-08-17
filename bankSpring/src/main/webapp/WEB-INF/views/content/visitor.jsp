<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box"></div>
<script type="text/javascript">
$(function() {
	switch ('${action}') {
	case 'inventory':visitor.inventory();break;
	case 'write':visitor.writeForm();break;
	default: alert('경로 에러 발생');break;
		
	}
});	
visitor = {}
/* ============  */
/* executeUpdate */
/* ============  */
visitor.writeForm = function() {
	$('.box').empty();
	$('.box').append('form action="${root}/article/write" name="frm" id="frm"');
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
 
 
/* ============  */
/* executeQuery */
/* ============  */
</script>

