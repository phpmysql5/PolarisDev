public class Script_15 
{
    public static void findProducthavingDescriptionA()
    {
        List<Product2> listofProdWithDescrA = [Select name from Product2 where Description 
                                               like'%a%' ];
        For(Product2 product :listofProdWithDescrA )
        {
            System.debug(product.name);
        }
        
    }

}