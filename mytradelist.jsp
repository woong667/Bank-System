<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<%
  request.setCharacterEncoding("UTF-8");
  String id=(String)session.getAttribute("id");
   String balance=(String)session.getAttribute("balance");
  String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
  String uid = "travis";  String pass = "scott"; 
  String sql =  "select * from banktrade_ where id=? order by tradedate desc";
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver"); 
  	Connection conn = DriverManager.getConnection(url, uid, pass);
  	PreparedStatement pre = conn.prepareStatement(sql);
	pre.setString(1,id);
	ResultSet rs = pre.executeQuery();
  	%>
  	<body style="background-image: url('https://i.pinimg.com/originals/a2/fa/86/a2fa86facb9e9ac867fd07fdd3ceeddf.jpg'); ">
    <div align="center"> 
    <h3> <span style="color:blue"><%=id%></span>님의 거래내역은 다음과 같습니다.잔액(<%=balance%>원)</h3> 
    <table width="500" border="1">
     <tr>
     <th>거래일자(최근일순)</th><th>입금액</th><th>출금액</th><th>이체여부</th><th>이체상대</th>
     </tr>
      <% while(rs.next()) {%> 
      <tr> 
      <td><%=rs.getString("tradedate")%></td>
       <td style="color:red; text-align:right"><%=rs.getString("ipkeum")%></td>
        <td style="color:blue;text-align:right"><%=rs.getString("chulkeum")%></td>
         <td><%if(rs.getInt("iche_gubun")==0)out.print("");else if(rs.getInt("iche_gubun")==1)out.print("이체보냄");else out.print("이체받음");%></td>
          <td><%=rs.getString("iche_id")%></td>
            </tr> 
            <%}%>
       </table><br><br> 
       <a href="menu.jsp">메뉴로 돌아가기</a>
        </div></body>
         <%} catch (Exception e) { out.print("거래내역 조회 중 문제 발생. 고객센터로 연락바랍니다. <p>" + e.getMessage()); }%>
  