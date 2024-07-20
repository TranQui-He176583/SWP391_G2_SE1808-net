<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notification Overlay</title>
    <style>
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 999;
        }

        .notification-content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            position: relative;
        }

        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
    

    <%
        int type = 1; // set the type value
        if (type == 1) {
    %>
    <script>
        window.onload = function() {
            showNotificationOverlay();
        };
    </script>
    <% } %>

    <div id="notification-overlay" class="overlay">
        <div class="notification-content">
            <span class="close-button">&times;</span>
            <h3>Notification</h3>
            <p>Accept Complete.</p>
        </div>
    </div>

    <script>
        // Get the overlay and close button elements
        const notificationOverlay = document.getElementById('notification-overlay');
        const closeButton = document.querySelector('.close-button');
        const showNotificationButton = document.getElementById('showNotification');

        // Show the overlay
        function showNotificationOverlay() {
            notificationOverlay.style.display = 'flex';
        }

        // Hide the overlay
        function hideNotificationOverlay() {
            notificationOverlay.style.display = 'none';
        }

        // Add event listeners to the close button and overlay
        closeButton.addEventListener('click', hideNotificationOverlay);
        notificationOverlay.addEventListener('click', (event) => {
            if (event.target === notificationOverlay) {
                hideNotificationOverlay();
            }
        });

    </script>
</body>
</html>