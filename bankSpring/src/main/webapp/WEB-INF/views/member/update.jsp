<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="content">
		<div>
		<br />
			<form action="${root}/member/update.do" name="frmUpdateMember" 
				 method="POST">
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
						<td><input type="text" required="required" name="password" value="${member.password}"/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${member.name}</td>
					</tr>
					<tr>
						<td>나이</td>
						<td>${member.age}</td>
						
					</tr>
					<tr id="aa">
						<td style="text-align: center;">
							<button id="updateImage" style="width:100px">이미지 변경</button>
						</td>
						<td>이메일</td>
						<td><input type="text" name="email" value="${member.email}"/></td>
					</tr>
					<tr>
						<td colspan="3"><button type="submit" style="width:150px;">수정완료</button></td>
					</tr>
				</table>
			</form>
			<br /><br /><br />
			
			
		</div>
	</div> <!-- wrap end -->

<script src="${context}/js/member.js"></script>
<script type="text/javascript">
	$(function() {
		$('#updateImage').click(function() {
			member.updateImage();
		});
	});
</script>



















