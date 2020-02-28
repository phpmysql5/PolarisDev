public class Script_16 
{
    public static void createPriceBookWithProducts()
    {
        
         List<Product2> productList = new List<Product2>();
        
         for(Integer inc = 0;inc<10;inc++)
         {
             Product2 product = new product2(name='titan'+inc);
             productList.add(product);
             
         }
         insert productList;
        

         Pricebook2 standard = [Select Id from Pricebook2 where IsStandard = true LIMIT 1];
         Pricebook2 priceBook = [Select Id from Pricebook2 where name = 'fgg'];
         
         List<PriceBookEntry> PriceBookEntryList = new List<PriceBookEntry>();
        
           for(Product2 prod : [Select ID from product2 where name like '%titan%'])   
        {
          PriceBookEntry priceBookEntry  = new PriceBookEntry(Product2Id =prod.Id,Pricebook2Id =standard.Id ,
                                           UseStandardPrice =false,UnitPrice = 234 );
            PriceBookEntryList.add(priceBookEntry);
        }
      
        insert  priceBookEntryList;
      
        
        
        for(Product2 prod : [Select ID from product2 where name like '%titan%'])   
        {
          PriceBookEntry priceBookEntry  = new PriceBookEntry(
                                           UseStandardPrice =false,UnitPrice = 234 );
            PriceBookEntryList.add(priceBookEntry);
        }
      
        insert  priceBookEntryList;
       
		

      }


}