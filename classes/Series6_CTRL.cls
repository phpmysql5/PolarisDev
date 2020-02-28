public class Series6_CTRL {
 
    public decimal inputText1{get;set;}
    public list<Decimal> unitsPlace_List{get;set;}
    
    public void getProcess()   
    {    inputText1 = 23.457;
        String a =string.valueOf(inputText1);
          String num = a.split('\\.')[1];
        Integer size = Integer.valueof(num.length());  
        Decimal ten = 10;
        Integer b = size;
        decimal rem; 
        unitsPlace_List = new list<Decimal>();
		decimal  dec = decimal.valueof(num);
         for( integer i = 0  ;i<=size;  i++)
       {
        Decimal div =dec/(ten.pow(i));
        rem = math.mod(integer.valueof(dec),integer.valueof(ten.pow(i)));
        //System.debug(integer.valueof(div));
         //System.debug(rem);
         unitsPlace_List.add(Integer.valueOf(div) / ten.pow(i));
         dec = rem;
        }
        for(decimal print : unitsPlace_List )
            {
                System.debug(print);
            }
        
       
       // l.add(integer.valueof(div) * ten.pow(2.0))

}

}