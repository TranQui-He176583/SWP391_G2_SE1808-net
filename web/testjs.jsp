<!DOCTYPE html>
<html>
<head>
    <title>Search and Select Users</title>
    <script>
        var selectedUsers = [];

        function searchUsers() {
            var searchTerm = document.getElementById("searchInput").value.toLowerCase();
            var userList = document.getElementsByClassName("user-item");

            for (var i = 0; i < userList.length; i++) {
                var userName = userList[i].textContent.toLowerCase();
                if (userName.includes(searchTerm)) {
                    userList[i].style.display = "block";
                } else {
                    userList[i].style.display = "none";
                }
            }
        }

        function toggleUserSelection(element) {
            var userId = element.getAttribute("data-user-id");
            var userName = element.textContent;

            if (selectedUsers.some(user => user.id === userId)) {
                selectedUsers = selectedUsers.filter(user => user.id !== userId);
                element.style.backgroundColor = "transparent";
            } else {
                selectedUsers.push({ id: userId, name: userName });
                element.style.backgroundColor = "#f0f0f0";
            }
        }

        function sendSelectedUsers() {
            // ? ?ây, b?n có th? s? d?ng m?ng `selectedUsers` ?? th?c hi?n các tác v? khác
            console.log("Selected users:", selectedUsers);
        }

        window.onload = function() {
            var userList = document.getElementsByClassName("user-item");
            for (var i = 0; i < userList.length; i++) {
                userList[i].onclick = function() {
                    toggleUserSelection(this);
                };
            }
        };
    </script>
</head>
<body>
    <h1>Search and Select Users</h1>
    <input type="text" id="searchInput" onkeyup="searchUsers()" placeholder="Search users...">
    <ul>
        <li class="user-item" data-user-id="1">John Doe</li>
        <li class="user-item" data-user-id="2">Jane Smith</li>
        <li class="user-item" data-user-id="3">Bob Johnson</li>
        <li class="user-item" data-user-id="4">Alice Williams</li>
        <li class="user-item" data-user-id="5">Tom Davis</li>
    </ul>
    <button onclick="sendSelectedUsers()">Send Selected Users</button>
</body>
</html>