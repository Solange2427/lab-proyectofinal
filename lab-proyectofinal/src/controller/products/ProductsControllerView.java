package controller.products;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import controller.PMF;
import model.entity.*; 
 
@SuppressWarnings("serial") 

public class ProductsControllerView extends HttpServlet {    
	public void doGet(HttpServletRequest request, HttpServletResponse response)    
			throws ServletException, IOException { 
		
final PersistenceManager pm = PMF.get().getPersistenceManager();
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Views/Products/update.jsp");
		Key k = KeyFactory.createKey(Product.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		Product a = pm.getObjectById(Product.class, k);
		
		request.setAttribute("producto", a);
		rd.forward(request, response);
		
		}   
	} 