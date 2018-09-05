package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.operator;

public class login_filter implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest req1, ServletResponse resp1, FilterChain chain)
			throws IOException, ServletException {
		
		 HttpServletRequest req = (HttpServletRequest) req1;
		 HttpServletResponse resp = (HttpServletResponse) resp1;
		 HttpSession session = req.getSession();
		 operator user = (operator) session.getAttribute("user");
		 String path=req.getRequestURI();
		 if(check(path)) {
			 chain.doFilter(req, resp);
		 }else {
			 if(user==null) {
				 resp.sendRedirect(req.getContextPath()+"/login.jsp");
			 }else {
				 chain.doFilter(req, resp);
			 }
		 }
		 
//		 if(path.indexOf("login")>0) {
//			 chain.doFilter(req1, resp1);
//		 }else if(path.indexOf("index")>0){
//			 if(name !=null) {
//				 chain.doFilter(req1, resp1);
//			 }else {
//				 resp.sendRedirect("shopMall/login.jsp");
//			 }
//		 }else {
//			 if(name !=null) {
//				 chain.doFilter(req1, resp1);
//			 }else {
//				 req.setAttribute("login", "login");
//				 chain.doFilter(req1, resp1);
//			 }
//		 }
		 	 
	}
	
private boolean check(String path) {
		for(int i=0;i<remove.length;i++) {
			if(path.endsWith(remove[i])) return true;
		}
		return false;
	}

//	private Set<String> prefixIignores = new HashSet<String>();
//	if(canIgnore(req)) chain.doFilter(req1, resp1);;
	
	String []remove = new String[0];
	public void init(FilterConfig init) throws ServletException {
		remove=init.getInitParameter("remove").split(",");
	}

}
