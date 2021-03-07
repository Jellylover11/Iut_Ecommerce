function add_to_cart(pid,pname,price)
{
    let cart=localStorage.getItem("cart");
    if(cart=null)
    {
        let products=[];
        let product={productId:pid,productName:pname,productQuantity:1,productPrice:price} ;
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        
        
    }else {
        
        
        let pcart=JSON.parse(cart);
       let oldproduct= pcart.find((item)=> item.productId==pid);
       if(oldProduct)
       {
           
           oldProduct.productQuantity=oldProduct.productQuantity+1;
           pcart.map((item)=> {
               if(item.productId==old.productId)
               {
                   item.productQuantity=oldProduct.productQuantity;
                   
               }
               
               
               
           })
           
           localStorage.setItem("cart",JSON.stringify(pcart));
       }else{
           
            let product={productId:pid,productName:pname,productQuantity:1,productPrice:price} ;
           pcart.push(product);
           localStorage.setItem("cart",JSON.stringify(pcart));
       }
        
    }
    
    
}

function updateCart{
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString);
    if(cart==null || cart==0)
    {
        console.log("cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart has nothing<h3>");
        
    }else{
        
        let product={productId:pid,productName:pname,productQuantity:1,productPrice:price} ;
        console.log(cart);
        
    }
    
    retuen cart;
}