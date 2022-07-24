<%-- 
    Document   : users
    Created on : Jul 24, 2022, 9:16:14 AM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%      Class.forName("com.mysql.jdbc.Driver");
                AbstractUserDao abstractUser = Context.instanceUserDao();
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                List<User> userList = abstractUser.getByNameAndSurname(name, surname);
        %>
        <div>        
            <form method="GET" action="users.jsp">
                <label for="name">Name:</label>
                <input type="text" name="name" value=""/>
                <label for="surname">Surname:</label>
                <input type="text" name="surname" value=""/>
                <br/>
                <input type="submit" name="search" value="Search">
            </form>
        </div>


        <div>
            <table>
                <thead>
                <th>Name</th>
                <th>Surname</th>
                </thead>
                <tbody>
                    <%for (User u : userList) {%>
                    <tr>
                        <td><%=u.getName()%></td>
                        <td><%=u.getSurname()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
