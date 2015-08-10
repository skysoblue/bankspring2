<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <form action="${root}/member/join.do" method="post" name="frmJoin">
        <fieldset>
        <legend>회원 가입</legend>
        <table>
            <tr>
                <td>이름 </td>
                <td>
                    <input type="text" id="name" name="name" placeholder="이름을 입력하세요" />
                </td>
            </tr>
            <tr>
                <td>ID </td>
                <td>
                    <input type="text" id="userid" name="userid" placeholder="ID 값을 입력하세요" />
                </td>
            </tr>
            <tr>
                <td>Password </td>
                <td>
                    <input type="password" id="password" name="password"  />
                </td>
            </tr>
                <tr>
                <td>나이 </td>
                <td>
                    <input type="text" id="age" name="age" placeholder="나이를 입력하세요" />
                </td>
            </tr>
                <tr>
                <td>이메일 </td>
                <td>
                    <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" />
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <!-- <input type="submit" value="전 송" /> -->
                    <div style="width:200px; margin : 0 auto;">
                    <img src="${context}/image/btnOk.jpg" 
                            style="cursor: pointer;margin:0 auto" 
                    alt="" onclick="return member.join()"/>
                     <img src="${context}/image/btnNo.jpg" 
                            style="cursor: pointer;" 
                    alt="" class="popupClose"/>
                    </div>
                </td>
            </tr>
        </table>
        </fieldset>
    </form>
    
    
    