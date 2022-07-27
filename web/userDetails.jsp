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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/users.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            try {
                ErrorController.checkRequest(request, response);
            } catch (Exception e) {
                response.sendRedirect("error.jsp");
                return;
            }
            AbstractDao dao = new AbstractDao();
            AbstractUserDao abstractUser = Context.instanceUserDao();
            int i = 1;

            try {
                i = Integer.valueOf(request.getParameter("id"));
            } catch (Exception e) {
                response.sendRedirect("error.jsp");
                return;
            }
            User user = null;
            Employment e = null;
            try {
                user = abstractUser.getById(i);
                e = user.getEmployment();
            } 
            catch (Exception e1) {
                response.sendRedirect("error.jsp");
                return;
            }
        %>
        <div class="container" style="margin-top: 40px">
            <form method="POST" action="UserDetailsController" class="row g-3">
                <input type="hidden" name="id" value="<%=user.getId()%>"/>
                <div class="col-md-6">
                    <label for="inputName" class="form-label">Name</label>
                    <input type="text" class="form-control" name="name" value="<%=user.getName()%>" id="inputName">
                </div>
                <div class="col-md-6">
                    <label for="inputSurname" class="form-label">Surname</label>
                    <input type="text" class="form-control" name="surname" value="<%=user.getSurname()%>" id="inputSurname">
                </div>
                <div class="col-12">
                    <label for="inputEmail" class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" id="inputEmail">
                </div>
                <div class="col-12">
                    <label for="Nationality" class="form-label">Nationality</label>
                    <input type="text" class="form-control" name="nationality" value="<%=user.getNationality()%>" id="Nationality">
                </div>
                <div class="col-md-6">
                    <label for="inputPhone" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" name="phone" value="<%=user.getPhone()%>" id="inputPhone">
                    <br>
                </div>
                <div class="col-md-4">
                    <label for="inputState" class="form-label">State</label>
                    <select id="inputState" class="form-select">
                        <option selected>Choose...</option>
                        <option>...</option>
                    </select>
                </div>

                <div class="col-12 btn-group" role="group" aria-label="Basic outlined example">
                    <input type="button" class="btn btn-outline-primary" value="Employment">
                    <input type="button" class="btn btn-outline-primary" value="Skills">
                    <br>
                </div>

                <div class="col-12 container">
                    <br>
                    <!--Employment-->

                    <div class="col-md-6" id="employment" style="border:1px solid black">
                        <div>
                            <br>
                            <label for="inputName" class="form-label">Job Description</label>
                            <textarea type="text" class="form-control" name="job_description"><%=e.getJobDescription()%></textarea>
                        </div>
                        <div  class="md-form md-outline" inline="true">
                            <br>
                            Begin Date<input placeholder="Type Begin Date" type="date" name="begin_date" class="form-control" value="<%=e.getBeginDate()%>">
                        </div>
                        <div  class="md-form md-outline" inline="true">
                            <br>
                            End Date<input placeholder="Type End Date" type="date" name="end_date" class="form-control" value="<%=e.getEndDate()%>">
                        </div>
                        <br>
                    </div>

                    <!--Skills-->

                    <div class="col-md-6" id="skills">

                    </div>  
                </div>

                <div id="back">
                    <br>
                    <button name="back" value="Back" class="btn btn-danger">
                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                    </button>
                </div>    
                <div id="success">
                    <br>
                    <button type="submit" name="save" value="Save" class="btn btn-success">
                        <i class="fas fa-save"></i>
                    </button>
                </div>
            </form>
        </div>

    </body>
</html>
