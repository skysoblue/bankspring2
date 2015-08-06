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
		article.search('${root}/article/search/1000/${member.userid}/1');
	});
	$('#writeVisitor').on('click',function() {
		article.load('.box','${root}/article/path/write-visitor');
	});
	
});
</script>

