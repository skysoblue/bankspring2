<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<c:set var="PAGESIZE" value="10"/>
	<c:choose>  
		<c:when test="${(count%PAGESIZE) eq 0}">
			<c:set var="totPage" value="${count/PAGESIZE}"/>
		</c:when>
		<c:otherwise>
			<c:set var="totPage" value="${count/PAGESIZE+1}"/>
		</c:otherwise>
	</c:choose>
	<c:set var="startPage" value="${pageNo - ((pageNo-1)%PAGESIZE) }"/>
	<c:choose>
		<c:when test="${startPage+PAGESIZE-1 le totPage }">
			<c:set var="lastPage" value="${startPage+PAGESIZE-1 }"/>
		</c:when>
		<c:otherwise>
			<c:set var="lastPage" value="${totPage}"/>
		</c:otherwise>
	</c:choose>

		<div style="float: left;width:30%;">
			<jsp:include page="aside.jsp"/>
		</div>
		<div style="float: right;width:70%;">
			<form action="${root}/admin/member.do?command=list&pageNo=1" name="frmAdmin" id="frmAdmin">
				<table class="tab">
					<tr align="right">
						<td colspan="4">회원수 : ${count} &nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<th style="width: 20%"> ID </th>
						<th style="width: 30%"> 이름 </th>
						<th style="width: 10%"> 나이 </th>
						<th style="width: 40%"> 이메일</th>
					</tr>
					<c:forEach var="member" items="${memberList}" varStatus="status">
						<tr>
							<td>${member.userid}</td>
							<td><a href="${root}/member/search.do?userid=${member.userid}">${member.name}</a></td>
							<td>${member.age}</td>
							<td>${member.email}</td>
						</tr>
					</c:forEach>
					
					<tr align="center">
						<td colspan="4">
							<c:if test="${startPage-PAGESIZE gt 0 }">
								<a href="${root}/admin/member.do?command=list&pageNo=${startPage-PAGESIZE}">
									◀이전
								</a>
							</c:if>
							<c:forEach begin="${startPage}" end="${lastPage}" step="1" varStatus="i">
								<c:choose>
									<c:when test="${i.index == pageNo}">
										<font color="red">${i.index}</font>
									</c:when>
									<c:otherwise>
										<a href="${root}/admin/member.do?command=list&pageNo=${i.index}">
											${i.index}
										</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${startPage+PAGESIZE le totPage}">
								<a href="${root}/admin/member.do?command=list&pageNo=${startPage+PAGESIZE}">
									다음▶
								</a>
							</c:if>
							
						</td>
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