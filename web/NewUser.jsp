    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>User Management Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
           
        </head>

        <body style="overflow-y: hidden">
            
            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: black">
                    <div>
                        <a href="https://www.javaguides.net" class="navbar-brand"> User Management  </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="countUser" class="nav-link">Users</a></li>
                    </ul>
                </nav>
            </header>
            
           <div class="container" style="max-width: 800px; margin: 0 auto;">
    <div class="card">
        <div class="card-body">
            <form action="add" method="post">
                <h2>Add New User</h2>

                <div class="row">
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label>User Name</label>
                            <input type="text" class="form-control" name="fullname" id="fullname" required="required">
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label>User Email</label>
                            <input type="text" class="form-control" name="email" id="email" required="required">
                        </fieldset>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label>Role</label>
                            <select name="role" id="role" class="form-control">
                                <option value="1">Admin</option>
                                <option value="2">Manager</option>
                                <option value="3">NormalUser</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label>User phone</label>
                            <input type="text" class="form-control" name="phone" id="phone">
                        </fieldset>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label>User gender</label>
                            <select name="gender" id="gender" class="form-control">
                                <option value="1">male</option>
                                <option value="2">female</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label>User status</label>
                            <select name="status" id="status" class="form-control">
                                <option value="1">active</option>
                                <option value="2">inactive</option>
                                <option value="3">block</option>
                            </select>
                        </fieldset>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Save</button>
                    <a href="NewUser.jsp" class="btn btn-success">Back</a>
                    <p style="color: red; font-size: 15px">${requestScope.wrongRegister}</p>
                    <p style="color: green; font-size: 15px">${requestScope.addnew}</p>
                </div>
            </form>
        </div>
    </div>
</div>
                       
        </body>

        </html>
