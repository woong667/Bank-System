<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*"
        import="java.sql.Date" %> 
    <%
    request.setCharacterEncoding("UTF-8");
    String id=(String)session.getAttribute("id");
    String pw=null;
    String name=null;
    String phone=null;
    int age=0;
    int balance=0;
    Date insertdate=null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String uid = "travis";  String pass = "scott"; 
    
    try{ 
    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    	Connection conn = DriverManager.getConnection(url, uid, pass);
    	String sql =  "select * from bankmember_ where id='"+id+"'"; 
    	PreparedStatement pre = conn.prepareStatement(sql); 
    	ResultSet rs = pre.executeQuery();
    	rs.next();
    	
    		pw=rs.getString("pw");
    	    name=rs.getString("name");
    		phone=rs.getString("phone");
    		age=rs.getInt("age");
    		balance=rs.getInt("balance");
    		insertdate=rs.getDate("insertdate");
    	
    	
    	String sql2=  "insert into bankmember_tal values('"+id+"','"+pw+"','"+name+"','"+phone+"',"+age+","+balance+",'"+insertdate+"',sysdate)";
        Statement cre = conn.createStatement();
        cre.executeUpdate(sql2); 
        String sql3=  "delete from bankmember_ where id='"+id+"'";
        Statement cre2 = conn.createStatement();
        cre2.executeUpdate(sql3);
        session.invalidate();
        %>
        <script>
        alert("탈회처리되었습니다.하지만 신분증을 가지고 은행에 오시면 잔액을 인출하실 수 있습니다.다음에 또 뵙기를 바랍니다.(첫화면으로 이동합니다.)");
        location.href="login.jsp";
        </script>
        <%} catch(Exception e) { 
            out.print("탈회과정중 문제 발생<br>빠른 해결위해 노력하겠습니다!! <p>"+e.getMessage()+"<p>");%>
            <img src="C:\Users\User\Desktop\kk.jpg" width="300" height="200" alt="화난 뚱보">
            <%} %>