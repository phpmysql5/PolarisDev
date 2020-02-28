public class restcheck {
   
    public static HttpResponse getInfoFromExternalId(String endpoint)
    {
        HttpRequest req = new HttpRequest();
        Http h = new Http();
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        HttpResponse res = h.send(req);
        return res;
        
        
    }
    

}