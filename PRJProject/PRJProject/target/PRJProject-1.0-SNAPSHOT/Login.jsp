<%-- 
    Document   : dangnhap
    Created on : Jun 14, 2023, 12:06:25 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/styles.css" rel="stylesheet" />
        <title>LOGIN</title>
    </head>
    <body>

        <section class="vh-75 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">

            <div class="mask d-flex align-items-center h-75 gradient-custom-3">
                <div class="container py-5 h-100">

                    <div class="row d-flex justify-content-center align-items-center h-100">

                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card bg-dark text-white transition-background" style="border-radius: 1rem;">
                                <div class="card-body p-5 text-center">

                                    <div class="mb-md-2 ">

                                        <form action="login" method="post">
                                            <p class="text-danger ">${mess}</p>
                                            <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                            <p class="text-white-50 mb-5">Please enter your login and password!</p>

                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeEmailX" class="form-control form-control-lg" name="user" />
                                                <label class="form-label" for="typeEmailX">UserName</label>
                                            </div>

                                            <div class="form-outline form-white mb-4">
                                                <input type="password" id="typePasswordX" class="form-control form-control-lg" name="pass" />
                                                <label class="form-label" for="typePasswordX">Password</label>
                                            </div>
                                            
                                            <input class="form-check-input" type="checkbox" name="chkRem" value="1"/>Remember me?

                                            <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="forgotpass">Forgot password?</a></p>

                                            <button name="btnSubmit" value="Login" class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
                                        </form>

                                    </div>

                                    <div>
                                        <p class="mb-0">Don't have an account? <a href="signup" class="text-white-50 fw-bold">Sign Up</a>
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div></div>
        </section>
    </body>
</html>
