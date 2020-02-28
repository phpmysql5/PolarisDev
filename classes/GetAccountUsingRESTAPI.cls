public class GetAccountUsingRESTAPI {
private final String clientId = '3MVG9d8..z.hDcPLv1ZfNTKtI1I2zG4LI_rOWKgQojRbmqAbxVwGeEZW5KqMm7bsiWhaOyYxBgLA88H37TlfN';
private final String clientSecret = '84E527E5A7037F1DF47840F74FA98A3DEDBD3530CD2AEA33A628E2B65219CEBF';
private final String username = 'kshet5@gmail.com';
private final String password = 'phpmysql5.9xCt3w4gsgT9BIjHwxUT4P2xiR';
public class deserializeResponse
{
public String id;
public String access_token;
}













public String ReturnAccessToken (GetAccountUsingRESTAPI acount)
{
String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
Http h = new Http();



HttpRequest req = new HttpRequest();
req.setBody(reqbody);
req.setMethod('POST');
req.setEndpoint('https://ironman3-dev-ed.my.salesforce.com/services/oauth2/success');
HttpResponse res = h.send(req);

    
deserializeResponse response = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
system.debug( res.getStatusCode()   +'@@@@access_token@@'+response );
return response.access_token;
}
    
    
}