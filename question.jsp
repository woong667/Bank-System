<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<head><title>질문과 답변</title></head>
 <%String id = (String)session.getAttribute("id"); 
    int a;
 //if (id==null) {id="admin"; session.setAttribute("id",id);} /* 테스트할 때 로그인하기 귀찮아서*/ 
 String color, ment; 
 if(id.equals("admin")) {
	 color="#F8ECE0"; ment ="답변을 작성해 주세요.";
	 } 
 else {color="#FFD9FA"; ment ="궁금하신 점이 있으세요? 질문을 주시면 답을 해 드립니다.";}
 String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
 String uid = "travis";  String pass = "scott"; 
 String sql =  "select * from bankqa_ order by seq"; 
 try{
	 Class.forName("oracle.jdbc.driver.OracleDriver"); 
	 Connection conn = DriverManager.getConnection(url, uid, pass); 
	 Statement cre = conn.createStatement(); 
	 ResultSet rs = cre.executeQuery(sql);
	 %>
	 <body style="background-image: url('https://i.pinimg.com/originals/a2/fa/86/a2fa86facb9e9ac867fd07fdd3ceeddf.jpg'); ">
	  <font color="blue"><%=id%></font>님, <%=ment%><p> 
	  <%if(id.equals("admin")) { %>
	  <form method="post" action="question_delete.jsp">
	  <table width=600 border="1">
	   <tr><th>del</th><th>seq</th><th>ID</th><th>Question</th><th>질문일시</th><th>Answer</th><th>답변일시</th></tr> 
	   <%
	   while(rs.next()){
	   %> 
	   <tr>
	   <%a=rs.getInt(1);%>
	   <th><input type="radio" name="del" value="<%=a%>"/></th>
	   <th><%=a%></th>
	   <td><%=rs.getString(2)%></td> 
	   <td><%=rs.getString(3)%></td>  
	    <td><%=rs.getString(4)%></td>
	    <td><%=rs.getString(5)%></td>
	    <td><%if(rs.getString(6)==null)out.print("soon");else out.print(rs.getString(6));%></td>
	    </tr>
	    <%}%> 
	    </table><p> 
	    <input type="submit" value="선택질문삭제">
	    </form>
	    <%} else{ %>
	    <table width=600 border="1">
	   <tr><th>seq</th><th>ID</th><th>Question</th><th>질문일시</th><th>Answer</th><th>답변일시</th></tr> 
	   <%
	   while(rs.next()){
	   %> 
	   <tr>
	   <th><%=rs.getInt(1)%></th>
	   <td><%=rs.getString(2)%></td> 
	   <td><%=rs.getString(3)%></td>  
	    <td><%=rs.getString(4)%></td>
	    <td><%=rs.getString(5)%></td>
	    <td><%if(rs.getString(6)==null)out.print("soon");else out.print(rs.getString(6));%></td>
	    <!-- 교수님은  if(rs.getString(6)==null?"soon":rs.getString(6)) 이렇게 하셧음 out.print 사용불가이면 이렇게-->
	    </tr>
	    <%}%> 
	    </table><p> 
	    <%} %>
	    <form method="post" action="question_insert.jsp"> 
	    질문 입력:<br><textarea name="question" rows=4 cols=50 required></textarea> 
	    <input type="submit" value="질문등록" /> 
	    </form><p> 
	    <% if(id.equals("admin")) {%> 
	      <form method="post" action="q_answer_update.jsp">
	       답변 입력:<br> seq: <input type="number" name="seq" size=3 required> <br> 
	       <textarea name="answer" rows=4 cols=50 required></textarea> 
	       <input type="submit" value="답변등록" /> 
	       </form><p>
	        <%}%> 
	        <a href="menu.jsp">메뉴로 돌아가기</a> 
	        </body>
	         <%} catch (Exception e) { out.print("질문답변 조회 중 오류 : <br>" + e.getMessage()); }%>
