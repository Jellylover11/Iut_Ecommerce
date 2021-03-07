<%@page import="java.util.List"%>
<%@page import="com.learn.iut_ecommerce.entities.Category"%>
<%@page import="com.learn.iut_ecommerce.dao.CategoryDao"%>
<%@page import="com.learn.iut_ecommerce.helper.FactoryProvider"%>
<%@page import="com.learn.iut_ecommerce.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in!!!");

        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin!!!");

            response.sendRedirect("login.jsp");
            return;

        }

        if (user.getUserType().equals("seller")) {
            session.setAttribute("message", "You are not admin!!!");

            response.sendRedirect("login.jsp");
            return;

        }

    }


%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
    </head>
    <%@include file="Components/common_css_js.jsp" %>


    <body>

        <%@include file="Components/navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="Components/message.jsp" %>


            </div>



            <div class="row mt-3">

                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 120px;" class="img-fluid" src="img/keys.png" alt="user_icon">
                            </div>
                            <h1>13123</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>   

                        </div>



                    </div>    




                </div>


                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 120px;" class="img-fluid" src="img/list.png" alt="user_icon">
                            </div>
                            <h1>22323</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>   

                        </div>



                    </div>  





                </div>

                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 120px;" class="img-fluid" src="img/product.png" alt="user_icon">
                            </div>
                            <h1>234</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>   

                        </div>



                    </div>  




                </div>




            </div>

            <div class="row mt-3">
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 120px;" class="img-fluid" src="img/plus.png" alt="user_icon">
                            </div>

                            <h1 class="text-uppercase text-muted">Add Category</h1>   

                        </div>



                    </div> 






                </div>

                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 120px;" class="img-fluid" src="img/plus.png" alt="user_icon">
                            </div>

                            <h1 class="text-uppercase text-muted">Add Product</h1>   

                        </div>



                    </div> 






                </div>






            </div>


        </div>

        <!--add category modal-->
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Detail</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Add Category title" required />

                            </div> 
                            <div class="form-group">
                                <textarea style="height: 300px" class="form-control" placeholder="Enter category description" name="catDesceiption" required></textarea>

                            </div> 

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>

                            </div>


                        </form>

                    </div>

                </div>
            </div>
        </div>







        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter product name" name="pName" required> 
                            </div>   


                            <div class="form-group">
                                <textarea style="height: 150px" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>               

                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required> 
                            </div>  

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Discount" name="pDiscount" required> 
                            </div>  

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required> 
                            </div>  

                            <%                                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cDao.getCategories();


                            %>


                            <div class="form-group">
                                <select name="catId" class="form-control" id="">

                                    <%                                      for (Category c : list) {

                                    %>   
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%> </option>
                                    <% }%>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="pPic">Select Picture For product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required />
                            </div>

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add product</button>




                            </div>



                        </form>






                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>                  
                    </div>
                </div>
            </div>
        </div>






    </body>
</html>
