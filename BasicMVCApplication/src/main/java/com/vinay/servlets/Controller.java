package com.vinay.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("page");
		switch(param){
		case "login":
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			break;
		case "signup":
			getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
			break;
		case "about":
			getServletContext().getRequestDispatcher("/about.jsp").forward(request, response);
			break;
		default:
			getServletContext().getRequestDispatcher("/notfound.jsp").forward(request, response);
		}
		
	}


}
