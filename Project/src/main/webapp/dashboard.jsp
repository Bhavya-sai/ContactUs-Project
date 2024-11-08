<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mountblue.model.Request,java.util.*" %>


<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
            color: #333333;
            margin: 0;
            padding: 0;
        }
        .dashboard-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }
        h2 {
            color: #333333;
            margin-bottom: 30px;
            text-align: center;
        }
        .logout-button {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            position: absolute;
            top: 20px;
            right: 30px;
        }
        .logout-button:hover {
            background-color: #e53935;
        }
        .table-container {
            width: 80%;
            margin-top: 20px;
            margin-bottom: 40px;
        }
        .table-container table {
            width: 100%;
            border-collapse: collapse;
        }
        .table-container th, .table-container td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        .active-requests th, .active-requests td {
            background-color: #e8f5e9;
        }
        .archived-requests th, .archived-requests td {
            background-color: #e3f2fd;
        }
        .table-container th {
            background-color: #4CAF50;
            color: white;
        }
        .archived-requests th {
            background-color: #2196F3;
        }
        .action-button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .active-requests .action-button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        .active-requests .action-button:hover {
            background-color: #45a049;
        }
        .archived-requests .action-button {
            background-color: #2196F3;
            color: white;
            cursor: pointer;
        }
        .archived-requests .action-button:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome Admin!!</h2>
        <button class="logout-button" onclick="location.href='logout'">Logout</button>
        
        <div class="table-container active-requests">
            <h3>Active Requests</h3>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Submitted At</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<Request> activeRequests = (ArrayList<Request>) session.getAttribute("requests");
                        for (Request req : activeRequests) {
                        	if(req.isStatus()){
                    %>
                    <tr>
                        <td><%= req.getId() %></td>
                        <td><%= req.getName() %></td>
                        <td><%= req.getEmail() %></td>
                        <td><%= req.getMessage() %></td>
                        <td><%= req.getSubmittedAt() %></td>
                        <td>
                            <form action="dashboard" style="display:inline;">
                                <input type="hidden" name="id" value="<%= req.getId() %>">
                                <input type="hidden" name="action" value="archive">
                                <button type="submit" class="action-button">Archive</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                        }}
                    %>
                </tbody>
            </table>
        </div>
        
        <div class="table-container archived-requests">
            <h3>Archived Requests</h3>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Submitted At</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<Request> archivedRequests = (ArrayList<Request>) session.getAttribute("requests");
                        for (Request req : archivedRequests) {
                        	if(!req.isStatus()){
                    %>
                    <tr>
                        <td><%= req.getId() %></td>
                        <td><%= req.getName() %></td>
                        <td><%= req.getEmail() %></td>
                        <td><%= req.getMessage() %></td>
                        <td><%= req.getSubmittedAt() %></td>
                        <td>
                            <form action="dashboard" style="display:inline;">
                                <input type="hidden" name="id" value="<%= req.getId() %>">
                                <input type="hidden" name="action" value="activate">
                                <button type="submit" class="action-button">Activate</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                        }}
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
