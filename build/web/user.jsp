<%-- 
    Document   : user
    Created on : Jul 23, 2022, 12:10:29 PM
    Author     : roma-cervice
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User"%>
<%@page import="abstractdao.AbstractUserDao"%>
<%@page import="main.Context"%>
<%@page import="abstractdao.*"%>
<%@page import="main.*"%>
<%@page import="entity.*"%>
<%@page import="dao.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            AbstractDao dao = new AbstractDao();
            AbstractUserDao abstractUser = Context.instanceUserDao();
            User user = null;
            String name = "";
            String surname = "";
            try {
                user = abstractUser.getById(1);
            } catch (Exception e) {
                
            }
                name = user.getName();
                surname = user.getSurname();
        %>
        <div>        
            <form method="POST" action="UserController">
                <input type="hidden" name="id" value="<%=user.getId()%>"/>
                <label for="name">Name:</label>
                <input type="text" name="name" value="<%=name%>"/>
                <label for="surname">Surname:</label>
                <input type="text" name="surname" value="<%=surname%>"/>
                <br/>
                <input type="submit" value="Save">
            </form>
        </div>
    </body>
</html>
