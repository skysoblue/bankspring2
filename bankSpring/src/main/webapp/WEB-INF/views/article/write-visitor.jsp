<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>
<div class="box">
<form action="${root}/article/write" name="frmWrite" method="POST">
	<input type="hidden" name="userid" value="hong" />
	<input type="hidden" name="theme" value="1000" />
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
		article.write();
	});
</script>