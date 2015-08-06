<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<c:set var="context" value="${root}/resources"></c:set>
<!-- 
@RequestParam(value="checkArray[]") List<string> arrayParams, 
@RequestParam(value="userid") String userid
 -->
<div>
	<input type="hidden" id="userid" value="${member.userid}">
	<input type="checkbox" name="hobby" value="독서">
	<input type="checkbox" name="hobby" value="운동">
	<input type="checkbox" name="hobby" value="전시관람">
</div>

<script type="text/javascript">
	$(function() {
		checkbox = function(){
		    // 사용자 ID를 갖고 온다.
		    var userid = $("#userid").val();
		 
		    // name이 같은 체크박스의 값들을 배열에 담는다.
		    var checkboxValues = [];
		    $("input[name='hobby']:checked").each(function(i) {
		        checkboxValues.push($(this).val());
		    });
		     
		    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
		    var allData = { "userid": userid, "checkArray": checkboxValues };
		     
		    $.ajax({
		        url:"${root}/checkbox/",
		        type:'GET',
		        data: allData,
		        dataType : 'json',
		        contentType : 'application/json',
		        success:function(data){
		            alert("완료!");
		            window.opener.location.reload();
		            self.close();
		        },
		        error:function(xhr, status, message){
		            alert("에러 발생~~ \n" + status + " : " + message);
		            self.close();
		        }
		    });
		}
	});
</script>