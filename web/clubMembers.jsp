<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Club Members</title>
        <%@include file="commonFunction/CSS.jsp" %> <!-- Include CSS -->
        <style>
            .member-list {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                padding: 20px;
            }
            .member-card {
                display: flex;
                align-items: center;
                background-color: #f1f1f1;
                border: 1px solid #ddd;
                border-radius: 5px;
                overflow: hidden;
                width: 90%;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 10px;
            }
            .member-avatar {
                flex-shrink: 0;
            }
            .member-avatar img {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                margin-right: 20px;
            }
            .member-details {
                flex-grow: 1;
            }
            .member-details p {
                margin: 5px 0;
            }
            .member-actions {
                display: flex;
                gap: 10px;
            }
            .member-actions button {
                padding: 5px 10px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
            .approve-btn {
                background-color: green;
                color: white;
            }
            .delete-btn {
                background-color: red;
                color: white;
            }
            .filter-buttons {
                margin: 20px 0;
            }
            .filter-buttons form {
                display: inline-block;
                margin: 0 10px;
            }
            .filter-buttons button {
                padding: 8px 16px;
                border: 2px solid transparent;
                border-radius: 4px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            .filter-buttons button:hover {
                background-color: #f1f1f1;
                border-color: #ccc;
            }

            .filter-buttons button.active {
                background-color: #4CAF50;
                color: white;
                border-color: transparent;
                font-weight: bold;
            }
        </style>
        <style>
            .reason-modal {
                display: none; /* Hidden by default */
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 30px;
                border: 1px solid #ddd;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                border-radius: 8px;
                width: 400px; /* Set a fixed width for the modal */
                max-width: 90%; /* Ensure it is responsive */
                z-index: 1000; /* Ensure it is on top of other content */
            }

            .reason-modal label {
                display: block;
                font-size: 18px; /* Larger font size for better readability */
                margin-bottom: 15px; /* Increased margin */
            }

            .reason-modal input {
                width: calc(100% - 22px); /* Full width minus padding */
                padding: 12px;
                margin-bottom: 15px; /* Increased margin */
                border-radius: 5px;
                border: 1px solid #ddd;
                font-size: 16px; /* Slightly larger font size */
            }

            .reason-modal button {
                padding: 12px 24px;
                background-color: red;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px; /* Larger font size for the button */
                transition: background-color 0.3s ease; /* Smooth transition */
            }

            .reason-modal button:hover {
                background-color: darkred; /* Darker color on hover */
            }

            /* Optional: Add a backdrop for the modal */
            .modal-backdrop {
                display: none; /* Hidden by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6); /* Darker backdrop */
                z-index: 999; /* Behind the modal */
            }
        </style>

    </head>
    <body>
        <%@include file="commonFunction/header.jsp" %> <!-- Include Header -->

        <div style="text-align: center; padding-top: 150px;">
            <h2>Members List</h2>
        </div>

        <div class="filter-buttons" style="text-align: center; margin-bottom: 20px;">
            <form action="ClubMembers" method="post" style="display: inline;">
                <input type="hidden" name="clubid" value="${requestScope.clubid}">
                <input type="hidden" name="status" value="1">
                <button type="submit" class="${status == '1' ? 'active' : ''}">Approved Members</button>
            </form>
            <form action="ClubMembers" method="post" style="display: inline;">
                <input type="hidden" name="clubid" value="${requestScope.clubid}">
                <input type="hidden" name="status" value="0">
                <button type="submit" class="${status == '0' ? 'active' : ''}">Unapproved Members</button>
            </form>
        </div>

        <div class="member-list">
            <c:if test="${not empty accounts}">
                <c:forEach var="account" items="${accounts}">
                    <div class="member-card">
                        <div class="member-avatar">
                            <img src="${account.image}" alt="${account.fullname}">
                        </div>
                        <div class="member-details">
                            <p><strong>Name:</strong> ${account.fullname}</p>
                            <p><strong>Email:</strong> ${account.email}</p>
                            <p><strong>Phone:</strong> ${account.phone}</p>
                            <p><strong>Gender:</strong> ${account.gender == 1 ? 'Nam' : 'Nữ'}</p>
                        </div>
                        <div class="member-actions">
                            <c:if test="${status == 0}">
                                <form action="ApproveMembers" method="post">
                                    <input type="hidden" name="accountid" value="${account.id}">
                                    <input type="hidden" name="clubid" value="${requestScope.clubid}">
                                    <input type="hidden" name="status" value="0">
                                    <button type="submit" class="approve-btn">Approve</button>
                                </form>
                            </c:if>

                            <form id="deleteForm" action="DeleteMembers" method="post">
                                <input type="hidden" name="accountid" value="${account.id}">
                                <input type="hidden" name="clubid" value="${requestScope.clubid}">
                                <input type="hidden" name="status" value="1">
                                <div id="reasonBackdrop" class="modal-backdrop" onclick="hideReasonModal()"></div>
                                <div id="reasonModal" class="reason-modal">
                                    <form id="reasonForm" action="DeleteMembers" method="post">
                                        <label for="reason">Reason for Deletion:</label>
                                        <input type="text" id="reason" name="reason" required>
                                        <button type="submit">Confirm Deletion</button>
                                    </form>
                                </div>
                                <button type="button" class="delete-btn" onclick="showReasonModal()">Delete</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty accounts}">
                <p>No members found for this club.</p>
            </c:if>
        </div>

        <!-- Modal and Backdrop -->


        <!-- Include Footer -->

        <script>
            function showReasonModal() {
                // Show the modal and the backdrop
                document.getElementById('reasonModal').style.display = 'block';
                document.getElementById('reasonBackdrop').style.display = 'block';
            }

            function hideReasonModal() {
                // Hide the modal and the backdrop
                document.getElementById('reasonModal').style.display = 'none';
                document.getElementById('reasonBackdrop').style.display = 'none';
            }
        </script>
    </body>
</html>