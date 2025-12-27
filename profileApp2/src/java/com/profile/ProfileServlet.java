package com.profile;

import com.profile.model.ProfileBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    private static final String DB_URL =
            "jdbc:derby://localhost:1527/student_profiles";
    private static final String DB_USER = "APP";
    private static final String DB_PASS = "APP";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form data
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        // Create bean
        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);

        // Insert into DB
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                    DB_URL, DB_USER, DB_PASS);

            String sql = "INSERT INTO PROFILE "
                    + "(NAME, STUDENT_ID, PROGRAM, EMAIL, HOBBIES, INTRO) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, studentId);
            ps.setString(3, program);
            ps.setString(4, email);
            ps.setString(5, hobbies);
            ps.setString(6, intro);

            ps.executeUpdate();

            ps.close();
            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        // Forward to profile.jsp
        request.setAttribute("profile", profile);
        request.getRequestDispatcher("profile.jsp")
               .forward(request, response);
    }
}
