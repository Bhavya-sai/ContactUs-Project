package com.mountblue.servlets;

import java.io.IOException;
import java.util.List;

import com.mountblue.dao.RequestDao;
import com.mountblue.dao.UserDao;
import com.mountblue.model.Request;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	        String email = request.getParameter("email");
    	        String password = request.getParameter("password");

    	        boolean isValidUser = false;
    			try {
    				isValidUser = UserDao.validateAdmin(email, password);
    			} catch (ClassNotFoundException e) {
    				e.printStackTrace();
    			}

    	        if (isValidUser) {
    	            HttpSession session = request.getSession();
    	            List<Request> requests = RequestDao.getRequestsData();
    	            session.setAttribute("requests", requests);
    	            session.setAttribute("email", email);
    	            response.sendRedirect("dashboard.jsp");
    	        } else {
    	            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
    	            request.getRequestDispatcher("login.jsp").forward(request, response);
    	        }
    }
}
