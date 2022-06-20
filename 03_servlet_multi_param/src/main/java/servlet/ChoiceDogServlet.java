package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/choiceDog")
public class ChoiceDogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("멍멍");
		String[] dogs = req.getParameterValues("dog");
		System.out.println(Arrays.toString(dogs));

		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='UTF-8' />");
		pw.println("</head>");
		pw.println("<body>");
		for (String dog : dogs) {
			pw.println(dog + "<br />");
			pw.println("<img src ='images/" + dog + "' /> <br />");
		}
		pw.println("</body>");
		pw.println("</html>");

	}

}
