package com.mountblue.servlets;

import java.io.IOException;
import java.util.ArrayList;
import com.mountblue.dao.RequestDao;
import com.mountblue.model.Request;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({ "/dashboard", "/archive", "/active" })
public class DashboardServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	  String action = request.getParameter("action");
          int id = Integer.parseInt(request.getParameter("id"));
          if ("archive".equals(action)) {
              RequestDao.updateStatus(id, false);
          } 
          else if ("activate".equals(action)) {
              RequestDao.updateStatus(id, true);
          }
        HttpSession session=request.getSession();       
        ArrayList<Request> requests = RequestDao.getRequestsData();
        session.setAttribute("requests", requests);
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

}
