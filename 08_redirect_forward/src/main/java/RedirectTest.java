import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/response")
public class RedirectTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service");
		super.service(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		response.sendError(405,"지원하지 않는 전송방식입니다.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		String id = request.getParameter("id");
		if (id != null && id.equals("id001")) {
			request.setAttribute("answer", id);
			response.sendRedirect("result.jsp");
		}else {
//			response.setStatus(403);
			response.setStatus(302);
			response.addHeader("Location", "index.jsp");
		}
	}

}
