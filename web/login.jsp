<%-- 
    Document   : login
    Created on : Jul 28, 2022, 8:09:08 AM
    Author     : roma-cervice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="assets/users.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
        <form action="LoginController" method="POST">
            <div class="container" style="margin-top: 240px;margin-left: 420px">
                <!-- Email input -->
                <div class="col-6 form-outline mb-4">
                    <label class="form-label" for="form2Example1">Email address</label>
                    <input name="email" type="email" id="form2Example1" class="form-control" />
                </div>

                <!-- Password input -->
                <div class="col-6 form-outline mb-4">
                    <label class="form-label" for="form2Example2">Password</label>
                    <input name="password" type="password" id="form2Example2" class="form-control" />
                </div>

                <div class="col-6 form-outline mb-4">
                    <label name="label" style="display:none;color:red">Invalid email or password.</label>
                </div>
                <!-- Submit button -->
                <button type="submit" class="col-2 btn btn-primary btn-block mb-4" style="margin-left: 170px">
                   Login
                </button>
            </div>
        </form>
    </body>
</html>
