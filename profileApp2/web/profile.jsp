<%@ page import="com.profile.model.ProfileBean" %>
<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            background: white;
            width: 500px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        h2, h3 {
            text-align: center;
            color: #2193b0;
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        td {
            padding: 8px;
        }
        .label {
            font-weight: bold;
            width: 35%;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #2193b0;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background: #176781;
        }
        .secondary-btn {
            background: #2193b0;
        }
        .secondary-btn:hover {
            background: #176781;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Thank You!</h2>
    <h3>Profile Successfully Submitted</h3>

    <table>
        <tr><td class="label">Name</td><td><%= p.getName() %></td></tr>
        <tr><td class="label">Student ID</td><td><%= p.getStudentId() %></td></tr>
        <tr><td class="label">Program</td><td><%= p.getProgram() %></td></tr>
        <tr><td class="label">Email</td><td><%= p.getEmail() %></td></tr>
        <tr><td class="label">Hobbies</td><td><%= p.getHobbies() %></td></tr>
        <tr><td class="label">Introduction</td><td><%= p.getIntro() %></td></tr>
    </table>

    <a href="viewProfiles.jsp"><button class="secondary-btn">View All Students</button></a>
    <a href="search.html"><button class="secondary-btn">Search Profile by ID</button></a>
    <a href="profileForm.html"><button class="secondary-btn">Back to Home</button></a>
</div>

</body>
</html>
