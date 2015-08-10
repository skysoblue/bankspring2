<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<div style="float: left;width:30%;">
			<jsp:include page="aside.jsp"/>
		</div>
		<div style="float: right;width:70%;">
			<form action="${root}/admin/member.do?command=list&pageNo=1" name="frmAdmin" id="frmAdmin">
				<table class="tab">
					
					<tr>
						<th style="width: 20%"> ID </th>
						<th style="width: 30%"> 이름 </th>
						<th style="width: 10%"> 나이 </th>
						<th style="width: 40%"> 이메일</th>
					</tr>
					
						<tr>
							<td>${member.userid}</td>
							<td>${member.name}</td>
							<td>${member.age}</td>
							<td>${member.email}</td>
						</tr>
					
					
					
					
				</table>
			</form>
			<div class="pad"></div>
			<form action="${root}/admin/member.do" method="post">
				<select name="searchKey" id="searchKey">
					<option value="list" selected="selected">전체보기</option>
					<option value="userid">아이디</option>
					<option value="name">이름</option>
				</select>
				<input type="text" name="searchVal"/>
				<input type="hidden" name="pageNo"/>
				<input type="hidden" name="command" value="search" />
				<input type="submit"  value="검 색" />
			</form>
		</div>












</html>