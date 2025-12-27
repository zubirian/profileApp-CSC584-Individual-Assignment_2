<%@ page import="java.util.List" %>
<%@ page import="com.profile.model.ProfileBean" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Result</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            padding: 40px;
        }
        .card {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        h2 { text-align: center; color: #2193b0; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; }
        th { background: #2193b0; color: white; }
        button { padding: 12px; margin-top: 20px; background: #2193b0; border: none; border-radius: 8px; color: white; cursor: pointer; width: 100%; }
    </style>
</head>
<body>

<div class="card">
<h2>Search Result</h2>

<%
    List<ProfileBean> profiles = (List<ProfileBean>) request.getAttribute("profiles");
%>

<% if (profiles == null || profiles.isEmpty()) { %>
    <p style="color:red; text-align:center;">No profiles found.</p>
<% } else { %>
    <table>
        <tr>
            <th>Name</th>
            <th>Student ID</th>
            <th>Program</th>
            <th>Email</th>
            <th>Hobbies</th>
            <th>Intro</th>
        </tr>
        <% for(ProfileBean p : profiles) { %>
            <tr>
                <td><%= p.getName() %></td>
                <td><%= p.getStudentId() %></td>
                <td><%= p.getProgram() %></td>
                <td><%= p.getEmail() %></td>
                <td><%= p.getHobbies() %></td>
                <td><%= p.getIntro() %></td>
            </tr>
        <% } %>
    </table>
<% } %>

<a href="search.html"><button>Search Again</button></a>
<a href="profileForm.html"><button>Back to Home</button></a>

</div>
</body>
</html>
