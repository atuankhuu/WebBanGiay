<%-- 
    Document   : addcus
    Created on : Jul 7, 2023, 5:51:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="/PRJProject/css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <form action="/PRJProject/testcus" method="post">
            <div class="row py-5 p-4 bg-white rounded shadow-sm">
                <div class="col-lg-6">

                    <div class="bg-light text-center rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin khách hàng</div>
                    <div class="p-4">
                        <ul class="list-unstyled mb-4">
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tên khách hàng</strong><strong><input name="cname" class="border-0" required type="text" ></strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">email</strong><strong><input name="cemail" class="border-0" required type="text" ></strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Số điện thoại</strong><strong><input name="cphone" class="border-0" required type="text" ></strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted"> Địa chỉ</strong>
                                <textarea required name="caddress" class=" border-0" type="text"></textarea>  
                            </li>
                    </div>

                </div>
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                    <div class="p-4">
                        <ul class="list-unstyled mb-4">
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong>${o.totalPrice} $</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>${o.totalPrice * 0.1} $</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                <textarea class="font-weight-bold border-0 text-end">${cusid}</textarea>
                            </li>
                        </ul>
                    </div>
                </div>
                <button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</button>
            </div>
        </form>
    </body>
</html>
