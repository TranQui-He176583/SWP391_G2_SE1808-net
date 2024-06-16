<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Checkbox List Example</title>
 
</head>
<body>
  <div>
    <input type="text" id="searchInput" placeholder="Tìm kiếm..." />
    <div class="checkbox-list">
       <% for (int i=0;i<100;i++) {%> 
      <div>
        <input type="checkbox" id="option1" value="option1">
        <label for="option1">Tùy chọn <%=i%></label>
      </div>
     <%}%>
      
    </div>
  </div>

  <script>
    const checkboxList = document.querySelector('.checkbox-list');
    const searchInput = document.getElementById('searchInput');
    const checkboxes = checkboxList.querySelectorAll('input[type="checkbox"]');

    searchInput.addEventListener('input', () => {
      const searchTerm = searchInput.value.toLowerCase();
      checkboxes.forEach(checkbox => {
        const label = checkbox.nextElementSibling.textContent.toLowerCase();
        const parent = checkbox.parentElement;
        if (label.includes(searchTerm)) {
          parent.classList.remove('hidden');
        } else {
          parent.classList.add('hidden');
        }
      });
    });

    checkboxList.addEventListener('change', () => {
      checkboxes.forEach(checkbox => {
        const parent = checkbox.parentElement;
        if (checkbox.checked) {
          parent.classList.remove('hidden');
        } else {
          parent.classList.add('hidden');
        }
      });
    });
  </script>
</body>
</html>