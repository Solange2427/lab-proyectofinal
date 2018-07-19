package controller.access;
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
public class AccessControllerAdd extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		resp.setContentType("text/html");
		UserService UsuarioService = UserServiceFactory.getUserService();
		User Usuario = UsuarioService.getCurrentUser();

		if(Usuario == null){
			resp.sendRedirect(UsuarioService.createLoginURL(req.getRequestURI()));}
		else if(UsuarioService.isUserAdmin() || MetodoAcceso(Usuario.getEmail(),req.getRequestURI())){

			PersistenceManager pm = PMF.get().getPersistenceManager();

			Query query = pm.newQuery(Role.class);
			List<Role> arrayRole = (List<Role>)query.execute("select from Role");

			Query query1 = pm.newQuery(Resource.class);

			List<Resource> arrayRecurso = (List<Resource>)query1.execute("select from Recurso");

			try {
				req.setAttribute("arrayRole",arrayRole);
				req.setAttribute("arrayRecurso",arrayRecurso);
				req.getRequestDispatcher("/WEB-INF/Views/Access/add.jsp").forward(req, resp);

				query.closeAll();
				query1.closeAll();

			} catch (ServletException e) {
				System.out.println("Error");
				
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

		String idRecurso = req.getParameter("recurso");
		String idRole = req.getParameter("role");

		PersistenceManager pm = PMF.get().getPersistenceManager();

		try{
			Long idRecursoL = Long.parseLong(idRecurso);
			Long idRoleL = Long.parseLong(idRole);

			Query query = pm.newQuery(Access.class);
			query.setFilter("idRole == idParam && idRecurso == idParam2");
			query.declareParameters("Long idParam , Long idParam2");

			List<Access> array = (List<Access>) query.execute(idRoleL,idRecursoL);

			if(array.size()> 0 ){
				resp.getWriter().print("2");
			}

			else {
				Access acceso = new Access(idRoleL,idRecursoL,true);
				pm.makePersistent(acceso);
				query.closeAll();
				resp.getWriter().print("1");
			}

		}
		catch(Exception e){
			System.out.println("Se produjo un Error"+e.getMessage());
		}
		finally{
			pm.close();
		}
		resp.sendRedirect("/access/add");

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

