## This repository is used to learn about JEE Servlets and JSP

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
    * Read And Write Cookie
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