    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>User Management Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
           
        </head>

        <body>

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
            <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                       
                        
                        <form action="add" method="post" enctype="multipart/form-data"> 
                            <h2>Add New User</h2>
                        

                        <fieldset class="form-group">
                            <label>User Name</label> <input type="text" class="form-control" name="fullname" id="fullname"required="required">
                        </fieldset>
                        
                         <fieldset class="form-group">
                             <label>password</label> <input type="text" class="form-control" name="password" id="password" required="required">
                        </fieldset>
                       
                        <fieldset class="form-group">
                            <label>User Email</label> 
                            <input type="text" class="form-control" name="email" id="email" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>User phone</label> 
                            <input type="text" class="form-control" name="phone" id="phone">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label> User image</label>
                            <input type="file" class="form-control" name="image" id="image" required>
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>User gender</label> 
                            <select name="gender" id="gender" class="form-control">
                                <option value="" disabled selected>Gender</option>
                               <option value="1">male</option>
                               <option value="2">female</option>
                              
                          </select>
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>User status</label> 
                           <select name="status" id="status" class="form-control">
                                <option value="" disabled selected>Status</option>
                               <option value="1">active</option>
                               <option value="2">inactive</option>
                               <option value="3">block</option>
                               
                          </select>
                            
                        </fieldset>
                       
                        <button type="submit" class="btn btn-success">Save</button>
                        <a href="NewUser.jsp" class="btn btn-success">Back</a>
                        <p style="color: red;  font-size: 15px">${requestScope.wrongRegister}</p>
                        
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>
