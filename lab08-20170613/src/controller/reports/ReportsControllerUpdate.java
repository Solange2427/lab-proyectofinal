package controller.reports;
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
public class ReportsControllerUpdate  extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		UserService UsuarioService = UserServiceFactory.getUserService();
		User Usuario = UsuarioService.getCurrentUser();

		if(Usuario == null){
			resp.sendRedirect(UsuarioService.createLoginURL(req.getRequestURI()));}
		else if(UsuarioService.isUserAdmin() || MetodoAcceso(Usuario.getEmail(),req.getRequestURI())){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			try {

				String codigo = req.getParameter("id");
				Long codigoLong = Long.parseLong(codigo); 
				Report reporte= pm.getObjectById(Report.class,codigoLong);
				
				req.setAttribute("reporte",reporte);
				req.getRequestDispatcher("/WEB-INF/Views/Reports/update.jsp").forward(req, resp);

			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				pm.close();
			}
		}
		else {

			try {
				req.getRequestDispatcher("/WEB-INF/Views/AccesoDenegado.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String codigo = req.getParameter("id");
		String nombreCliente = req.getParameter("nombreCliente");
		String nombreProducto = req.getParameter("nombreProducto");
		String rucCliente = req.getParameter("rucCliente");
		Double precio = Double.parseDouble(req.getParameter("precio"));
		int cantidad = Integer.parseInt(req.getParameter("cantidad"));
		String idPedido = req.getParameter("idPedido");
		Double total=precio*cantidad;
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Long codigoLong = Long.parseLong(codigo);
			
			Report factura = pm.getObjectById(Report.class,codigoLong);
			factura.setNombreCliente(nombreCliente);
			factura.setRucCliente(rucCliente);
				
		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
			resp.sendRedirect("/reports");
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

