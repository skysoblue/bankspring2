<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <form action="${root}/member/login" method="post" name="frmLogin">
        <fieldset>
        <legend>로그인</legend>
        <table>
            <tr>
                <td>아이디 </td>
                <td>
                    <input type="text" id="userid" name="userid" placeholder="ID 입력" />
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="text" id="password" name="password" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <!-- <input type="submit" value="전 송" /> -->
                    <div style="width:200px; margin : 0 auto;">
                    <img src="${context}/image/btnOk.jpg" 
                            style="cursor: pointer;margin:0 auto" 
                    alt="" onclick="return member.login()"/>
                     <img src="${context}/image/btnNo.jpg" 
                            style="cursor: pointer;" 
                    alt="" class="popupClose"/>
                    </div>
                </td>     
            </tr>
        </table>
        </fieldset>
    </form>
    <div style='margin : 0 auto;'>
        <span>
            <a href="#" onclick="searchId('${root}/member/searchIdForm.do')">
                아이디 찾기</a>
        </span>
        <span style="margin:0 10px "></span>
        <span>
            <a href="#" onclick="searchPass('${root}/member/searchPassForm.do')">
                비밀번호 찾기</a>
        </span>
    </div>
    