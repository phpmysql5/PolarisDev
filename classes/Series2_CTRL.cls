public class Series2_CTRL {

        public Integer inputText1{get;set;}
    public set<Decimal> s2{get;set;}
    
    public void getprocess(){ 
        
        set<Decimal> s1 = new set<decimal>();
        
         String a = '1.3';
      String one = '1';
         String three='3';
       String b  ='0';
        Integer j = 0;
       
        
        for( integer i = 0;i<inputText1;i++)
        {   s1.add(decimal.valueOf(a));
            a = a+one;
            s1.add(decimal.valueOf(a));
            
            a=a+three;
            s1.add(decimal.valueOf(a));
            
           
        }
        
         s2 = new set<decimal>();
        for(Decimal setnum : s1){ 
            if(j < inputText1){
                s2.add(setnum);
                j++;
            }else{
                break;
            }	            
        }
        
     
        
    }}