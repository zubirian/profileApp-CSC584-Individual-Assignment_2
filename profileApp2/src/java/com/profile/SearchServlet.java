package com.profile;

import com.profile.model.ProfileBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    private static final String DB_URL =
            "jdbc:derby://localhost:1527/student_profiles";
    private static final String DB_USER = "APP";
    private static final String DB_PASS = "APP";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        List<ProfileBean> profiles = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                    DB_URL, DB_USER, DB_PASS);

            String sql = "SELECT * FROM PROFILE WHERE STUDENT_ID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setName(rs.getString("NAME"));
                profile.setStudentId(rs.getString("STUDENT_ID"));
                profile.setProgram(rs.getString("PROGRAM"));
                profile.setEmail(rs.getString("EMAIL"));
                profile.setHobbies(rs.getString("HOBBIES"));
                profile.setIntro(rs.getString("INTRO"));
                profiles.add(profile);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        request.setAttribute("profiles", profiles);
        request.getRequestDispatcher("searchResult.jsp")
               .forward(request, response);
    }
}
