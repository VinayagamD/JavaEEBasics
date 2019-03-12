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

* WebDescriotr Based

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