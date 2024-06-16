<!DOCTYPE html>
<html>
<head>
  <title>ArrayList Display</title>
  <style>
    .item {
      display: inline-block;
      width: 100px;
      height: 100px;
      background-color: #f1f1f1;
      margin: 10px;
      text-align: center;
      line-height: 100px;
      opacity: 0;
      transform: translateX(-50px);
      transition: all 0.5s ease;
    }

    .item.show {
      opacity: 1;
      transform: translateX(0);
    }
  </style>
</head>
<body>
  <div id="container"></div>

  <script>
    // M?ng ch?a các ph?n t?
    let arrayList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

    // L?y ph?n t? container
    let container = document.getElementById('container');

    // Hàm hi?n th? 3 ph?n t?
    function displayItems() {
      container.innerHTML = '';
      for (let i = 0; i < 3; i++) {
        let item = document.createElement('div');
        item.classList.add('item');
        item.textContent = arrayList[i];
        container.appendChild(item);
        // Thêm class 'show' sau 0.1s * i ?? t?o hi?u ?ng chuy?n c?nh
        setTimeout(() => {
          item.classList.add('show');
        }, 100 * i);
      }
    }

    // Hàm thay ??i ph?n t? ??u tiên
    function updateFirstItem() {
      arrayList.push(arrayList.shift()); // Di chuy?n ph?n t? ??u tiên v? cu?i m?ng
      displayItems(); // G?i l?i hàm hi?n th? 3 ph?n t?
    }

    // G?i hàm hi?n th? 3 ph?n t? ban ??u
    displayItems();

    // G?i hàm thay ??i ph?n t? ??u tiên sau 5 giây
    setInterval(updateFirstItem, 5000);
  </script>
</body>
</html>