<%-- 
    Document   : users
    Created on : Jul 24, 2022, 9:16:14 AM
    Author     : roma-cervice
--%>

<%@page import="java.lang.Exception"%>
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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/users.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="assets/users.js"></script>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            List<User> userList = new ArrayList<User>();
            AbstractUserDao abstractUser = Context.instanceUserDao();
            Class.forName("com.mysql.jdbc.Driver");
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            userList = abstractUser.getByNameAndSurname(name, surname);
            if (request.getParameter("delete") != null && request.getParameter("delete").equals("Delete")) {
                int i = Integer.valueOf(request.getParameter("id"));
                abstractUser.removeUser(i);
                response.sendRedirect("users.jsp");
            }
            if (request.getParameter("edit") != null && request.getParameter("edit").equals("Edit")) {
                request.getRequestDispatcher("userDetails.jsp").forward(request, response);
            }
        %>
        <div class="search">        
            <form method="GET" action="users.jsp">
                <input class="input" type="text" name="name" id="name" value="" placeholder="Name">
                <input class="input" type="text" name="surname" value="" placeholder="Surname">
                <button title="Search" class="operations_button" type="submit" name="search" id="search" value="Search">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>



        <div class="container">
            <div class="div_table">
                <table class="table">
                    <thead class="thead-dark">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Nationality</th>
                    <th>Operations</th>
                    </thead>
                    <tbody>
                        <%for (User u : userList) {%>
                        <tr>
                            <td><%=u.getId()%></td>
                            <td><%=u.getName()%></td>
                            <td><%=u.getSurname()%></td>
                            <td><%=u.getNationality()%></td>
                            <td>
                                <form action="users.jsp" method="GET">
                                    <button type="submit" name="edit" title= "Edit" value="Edit" class="operations_button">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button type="button" name="delete" data-toggle="modal" data-target="#exampleModal" onclick="userId(<%=u.getId()%>)" class="operations_button">
                                        <i class="far fa-trash-alt"></i>  
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Are you sure ? </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <form action="users.jsp" method="GET">
                                        <input type="hidden" id="idForDelete" name="id" value="" placeholder="Name"/>
                                        <button type="submit" name="delete" value="Delete" class="btn btn-danger">Delete</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
