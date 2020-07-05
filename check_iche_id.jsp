<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
  request.setCharacterEncoding("UTF-8");
  String susin=request.getParameter("friend");
  String money=request.getParameter("iche_money");
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  String uid = "travis";  String pass = "scott";
  String sql="select name from bankmember_ where id=?";
  try{
    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    	Connection conn = DriverManager.getConnection(url, uid, pass);
    	PreparedStatement pre = conn.prepareStatement(sql);
    	pre.setString(1,susin);
    	ResultSet rs = pre.executeQuery();
    	if(rs.next()) //있으면 if문 안으로.
    	{  %>
    	<script>
    	var answer=confirm("<%=susin%>(<%=rs.getString("name")%>)님께 <%=money%>를 이체하시겠습니까?");
    	if(answer==true)
    		location.href="iche_iu.jsp?name=<%=susin%>&money=<%=money%>";
    	else
    		location.href="iche.jsp";
    	</script>
    	<% }else
    	{ %>
    	<script>
    	alert("없는 수신인 id입니다. 다시 입력해주세요.");
    	location.href="iche.jsp";
    	</script>	
    <% 	}
    	
    	
	 } catch (Exception e) { out.print("아이디 유무 체크 진행 중 오류가 발생했습니다. 긴급문의: 000-1111-9999 <p>" + e.getMessage()); } %>
    		