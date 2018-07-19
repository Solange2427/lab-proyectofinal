package controller.reports;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
public class ReportsControllerAdd extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		UserService UsuarioService = UserServiceFactory.getUserService();
		User Usuario = UsuarioService.getCurrentUser();

		if(Usuario == null){
			resp.sendRedirect(UsuarioService.createLoginURL(req.getRequestURI()));}
		else if(UsuarioService.isUserAdmin() || MetodoAcceso(Usuario.getEmail(),req.getRequestURI())){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			try {
				
				usuarioLogeado(Usuario.getEmail());
				
				Users ul=(Users)usuarioLogeado(Usuario.getEmail());
				
				//id usuario logeado
				Long idLogin=ul.getCodigo();
				//Long idLogin2 = Long.parseLong(ul.getCodigo());
				System.out.println("este es el id   "+idLogin);
				Users id2 = pm.getObjectById(Users.class,idLogin);
				
				//para id de pedidos
				String codigo = req.getParameter("orderId");
				Long codigoLong = Long.parseLong(codigo); 
				Order fac = pm.getObjectById(Order.class,codigoLong);
				
				//para id de producto
				 Long Idproducto = fac.getProduct();
				 Product p = pm.getObjectById(Product.class,Idproducto);
				 		 
				req.setAttribute("IdLogin",id2);
				req.setAttribute("product",p);
				req.setAttribute("order",fac);
				req.getRequestDispatcher("/WEB-INF/Views/Reports/add.jsp").forward(req, resp);

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
	
	public  static final Users usuarioLogeado(String email){
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query=pm.newQuery(Users.class);
		query.setFilter("email == idParam");
		query.declareParameters("String idParam");
		
		List <Users> usuario=(List<Users>)query.execute(email);
		
		if(usuario.size()>0){
			Users u=usuario.get(0);
			return u;
		}
		pm.close();
		return null;
	}

	
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//ID DE USUARIO
		String id = req.getParameter("id");
		
		String cliente = req.getParameter("cliente");
		String ruc = req.getParameter("ruc");
		String idPedido = req.getParameter("idPedido");
		String fechaPedido = req.getParameter("fechaPedido");
		Double inversion= Double.parseDouble(req.getParameter("inversion"));	
		Double igv = Double.parseDouble(req.getParameter("igv"));
		Double total = Double.parseDouble(req.getParameter("total"));
		Double saldo = Double.parseDouble(req.getParameter("saldo"));
		String fechaUltimoPedido=req.getParameter("fechaultima");
		
		String fechaFinal = req.getParameter("fechaFinal");
	
		DateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss "); 
		
		// String fechaI=dateformat.format(fechaPedido).toString();
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		PersistenceManager pm2 = PMF.get().getPersistenceManager();
		
		Long idLong = Long.parseLong(id);

		try{
			
			Users usuario= pm.getObjectById(Users.class,idLong);
			
			double montoTotal=usuario.getMontoAdquirido()+total;
			int cantidadPedidos=((Users) usuario).getCantidadPedidos()+1;
			usuario.setMontoAdquirido(montoTotal);
			usuario.setCantidadPedidos(cantidadPedidos);
			usuario.setFechaUltimoPedido(fechaPedido);

		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
		Report reporte = new Report(idLong,cliente,ruc,idPedido,fechaPedido,inversion,igv,total,saldo,fechaFinal);
			

		try{
			pm2.makePersistent(reporte);
			}
		finally{
			pm2.close();
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

