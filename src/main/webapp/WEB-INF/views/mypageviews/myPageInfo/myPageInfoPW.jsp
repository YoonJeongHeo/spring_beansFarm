<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/myPageInfo/myPageInfoPW.css">

<script src="../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/mypage/myPageInfoPW.js" ></script>
<div id="con2">
	<div id="con3">
       <h3>비밀번호를 입력해주세요</h3><br>
       <c:forEach var="listOne" items="${listOne}">
       <table>
           <tr>
               <th><h4>PW</h4></th>
               
               <td>
               		<input type="hidden" name="m_id" id="m_id" value="${listOne.m_id}">
               		<input type="password" name="m_pw" id="m_pw">
               </td>
               
           </tr>
           <tr></tr>
           
           <tr>
           		<th colspan="2"><button id="pwchk">확인</button></th>
           </tr>

       </table>
       </c:forEach>
      </div>
   </div>