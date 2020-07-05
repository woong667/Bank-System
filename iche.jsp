<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body style="background-image: url('https://i.pinimg.com/originals/a2/fa/86/a2fa86facb9e9ac867fd07fdd3ceeddf.jpg'); ">
<%
String id = (String)session.getAttribute("id"); 
%> 
<div align="center"> 
<h2>즉시이제</h2> <hr>
 <font color="blue"><%=id%></font>님, 수신인 ID와 이체금액을 입력해주세요 <br> <hr><p>
  <form method="post" action="check_iche_id.jsp">
   수신인ID: <input type="text" name="friend"/> <p> 
  이체금액<input type="text" name="iche_money"/><p>
   <input type="submit" value=" 이체진행 "/> 
   </form>
    <a href = "menu.jsp" > 메뉴로 돌아가기 </a> <p> </div> </body>
    