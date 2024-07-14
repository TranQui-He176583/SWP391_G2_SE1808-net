<link rel="stylesheet" href="assets/css/task_list.css"/>
<table id="manager-register-event-table">
  <thead>
    <tr>
      <th style="text-align: center;">Event</th>
      <th style="text-align: center;">Username</th>
      <th style="text-align: center;">User Email</th>
      <th style="text-align: center;">Service</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td style="text-align: center">Event 1</td>
      <td style="text-align: center">user1</td>
      <td  style="text-align: center"> >user1@example.com</td>
      <td>
        <div style="display: flex; justify-content: center; align-items: center;">
          <button class="accept-btn">Ch?p nh?n</button>

          <button class="reject-btn">T? ch?i</button>
        </div>
      </td>
    </tr>
    <tr>
      <td  style="text-align: center">Event 2</td>
      <td  style="text-align: center">user2</td>
      <td  style="text-align: center">>user2@example.com</td>
      <td>
        <div style="display: flex; justify-content: center; align-items: center;">
          <button class="accept-btn">Ch?p nh?n</button>
     
          <button class="reject-btn">T? ch?i</button>
        </div>
      </td>
    </tr>
    <!-- Add more rows as needed -->
  </tbody>
</table>

<style>


  .accept-btn, .reject-btn {
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    margin-right: 8px;
  }

  .accept-btn {
    background-color: #4CAF50;
    color: white;
  }

  .reject-btn {
    background-color: #f44336;
    color: white;
  }

  .accept-btn:hover, .reject-btn:hover {
    opacity: 0.8;
  }
</style>

<script>
  // Add event listeners to the "Ch?p nh?n" and "T? ch?i" buttons
  const acceptBtns = document.querySelectorAll('.accept-btn');
  const rejectBtns = document.querySelectorAll('.reject-btn');

  acceptBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      // Handle "Ch?p nh?n" button click
      console.log('Ch?p nh?n button clicked');
    });
  });

  rejectBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      // Handle "T? ch?i" button click
      console.log('T? ch?i button clicked');
    });
  });
</script>