@isTest
public class restcheckTest 
{
    @isTest static void testCalloutwithStaticResources()
    {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('jsonexpert');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        
        Test.setMock(HttpCalloutMock.class, mock);
        
        HttpResponse res = restcheck.getInfoFromExternalId('http://echo.jsontest.com/key/value/otherkey/othervalue');
        String jsonInput = '{'+
		'   \"otherkey\": \"othervalue\",'+
		'   \"key\": \"value\"'+
		'}';

        

        
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(jsonInput);
        SYSTEM.assertEquals(jsonInput,res.getBody());
        //SYSTEM.assertEquals('value',m.get('key'));
        SYSTEM.assertEquals(200, res.getStatusCode());
        SYSTEM.assertEquals('application/json', res.getHeader('Content-Type'));
        
        
        
        
        
    }
    

}