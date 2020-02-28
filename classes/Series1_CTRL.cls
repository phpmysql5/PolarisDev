Public class Series1_CTRL {
    Public Integer inputText1{get;set;}
    Public set<integer> s2{get;set;}
    
    public void getprocess(){ 
        
        set<Integer> s1 = new set<Integer>();
        
        
        integer a = 1;
        integer b = 1;
        integer c = 1;
        Integer j = 0;
      
        
        for( integer i = 0;i<inputText1;i++)
        {   
            a = a*c;
            s1.add(a);
            
            b=a*4;
            s1.add(b);
            
            c=b*2;
            s1.add(c);
        }
        
         s2 = new set<Integer>();
        for(Integer obj : s1){ 
            if(j < inputText1){
                s2.add(obj);
                j++;
            }else{
                break;
            }	            
        }
        
       // return s2;
        
    }}