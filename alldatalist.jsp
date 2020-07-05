<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
 <%
    request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("id");
    String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
    String uid = "travis";  String pass = "scott"; 
    String sql =  "select * from bankmember_ order by id"; 
    try{
    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    	Connection conn = DriverManager.getConnection(url, uid, pass);
    	Statement cre = conn.createStatement();
    	ResultSet rs = cre.executeQuery(sql);
    	%>
    <body style="background-color:#E0F8E0"> 
    <div align="center"> 
    <h2 style="color:silver">[관리자 전용 화면]</h2> 
    <h3> 전체 회원 리스트 (id 순)</h3> 
    <table width="500" border="1">
     <tr>
     <th>ID</th><th>PW</th><th>이름</th><th>연락처</th><th>나이</th><th>계좌잔액</th><th>입회일시</th>
     </tr>
      <% while(rs.next()) {%> 
      <tr> 
      <td><%=rs.getString("id")%></td>
       <td><%=rs.getString("pw")%></td>
        <td><%=rs.getString("name")%></td>
         <td><%=rs.getString("phone")%></td>
          <td><%=rs.getInt("age")%></td>
           <td style="color:red; text-align:right"><%=rs.getInt("balance")%></td>
            <td><%=rs.getString("insertdate")%></td> 
            </tr> 
            <%}%>
       </table><br><br> 
        <%String sql2 =  "select * from bankmember_tal order by id";
          ResultSet rs2 = cre.executeQuery(sql2);%>     <%--select문일때만 executeQuery를 써서 받아주지 update같은것은 executeUpdate(sql2) 같은걸로만 끝. --%>
          <h3>탈퇴 회원 리스트(id순)</h3>
          <table width="500" border="1">
          <tr>
          <th>ID</th><th>PW</th><th>이름</th><th>연락처</th><th>나이</th><th>계좌잔액</th><th>가입일시</th><th>탈회일시</th>
          </tr>
          <%while(rs2.next()){ %>
          <tr> 
      <td><%=rs2.getString("id")%></td>
       <td><%=rs2.getString("pw")%></td>
        <td><%=rs2.getString("name")%></td>
         <td><%=rs2.getString("phone")%></td>
          <td><%=rs2.getInt("age")%></td>
           <td style="color:red; text-align:right"><%=rs2.getInt("balance")%></td>
            <td><%=rs2.getString("insertdate")%></td> 
             <td><%=rs2.getString("tal_date")%></td>
            </tr> 
            <%}%>
          </table>
          <%String sql3 =  "select * from banktrade_ order by id asc,tradedate desc";
          ResultSet rs3 = cre.executeQuery(sql3);%>     <%--select문일때만 executeQuery를 써서 받아주지 update같은것은 executeUpdate(sql2) 같은걸로만 끝. --%>
          <h3>전고객 거래현황(id순,최근일시 순)</h3>
          <table width="500" border="1">
          <tr>
          <th>ID</th><th>거래일시</th><th>입금액</th><th>출금액</th><th>이체여부</th><th>이체상대</th>
          </tr>
          <%while(rs3.next()){ %>
          <tr> 
      <td><%=rs3.getString("id")%></td>
       <td><%=rs3.getString("tradedate")%></td>
        <td style="color:blue; text-align:right"><%=rs3.getString("ipkeum")%></td>
         <td style="color:red; text-align:right"><%=rs3.getString("chulkeum")%></td>
          <td><%if(rs3.getInt("iche_gubun")==0)out.print("");else if(rs3.getInt("iche_gubun")==1)out.print("이체보냄");else out.print("이체받음");%></td>
             <td><%=rs3.getString("iche_id")%></td>
            </tr> 
            <%}%>
            </table><br><br>
       <a href="menu.jsp">메뉴로 돌아가기</a>
        </div></body>
         <%} catch (Exception e) { out.print("거래내역 조회 중 문제 발생. 고객센터로 연락바랍니다. <p>" + e.getMessage()); }%>