<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box">book파일</div>
<script type="text/javascript">
$(function() {
		
});
var book = {}
book.list = function() {
	$.getJSON('${root}/book/list',function(){
		
	});	
}

</script>

