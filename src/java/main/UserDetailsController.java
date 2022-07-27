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
@WebServlet(name = "UserDetailsController", urlPatterns = {"/UserDetailsController"})
public class UserDetailsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("mm-dd-yyyy");
        int id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String nationality = request.getParameter("nationality");
        String phone = request.getParameter("phone");
        String jobDescription = request.getParameter("job_description");
        String beginDateString =request.getParameter("begin_date");
        String endDateString =request.getParameter("end_date");
        Date beginDate =null;
        Date endDate=null;
        try{
        beginDate = sdf.parse(beginDateString);
        endDate = sdf.parse(endDateString);
        }catch(Exception e){
            
        }

        AbstractUserDao abstractUser = Context.instanceUserDao();
        AbstractEmploymentDao employmentDao = Context.instanceEmploymentDao();
        User u = null;
        Employment e = null;
        try {
            u = abstractUser.getById(id);
            u.setName(name);
            u.setSurname(surname);
            u.setEmail(email);
            u.setNationality(nationality);
            u.setPhone(phone);
            e=u.getEmployment();
            e.setJobDescription(jobDescription);
            e.setBeginDate(beginDate);
            e.setEndDate(endDate);
            e.setId(id);
        } catch (Exception ex) {
            Logger.getLogger(UserDetailsController.class.getName()).log(Level.SEVERE, null, ex);
        }
        abstractUser.updateUser(u);
        employmentDao.updateUserEmployment(e);
        response.sendRedirect("users.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
