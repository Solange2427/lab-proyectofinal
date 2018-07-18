package controller.orders;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import controller.PMF;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import model.entity.*;

@SuppressWarnings("serial")
public class OrdersControllerAdd extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException {
			resp.setContentType("text/html");
			UserService UsuarioService = UserServiceFactory.getUserService();
			User Usuario = UsuarioService.getCurrentUser();

			if(Usuario == null){
				resp.sendRedirect(UsuarioService.createLoginURL(req.getRequestURI()));}
			else if(UsuarioService.isUserAdmin() || MetodoAcceso(Usuario.getEmail(),req.getRequestURI())){
				try {
					req.getRequestDispatcher("/WEB-INF/Views/Order/orderAdd.jsp").forward(req, resp);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
			else {

				try {
					req.getRequestDispatcher("/WEB-INF/Views/AccesoDenegado.jsp").forward(req, resp);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}		
				
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		UserService UsuarioService = UserServiceFactory.getUserService();
		User Usuario = UsuarioService.getCurrentUser();
		
		PersistenceManager       pm       =       PMF.get().getPersistenceManager(); 
	     String name= request.getParameter("name");
	     String ruc= request.getParameter("ruc");
	     String email= Usuario.getEmail();
	     Long product= Long.parseLong(request.getParameter("product"));
	     int number= Integer.parseInt(request.getParameter("number"));
	     String details= request.getParameter("details");
	    		
	     Order a = new  Order( name,ruc,email,product,number,details); 
		 pm.makePersistent(a);   
		 pm.close();
		  try {
			  request.setAttribute("order",  a);
		      //response.sendRedirect("/sendEmail?orderId="+a.getIdOrder()); 
			  response.sendRedirect("/orders/view?orderId="+a.getIdOrder());
		  } catch(Exception e){
	    	  System.err.println("error en enviar mensaje");
	    	  e.printStackTrace();
	      } PersistenceManager   pm2=PMF.get().getPersistenceManager();
		     
		     try{
					
					Product producto= pm2.getObjectById(Product.class,product);
					int montoTotal=producto.getContador()+number;
					producto.setContador(montoTotal);
					

				}
				catch(Exception e){
					System.out.println("Se produjo un Error");
				}
				finally{
					pm2.close();
				}
		  
		  
	} 
	
	
	//ACL
	@SuppressWarnings("unchecked")
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
