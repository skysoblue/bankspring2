<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>
	
		<div class="content">
			<div>
			<br />
			<ul class="tabKey" style="width:1000px;">
				<li class="depth" style="width:32%;text-align: center;border:1px solid black">
					<a href="javascript:void(0);" style="width: 98%">방명록</a>
					<div > 
						
					 </div>
				</li>
				<li class="depth" style="width:32%;text-align: center;border:1px solid black">
					<a href="javascript:void(1)"  style="width: 98%">답글게시판</a>
					<div > 2 </div>
				</li>
				<li class="depth" style="width:32%;text-align: center;border:1px solid black">
					<a href="javascript:void(2)"  style="width: 98%">자료실</a>
					<div > 3 </div>
				</li>
			</ul>
				
				
				<br /><br /><br /><br />
				
				</div>
			</div>

<script src="${context}/js/tabKey.js"></script>
<script src="${context}/js/magnific-popup.js"></script>
<script type="text/javascript">
	$(function() {
		tabKey.tab();
	});
</script>
