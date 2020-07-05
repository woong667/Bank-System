<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image: url('https://i.pinimg.com/originals/a2/fa/86/a2fa86facb9e9ac867fd07fdd3ceeddf.jpg'); ">
<% 
String id=(String)session.getAttribute("id");
long lasttime=session.getLastAccessedTime();
long createdtime=session.getCreationTime();
long time_used=(lasttime-createdtime)/1000;
long minute=0;
if(time_used>60)
{	
	minute=time_used/60;
    time_used=time_used-(minute*60);
}
session.invalidate();
 
 %>
 <div align="center">
 <h2>로그아웃하셨습니다.</h2>
 <span style="color:blue"><%=id%></span>님이 사이트에 머문 시간은<%if(time_used<60) out.println(" "+time_used+"초입니다.");else out.println(" "+minute+"분"+time_used+"초 입니다.");  %>
 <h3>맨 처음 페이지로 가시려면 <mark>아래 그림</mark>을 클릭해주세요</h3>
 <a href="login.jsp"><img src="http://blogfiles.naver.net/20140510_249/lovepum_13996919063395DOr7_JPEG/%B0%A8%BB%E7%C7%D5%B4%CF%B4%D9.jpg" width="300" height="400"></a>
 </div>
 

</body>
</html>