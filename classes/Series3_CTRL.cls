public class Series3_CTRL {
    
    public Integer inputText1{get;set;}
    public set<integer> s2{get;set;}
    
    public void getProcess(){ 
        
        set<Integer> s1 = new set<Integer>();
        
        
        integer a = 522;
        integer b = 1;
        integer c = 1;
        Integer j = 0;
        
        s1.add(522);
        for( integer i = 0;i<inputText1;i++)
        {    
            a = a-20;
            s1.add(a);
            
            a=a-10;
            s1.add(a);
            
        
        }
        
        //set<Integer> 
        s2 = new set<Integer>();
        for(Integer obj : s1){ 
            if(j < inputText1){
                s2.add(obj);
                j++;
            }else{
                break;
            }	            
        }
        
        //return s2;
        
    }
    

}