<%@page import="com.learn.iut_ecommerce.entities.User"%>
<%
   

User user=(User)session.getAttribute("current-user");
if(user==null)
{

session.setAttribute("message", "You are not logged in!!!");

response.sendRedirect("login.jsp");
return;
}
else{
 if(user.getUserType().equals("admin"))
 {
session.setAttribute("message", "You are not welcomed here!!!");

response.sendRedirect("login.jsp");
return;

}

if(user.getUserType().equals("seller"))
 {
session.setAttribute("message", "You are not welcomed here!!!");

response.sendRedirect("login.jsp");
return;

}

} 
    
    
    
    
    
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buyer page</title>
    </head>
    <body>
        <h1>normal user panel</h1>
    </body>
</html>
