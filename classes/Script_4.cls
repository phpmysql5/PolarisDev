public class Script_4 
{
    
    public Static List<Product2> insert10Products ()
    {
        List<Product2> listOfProducts = new List<Product2>();
        
        for(Integer i = 0;i<10;i++)
        {
            Product2 prod =new Product2(name ='name '+i ,family ='family'+i,Description='Classic product '+i);
            listOfProducts.add(prod);
            
        }
        insert listOfProducts;
        return listOfProducts;
        
    }
        

}