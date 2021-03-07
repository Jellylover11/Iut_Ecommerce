<%-- 
    Document   : index
    Created on : Dec 30, 2020, 9:39:08 PM
    Author     : ASUS
--%>

<%@page import="com.learn.iut_ecommerce.helper.Helper"%>
<%@page import="com.learn.iut_ecommerce.entities.Category"%>
<%@page import="com.learn.iut_ecommerce.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.iut_ecommerce.entities.Product"%>
<%@page import="com.learn.iut_ecommerce.dao.ProductDao"%>
<%@page import="com.learn.iut_ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iut_Ecommerce - Home</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="row mt-3 mx-2">

            <%
               String cat= request.getParameter("category");
               //out.println(cat);
               




                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list=null;
                if(cat==null){
                
                
                list = dao.getAllProducts();
                
                }
                else  if(cat.equals("all"))
               {
            
             list = dao.getAllProducts();
            
           }else{
            
            
           int cid=Integer.parseInt(cat.trim());
           list=dao.getAllProductsById(cid);
          
            
            }
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>

            <div class="col-md-2">

                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All products
                    </a> 





                    <%
                    for (Category c : clist) {%>
                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>


                    <% }


                    %>

                </div>


            </div>

            <div class="col-md-10">

                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">

                            <%                                for (Product p : list) {

                            %>
                            <div class="card product-card">
                                <div class="container text-center">
                                     <img class="card-img-top" src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px;max-width: 100%;width: auto;" class="card-img-top m-1" alt="image">
                                    
                                    
                                </div>
                               
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    <p class="card-text">
                                        <%= Helper.get10Words(p.getpDesc())%>
                                    </p>


                                </div> 
                                <div class="card-footer text-center">

                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>', <%= p.getpPrice() %>)">Add to cart</button>
                                    <button class="btn btn-outline-primary text-dark"><%= p.getPriceAfterApplyingDiscount() %>/-<span class="text-secondary discount-label"> <%= p.getpDiscount() %>% off</span></button>


                                </div>


                            </div>

                            <% }%>

                        </div>  

                    </div>


                </div>

            </div>

        </div>

                            <%@include file="Components/Common_modal.jsp" %>
    </body>
</html>
