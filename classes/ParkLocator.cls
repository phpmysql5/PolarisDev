public class ParkLocator {
    public static List < String > country(String Country) {
        ParkService.ParksImplPort obj = 
            new ParkService.ParksImplPort();
        return obj.byCountry(Country);
    }
}