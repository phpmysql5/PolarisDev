@isTest
global  class ParkServiceMock implements WebServiceMock {
    
    global void doInvoke(Object stub,object request,Map<String,object>  response ,String endpoint,String soapAction,
                        String requestName,String responseNS,String responseName,String responseType)
    {
        ParkService.byCountryResponse response_x = new  ParkService.byCountryResponse();
        response_x.return_x = new List<String>{'a','b'};
        response.put('response_x', response_x );
   
    }
    
    

}