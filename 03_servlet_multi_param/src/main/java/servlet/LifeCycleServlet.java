package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifeCycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LifeCycleServlet() {
		System.out.println("서블릿 요청 시 최초에 1번 생성자 호출");
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("생성되면서 최초에 1번 init 호출");
		String contextPath = config.getServletContext().getContextPath();
		System.out.println("contextPath : " + contextPath);
	}

	public void destroy() {
		System.out.println("destroy");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("service 호출");
		String method = request.getMethod();
		System.out.println("전송 방식 : " + method);
//		super.service(request, response); // service()에서 doGet, doPost 호출함
		if(method.equalsIgnoreCase("GET")) {
			doGet(request, response);
		}else {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet 호출");
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost 호출");
	}

}
