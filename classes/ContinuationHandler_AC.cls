public class ContinuationHandler_AC {
    
    
    // Unique label for the chained callout request
    public static String requestLabel;
    public static String requestLabel2;
    public static String requestLabel3;
    
    private static final String LONG_RUNNING_SERVICE_URL_1 = 'https://raw.githubusercontent.com/parthiban019/samplejson/master/candidateplaces.json';
    private static final String LONG_RUNNING_SERVICE_URL_2 = 'https://raw.githubusercontent.com/parthiban019/samplejson/master/customer.json';
    private static final String LONG_RUNNING_SERVICE_URL_3 = 'https://raw.githubusercontent.com/parthiban019/samplejson/master/student.json';
    
    public static CalloutWrapper.ResponseWrapper ResponseWrapperIns{get;set;}
    
    
    @AuraEnabled(continuation=true cacheable=true)
    public static  Object startRequestURL() {
        Continuation con = new Continuation(90);
        con.continuationMethod='processResponse';
        //karthik shettyan 
        //con.state='Continuation State';
        System.debug(con.continuationMethod);
        
        HttpRequest req1 = new HttpRequest();
        HttpResponse response1 = new HttpResponse();
        
        req1.setMethod('GET');
        req1.setEndpoint(LONG_RUNNING_SERVICE_URL_1);
        requestLabel = con.addHttpRequest(req1);
        System.debug(String.valueof(con.getRequests().get(requestLabel) ));
        
        //HttpRequest req2 = new HttpRequest();
        //req2.setMethod('GET');
        //req2.setEndpoint(LONG_RUNNING_SERVICE_URL_2);
        //con.addHttpRequest(req2);
        //requestLabel2 = con.addHttpRequest(req2);
        //HttpRequest req3 = new HttpRequest();
        //req3.setMethod('GET');
        //req3.setEndpoint(LONG_RUNNING_SERVICE_URL_3);
        //con.addHttpRequest(req3);
        //requestLabel3 = con.addHttpRequest(req3);
        return con;
    }
    

    @AuraEnabled(cacheable=true)
    public static Object processResponse() {
        System.debug(' in processResponse');
       // CalloutWrapper.ResponseWrapper ResponseWrapperIns = new CalloutWrapper.ResponseWrapper();
        
        Continuation chainedContinuation = new Continuation(10);
         System.debug(requestLabel);
        HttpResponse response1 = Continuation.getResponse(requestLabel);
        System.debug(response1 +'karthik');

         if(response1.getBody() != null && response1.getStatusCode() == 200){
            System.debug(' in processResponse');
            ResponseWrapperIns.candidateWrapperList = (List<CalloutWrapper.CandidateWrapper>)json.deserialize(response1.getBody(),List<CalloutWrapper.CandidateWrapper>.class);
            System.debug(ResponseWrapperIns.candidateWrapperList);
            
            chainedContinuation.continuationMethod = 'processChainedResponse';

            HttpRequest req = new HttpRequest();
            req.setMethod('GET');

            req.setEndPoint(LONG_RUNNING_SERVICE_URL_2);
            requestLabel2 = chainedContinuation.addHttpRequest(req);        
        }
		
        return chainedContinuation;

        //HttpResponse response2 = Continuation.getResponse(labels[1]);
        //if(response2.getBody() != null && response2.getStatusCode() == 200){
            //ResponseWrapperIns.customerWrapperList = (List<CalloutWrapper.CustomerWrapper>)json.deserialize(response2.getBody(),List<CalloutWrapper.CustomerWrapper>.class);
       // }
        
       // HttpResponse response3 = Continuation.getResponse(labels[2]);
        //if(response3.getBody() != null && response3.getStatusCode() == 200){
            //ResponseWrapperIns.studentWrapperList = (List<CalloutWrapper.StudentWrapper>)json.deserialize(response3.getBody(),List<CalloutWrapper.StudentWrapper>.class);
       // }
        
       // return json.serialize(ResponseWrapperIns);
    }
    
    
    @AuraEnabled(cacheable=true)
    public static Object processChainedResponse() {
    
        HttpResponse response = Continuation.getResponse(requestLabel2);
        Continuation chained2Obj = new Continuation(10);
        if(response.getBody() != null && response.getStatusCode() == 200){
            System.debug(' in processChainedResponse');
            ResponseWrapperIns.customerWrapperList = (List<CalloutWrapper.CustomerWrapper>)json.deserialize(response.getBody(),List<CalloutWrapper.CustomerWrapper>.class);
            chained2Obj.continuationMethod = 'getprocessChained2Response';
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndPoint(LONG_RUNNING_SERVICE_URL_3);
            requestLabel3 = chained2Obj.addHttpRequest(req);        
        }

        return chained2Obj;
        }
    
    



   
    @AuraEnabled(cacheable=true)
    public static Object getprocessChained2Response() {
		System.debug(' in getprocessChained2Response');
        HttpResponse response = Continuation.getResponse(requestLabel3);
        if(response.getBody() != null && response.getStatusCode() == 200){
            ResponseWrapperIns.studentWrapperList = (List<CalloutWrapper.StudentWrapper>)json.deserialize(response.getBody(),List<CalloutWrapper.CustomerWrapper>.class);     
        }

        return json.serialize(ResponseWrapperIns);
        }


    
    }