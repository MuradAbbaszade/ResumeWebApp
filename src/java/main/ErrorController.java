/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import abstractdao.AbstractEmploymentDao;
import abstractdao.AbstractUserDao;
import entity.Employment;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 *
 * @author roma-cervice
 */
@WebServlet(name = "ErrorController", urlPatterns = {"/ErrorController"})
public class ErrorController {
    public static void checkRequest(HttpServletRequest request,HttpServletResponse response){
        if(request.getParameter("id").trim().isEmpty() && request.getParameter("id")!=null){
            throw new IllegalArgumentException();
        }
    }

    
}
