<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
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
        button { 
            padding: 12px; 
            background: #2193b0; 
            border: none; 
            border-radius: 8px; 
            color: white; 
            font-size: 16px; 
            margin-top: 20px; 
            cursor: pointer; 
            width: 100%;
        }
        button:hover { background: #176781; }
    </style>
</head>
<body>

<div class="card">
<h2>All Student Profiles</h2>

<table>
<tr>
    <th>Name</th>
    <th>Student ID</th>
    <th>Program</th>
    <th>Email</th>
    <th>Hobbies</th>
    <th>Intro</th>
</tr>

<%
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        // Load Derby Client Driver
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        // Connect to Derby database
        conn = DriverManager.getConnection(
            "jdbc:derby://localhost:1527/student_profiles",
            "APP",
            "APP"
        );

        st = conn.createStatement();
        rs = st.executeQuery("SELECT * FROM PROFILE");

        boolean hasRows = false;
        while(rs.next()) {
            hasRows = true;
%>
<tr>
    <td><%= rs.getString("NAME") %></td>
    <td><%= rs.getString("STUDENT_ID") %></td>
    <td><%= rs.getString("PROGRAM") %></td>
    <td><%= rs.getString("EMAIL") %></td>
    <td><%= rs.getString("HOBBIES") %></td>
    <td><%= rs.getString("INTRO") %></td>
</tr>
<%
        }
        if(!hasRows) {
%>
<tr><td colspan="6" style="text-align:center; color:red;">No profiles found.</td></tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
<tr><td colspan="6" style="text-align:center; color:red;">Error fetching profiles!</td></tr>
<%
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(st != null) try { st.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
</table>

<a href="profileForm.html"><button>Back to Home</button></a>
</div>

</body>
</html>
