public class Script_3 
{
    
    public  Static List<Opportunity> insert20Opportunity()
    {
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i = 20;i<40;i++)
        {
            Opportunity opportunity= new Opportunity(CloseDate=Date.Today() ,StageName='Prospecting' ,name='karthik opp '+i);
            oppList.add(opportunity);
            
        }
        
        insert oppList;
        return oppList;
        
        
    }

}