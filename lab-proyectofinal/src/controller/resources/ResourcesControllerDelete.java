package controller.resources;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import controller.PMF;
import model.entity.*;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;

@SuppressWarnings("serial")
public class ResourcesControllerDelete extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		UserService UsuarioService = UserServiceFactory.getUserService();
		User Usuario = UsuarioService.getCurrentUser();

		if(Usuario == null){
			resp.sendRedirect(UsuarioService.createLoginURL(req.getRequestURI()));}
		else if(UsuarioService.isUserAdmin() || MetodoAcceso(Usuario.getEmail(),req.getRequestURI())){

			String id = req.getParameter("id");
			Long idLong = Long.parseLong(id);
			PersistenceManager pm = PMF.get().getPersistenceManager();

			try{
				Query query = pm.newQuery(Resource.class);
				query.setFilter("id == idParam");
				query.declareParameters("Long idParam");
				query.deletePersistentAll(idLong);
				query.closeAll();
			}
			finally{
				pm.close();
			}
			resp.sendRedirect("/resources");}
		else {

			try {
				req.getRequestDispatcher("/WEB-INF/Views/AccesoDenegado.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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

