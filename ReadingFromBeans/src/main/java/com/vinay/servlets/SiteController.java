package com.vinay.servlets;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SiteController
 */
@WebServlet("/SiteController")
public class SiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SiteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "login":
				request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "loginSubmit":
			authenticate(request, response);
			break;

		default:
			break;
		}
	
	}

	public void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		if(userName.equals("vinay") && password.equals("drago")) {
			// Invalidating Any Session
			request.getSession().invalidate();
			HttpSession newSession = request.getSession(true);
			newSession.setMaxInactiveInterval(300);
			newSession.setAttribute("username", userName);
			String encode =response.encodeURL(request.getContextPath());
			response.sendRedirect(encode+"/MemberAreaController?action=memberArea");
		}else {
			response.sendRedirect(request.getContextPath()+"/SiteController?action=login");
		}
	}

}
