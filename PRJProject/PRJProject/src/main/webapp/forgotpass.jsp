<%-- 
    Document   : forgotpass
    Created on : Jul 4, 2023, 2:08:54 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/styles.css" rel="stylesheet" />
        <title>SIGN UP</title>
    </head>
    <body>
        <section class="bg-image d-flex align-items-center justify-content-center" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp'); height: 100vh;">
    <div class=" col-md-12 mask gradient-custom-3">
        <div class="container">
            <div class="d-flex justify-content-center">
                <div class="col-md-6">
                    <div class="card rounded-3">
                        <div class="card-body p-4">
                            <h2 class="text-center mb-4">Forgot Password</h2>
                            <form action="forgotpass" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">User Name</label>
                                    <input type="text" id="name" class="form-control" name="user" required />
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Your Email</label>
                                    <input type="email" id="email" class="form-control" name="email" required />
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">SEND</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

        
    </body>
</html>
