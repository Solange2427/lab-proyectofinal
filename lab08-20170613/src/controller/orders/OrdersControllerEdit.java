package controller.orders;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import model.entity.*;

@SuppressWarnings("serial")
public class OrdersControllerEdit extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		UserService UsuarioService = UserServiceFactory.getUserService();
		User Usuario = UsuarioService.getCurrentUser();

		if(Usuario == null){
			resp.sendRedirect(UsuarioService.createLoginURL(req.getRequestURI()));}
		else if(UsuarioService.isUserAdmin() || MetodoAcceso(Usuario.getEmail(),req.getRequestURI())){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			try{
			    Key  k =  KeyFactory.createKey(Order.class.getSimpleName(), new Long(req.getParameter("orderId")).longValue());
					  Order a =  pm.getObjectById(Order.class, k);  
					  req.setAttribute("order", a);  
				      RequestDispatcher dispatcher =  getServletContext().getRequestDispatcher("/WEB-INF/Views/Order/orderEdit.jsp"); 
				      dispatcher.forward(req, resp); 
			   }catch(Exception e){
				   System.out.print("error en enviar id");
			   }
			finally{
				pm.close();
			}
		}
		else {

			try {
				req.getRequestDispatcher("/WEB-INF/Views/Errors/Error1.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}	  
	 public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		 final PersistenceManager       pm       =       PMF.get().getPersistenceManager(); 
		   try{
		    Key  k =  KeyFactory.createKey(Order.class.getSimpleName(), new Long(request.getParameter("orderId")).longValue());
				  Order a =  pm.getObjectById(Order.class, k);  
				  request.setAttribute("order", a);  
			      RequestDispatcher dispatcher =  getServletContext().getRequestDispatcher("/WEB-INF/Views/Order/orderEdit.jsp"); 
			      dispatcher.forward(request, response); 
		   }catch(Exception e){
			   System.out.print("error en enviar id");
		   }
			      
			 if(request.getParameter("id")!=null){
			    try{  Key  j =  KeyFactory.createKey(Order.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
				  Order b =  pm.getObjectById(Order.class, j); 
				  b.setName(request.getParameter("name"));
				  b.setRuc(request.getParameter("ruc"));
				  b.setProduct(Long.parseLong((request.getParameter("product"))));
				  b.setNumber(Integer.parseInt(request.getParameter("number")));
				  b.setDetails(request.getParameter("details"));
			       }
			      catch(Exception e){
			   	   System.out.print("error en modificar");
			      }
			      finally{
			    	  pm.close();
			    	response.sendRedirect("/orders/view?orderId="+request.getParameter("id"));  
			      }
			      }	  
	 } 
	private boolean MetodoAcceso(String email,String url){

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Users.class);
		query.setFilter("email == idParam");
		query.declareParameters("String idParam");

		List<Users> u = (List<Users>) query.execute(email);

		if(u.size()> 0 ){

			Users usuario = u.get(0);
			Query query1 = pm.newQuery(Resource.class);
			query1.setFilter("url == idParam");
			query1.declareParameters("String idParam");

			List<Resource> listResource = (List<Resource>)query1.execute(url);

			if(listResource.size() > 0 ){

				Resource recurso = listResource.get(0);
				Long idRol = usuario.getIdRol();
				Long idRecurso = recurso.getId();

				Query query2 = pm.newQuery(Access.class);
				query2.setFilter("idRole == idParam && idRecurso == idParam2");
				query2.declareParameters("Long idParam , Long idParam2");
				List<Access> a = (List<Access>)query2.execute(idRol,idRecurso);

				if(a.size()>0){
					Access acceso = a.get(0);
					if(acceso.isEstado()){
						pm.close();
						return true;
					}
				}
			}
		}
		pm.close();
		return false;
	}
}

