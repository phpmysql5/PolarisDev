public class Series5_CTRL {
    
    public decimal inputText1{get;set;}
    public list<Decimal> unitsPlace_List{get;set;}
    public void getprocess()
    { 
        
        String  num = string.valueOf(inputText1);
        Integer size = Integer.valueof(num .length());  
        Decimal ten = 10;
        Integer b = size;
        unitsPlace_List = new list<decimal>();
        decimal rem; 
       for( integer i = size-1 ;i>=0; i--)
       {
        Decimal div =inputText1/(ten.pow(i));
        
        rem = math.mod(integer.valueof(inputText1),integer.valueof(ten.pow(i)));
        //System.debug(integer.valueof(div));
         //System.debug(rem);
         //
                 unitsPlace_List.add(Integer.valueOf(div) * ten.pow(i) );
         inputText1 = rem;
        }
        for(decimal print : unitsPlace_List )
            {
                System.debug(print);
            }
        
       
       // l.add(integer.valueof(div) * ten.pow(2.0))

       

}

}