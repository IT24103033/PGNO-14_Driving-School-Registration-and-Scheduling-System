package servlet;

import model.Feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/deleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {

    private static final String FILE_PATH = "C:/Users/User/IdeaProjects/PGNO-14_Driving-School-Registration-and-Scheduling-System/src/main/webapp/data/Feedback.txt";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int indexToDelete = Integer.parseInt(request.getParameter("index"));

        List<Feedback> feedbackList = FeedbackServlet.readFeedbackList();
        if (indexToDelete >= 0 && indexToDelete < feedbackList.size()) {
            feedbackList.remove(indexToDelete);
        }

        try (PrintWriter writer = new PrintWriter(new FileWriter(FILE_PATH))) {
            for (Feedback f : feedbackList) {
                writer.println(f.toFileString());
            }
        }

        // ✅ Redirect with success flag
        response.sendRedirect("listFeedback.jsp?deleted=true");
    }
}
