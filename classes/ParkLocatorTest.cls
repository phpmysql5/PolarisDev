@isTest
public class ParkLocatorTest {
    @isTest static void getCallout()
    {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<STRING> result = ParkLocator.country('Test');
    }
    

}