package servlet;

import model.Feedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.*;
import java.util.*;

@WebServlet("/submitFeedback")
public class FeedbackServlet extends HttpServlet {

    private static final String FILE_PATH = "C:/Users/User/IdeaProjects/PGNO-14_Driving-School-Registration-and-Scheduling-System/src/main/webapp/data/Feedback.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String instructor = request.getParameter("instructor");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");

        Feedback feedback = new Feedback(name, email, instructor, rating, comments);

        try (PrintWriter out = new PrintWriter(new FileWriter(FILE_PATH, true))) {
            out.println(feedback.toFileString());
        }

        response.sendRedirect("listFeedback.jsp");
    }

    public static List<Feedback> readFeedbackList() throws IOException {
        List<Feedback> list = new ArrayList<>();
        Path path = Paths.get(FILE_PATH);

        if (Files.exists(path)) {
            List<String> lines = Files.readAllLines(path);
            for (String line : lines) {
                Feedback f = Feedback.fromFileString(line);
                if (f != null) {
                    list.add(f);
                }
            }
        }

        return list;
    }
}
