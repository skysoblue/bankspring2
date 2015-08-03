<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>

	<div class="content">
		<div>
		<br />
			<form action="${root}/member/update.do" name="frmUpdateMember" 
				enctype="multipart/form-data">
				<table class="tab" style="margin: 0 auto;">
					<tr>
						<td rowspan="4" style="width:30%">
							<img src="${context}/image/default.gif" alt="" />
						</td>
						<td>ID</td>
						<td>${member.userid}</td>
					</tr>
					<tr>
						
						<td>비밀번호</td>
						<td>${member.password}</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${member.name}</td>
					</tr>
					<tr>
						<td>나이</td>
						<td>${member.age}</td>
						
					</tr>
					<tr>
						<td style="text-align: center;">
							<button id="updateImage" style="width:100px">이미지 변경</button>
						</td>
						<td>이메일</td>
						<td>${member.email}</td>
					</tr>
				</table>
			</form>
			<br /><br /><br />
			<a href="${root}/member/update.do">수정페이지로</a>
		</div>
	</div>
<script src="${context}/js/member.js"></script>
<script type="text/javascript">
	$(function() {
		$('#updateImage').click(function() {
			member.updateImage();
		});
	});
</script>



















