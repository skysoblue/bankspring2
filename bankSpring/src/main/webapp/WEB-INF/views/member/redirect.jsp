<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		var msg = '${msg}';
		alert(msg);
		document.location.href = "${root}/home/main.do";
	});
</script>