package servlet;
import model.Instructor;
import model.InstructorManager;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class InstructorServlet extends HttpServlet {
    private InstructorManager manager = new InstructorManager();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            int experience = Integer.parseInt(request.getParameter("experience"));
            String phone = request.getParameter("phone");

            Instructor i = new Instructor(id, name, experience, phone);
            manager.addInstructor(i);
            response.sendRedirect("InstructorServlet");
        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            int experience = Integer.parseInt(request.getParameter("experience"));
            String phone = request.getParameter("phone");

            Instructor i = new Instructor(id, name, experience, phone);
            manager.updateInstructor(id, i);
            response.sendRedirect("InstructorServlet");
        } else if ("delete".equals(action)) {
            String id = request.getParameter("id");
            manager.deleteInstructor(id);
            response.sendRedirect("InstructorServlet");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Instructor> instructors = manager.getSortedByExperience();
        request.setAttribute("instructors", instructors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("instructorList.jsp");
        dispatcher.forward(request, response);
    }
}
