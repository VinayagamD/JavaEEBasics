## This repository is used to learn about JEE Servlets and JSP

![J2EE](http://www.agiletec.in/images/portfolio/J2ee.jpg)<br>
![Servlet](http://www.i2gether.com/img/ourworks/servlets-logo.png) <br>
![JSP](https://www.javatpoint.com/images/jsp/jsp2.jpg) <br>
![Tomcat](https://1.bp.blogspot.com/-B2viYmDRXhk/W1cPJPUMr1I/AAAAAAAAxoc/93Eg0eotr8MFBFhIfkqhB1yx0DZ4pvDuwCLcBGAs/s728-e100/apache-tomcat-server-software-download-min.png)<br>
![Eclipse](https://www.eclipse.org/artwork/images/v2/eclipse-mp-built-800x274.png)<br>
![Maven](https://i.pinimg.com/originals/cf/cb/07/cfcb073f7a75e78e66d8c650554863c3.png)
<hr>

### Environment

* [**JDK8**](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [**EclipseJEE**](https://www.eclipse.org/downloads/packages/release/2019-03/rc1)
* [**Maven**](https://maven.apache.org/download.cgi)
* [**Tomcat9**](https://tomcat.apache.org/download-90.cgi)

<hr>

**Below Two Dependencises is must in pom**

```
<!-- https://mvnrepository.com/artifact/javax.servlet.jsp/javax.servlet.jsp-api -->
	<dependency>
		<groupId>javax.servlet.jsp</groupId>
		<artifactId>javax.servlet.jsp-api</artifactId>
		<version>2.3.3</version>
		<scope>provided</scope>
	</dependency>

<!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
	<dependency>
		<groupId>javax.servlet</groupId>
		<artifactId>javax.servlet-api</artifactId>
		<version>4.0.1</version>
		<scope>provided</scope>
	</dependency>
```
----------
### Below Are two type of servlet mapping

* WebDescriptor Based

```
<servlet>
  	<servlet-name>HelloWorld</servlet-name>
  	<display-name>HelloWorld</display-name>
  	<description></description>
  	<servlet-class>org.vinay.servletsHelloWorld<servlet-class>
</servlet>
<servlet-mapping>
  	<servlet-name>HelloWorld</servlet-name>
  	<url-pattern>/HelloWorld</url-pattern>
</servlet-mapping>
```	
* AnnontationBased
	```
	@WebServlet("/Hello")
	```
----------
* Beans
  * Declaration
    ```
        <jsp:useBean id="user" class="com.vinay.beans.User" scope="session"></jsp:useBean>
    ```
  * Setting bean
    ```
        <jsp:setProperty property="firstName" name="user" value="abc"/> <br>
        <jsp:setProperty property="lastName" name="user" value="xyz"/><br>
    ```
   * Getting Bean
    ```
        FirstName: <jsp:getProperty property="firstName" name="user"/> <br>
        LastName: <jsp:getProperty property="lastName" name="user"/>
    ```
   * Using Request Dispatcher
    ```
        <%
	        request.getRequestDispatcher("getRequestProperty.jsp").forward(request, response);
        %>
    ```
  * Beans With Web Forms
    ```
        <form action="getSessionProperty.jsp" method="post">
             First Name: <input type="text" name="firstName" value='<jsp:getProperty property="firstName" name="user"/>'> <br>
            Last Name: <input type="text" name="lastName" value='<jsp:getProperty property="lastName" name="user"/>'> <br>

            <input type="submit" value="Submit">
        </form>
    ```
  * Accessing Web Form Beans _Very Important_  
    ```
        <jsp:setProperty property="*" name="user"/>
    ```
----------
 * Session Management
   * Session
    ```Java
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		if(userName.equals("vinay") && password.equals("drago")) {
			// Invalidating Any Session
			request.getSession().invalidate();
			HttpSession newSession = request.getSession(true);
			newSession.setMaxInactiveInterval(300);
			response.sendRedirect("memberArea.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	}
    ```
    * Cookie
        * Write Cookie in Servlet
            ```Java
                @Override
	            protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		            String userName = request.getParameter("username");
		            String password = request.getParameter("password");
		            if(userName.equals("vinay") && password.equals("drago")) {
			            // Invalidating Any Session
			            request.getSession().invalidate();
			            HttpSession newSession = request.getSession(true);
			            newSession.setMaxInactiveInterval(300);
			            Cookie cUserName = new Cookie("username", userName);
			            response.addCookie(cUserName);
			            response.sendRedirect("memberArea.jsp");
		            }else {
			            response.sendRedirect("login.jsp");
		            }
	            }
            ```
        * Read Cookie in JSP
            ```JSP
                <%
	                String username = null, sessionID = null;
	                Cookie[] cookies = request.getCookies();
	                if(cookies != null){
		                for(Cookie cookie: cookies){
			                if(cookie.getName().equals("username"))
				            username = cookie.getValue();
			                if(cookie.getName().equals("JSESSIONID"))
				            sessionID = cookie.getValue();
		                }
	                }
	                if(sessionID==null || username == null){
		                response.sendRedirect("login.jsp");
	                }
                %>
                UserName : <%=username %> <br>
                Current Session : <%=sessionID %> <br>
            ```
        * Logout Via Cookie
            ```JSP
                <form action="<%=request.getContextPath()%>/MemberAreaController" method="get">
	                <input type="hidden" name="action"  value="destroy">
	                <input type="submit" value="Logout">
                </form>
            ```
            ```Java
                @Override
	            protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		            String action = request.getParameter("action");
		            switch (action) {
		                case "destroy":
			                request.getSession().invalidate();
			                Cookie[] cookies = request.getCookies();
			                for(Cookie cookie: cookies) {
				                if(cookie.getName().equals("username")) {
					                cookie.setValue(null);
					                cookie.setMaxAge(0);
					                response.addCookie(cookie);
				                }
			                }
			                response.sendRedirect("login.jsp");
			            break;

		                default:
			            break;
		            }
	            }
            ```
    * Logout Using Session
        
        * Setting the session is servlet
        
        ```Java
            @Override
	        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        String userName = request.getParameter("username");
		        String password = request.getParameter("password");
		        if(userName.equals("vinay") && password.equals("drago")) {
			        // Invalidating Any Session
			        request.getSession().invalidate();
			        HttpSession newSession = request.getSession(true);
			        newSession.setMaxInactiveInterval(300);
			        newSession.setAttribute("username", userName);
			        response.sendRedirect("memberArea.jsp");
		        }else {
			        response.sendRedirect("login.jsp");
		        }
	        }
        ```
        
        * Accessing session via jsp
        
        ```JSP
            <%
	            String username = null,sessionId = null;
	            if(request.getSession().getAttribute("username") == null){
		            response.sendRedirect("login.jsp");
	            }else{
		            username = request.getSession().getAttribute("username").toString();
		            sessionId = request.getSession().getId();
	            }
            %>
        ```
        
        * Removing session via servlet
        ```Java
            @Override
	        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        String action = request.getParameter("action");
		        switch (action) {
		            case "destroy":
			            request.getSession().invalidate();
			            response.sendRedirect("login.jsp");
			        break;

		            default:
			        break;
		        }
	        }
        ```

    * Servlet Filter

        ```Java
            @WebFilter("/MemberAreaController")
            public class MemberAreaFilter implements Filter {
                
                public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		            HttpServletRequest request = (HttpServletRequest)req;
		            HttpServletResponse response =(HttpServletResponse)res;
		            if(request.getSession().getAttribute("username") == null) {
			            response.sendRedirect(request.getContextPath()+"/   SiteController?action=login");
		            }else {
			            chain.doFilter(req, res);
		            }
	            }
            
            }
        ```

----------

### Below List of Topic Covered

* Basic Setup
* Create Basic Project
* Servlets
  * Setup
  * Creation
  * Lifecycle
* JSP
  * Setup
  * Creation
  * Expressions
  * Scriplets
  * Declaration
  * Comments
  * Directive
  * Include File
  * Import Files and Class
  * Forward Request
  * Redirect Response
  * Implicit Object
* DeploymentDescriptor
  * web.xml
  * Annontations
  * JSP
* MVC Based Application
  * Setup
  * JSP Page
  * Servlet Controller
  * Page Mapping with href
* WebForms
  * Forms Using JSP
  * Post Request Forms To Servlet
* Beans
  * Overview
  * Scopes
    * application
    * session
    * request
    * page
  * WebForms
  * Session Management
    * Session
    * Cookie
        * Write Cookie in Servlet
            ```Java
                Cookie cUserName = new Cookie("username", userName);
			    response.addCookie(cUserName);
            ```
        * Read Cookie in JSP
            ```JSP
                String username = null, sessionID = null;
	            Cookie[] cookies = request.getCookies();
	            if(cookies != null){
		            for(Cookie cookie: cookies){
			            if(cookie.getName().equals("username"))
				        username = cookie.getValue();
			            if(cookie.getName().equals("JSESSIONID"))
				        sessionID = cookie.getValue();
		            }
	            }
            ```
        * Logout Using Cookie
    * Logout Using Session
        * Setting the session is servlet
        * Accessing session via jsp
        * Removing session via servlet
    * Organinsing
        * Remove web.xml
        * Set the project facet dynamic web module to version > 3.0
        * Managing URL with servlet properly
    * Handling Session Without Cookies
        ```Java
            String encode =response.encodeURL(request.getContextPath());
        ```
    * Servlet Filter
        * Creating Filter
        * Adding Controller URL Pattern
        * Setting Up Logic