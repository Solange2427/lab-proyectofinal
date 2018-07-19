package controlador.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class iniciarSession extends HttpServlet {
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
 throws IOException {

	 UserService us = UserServiceFactory.getUserService();
	 User user = us.getCurrentUser();
 	
	 
	 if(user != null){
		 resp.sendRedirect("/inicio");
 	}else{
 		resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
 	}
 }
}