public class Script_18
{
    public static void addBinaryNumbers()
    {
        String firstBin =  '100101';
        String SecondBin = '0101101';
     
        Integer FirstBinToDecimal = Integer.valueOf(firstBin); //& Integer.valueOf(SecondBin);
        System.debug(FirstBinToDecimal);
        String result = String.valueOf(FirstBinToDecimal);
        Integer size = result.length(); 
        
        
        Integer div;
        List<Integer> addBin = new List<Integer>();
        for(Integer inc=0;inc<size;inc++)
        {   div = FirstBinToDecimal ;
            if(math.mod(FirstBinToDecimal,2)==0 )
            {
                addBin.add(0);
            }
           
            if(math.mod(FirstBinToDecimal,2)!=0 )
            {
                addBin.add(1);
            }
           
          FirstBinToDecimal = div;
         

            
            
            
        }
        
        
        
        For(Integer BinResult : addBin)
        {
            System.debug(BinResult);
        }
        
    
        
        
        
        
    }

}