/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Utils {
    global static Map<String,List<SObject>> DataRowsByModel;
    global Utils() {

    }
    global static void AddRowWarning(Integer rowIndex, String message) {

    }
    global static skuid.Skuidponent ComponentFactory(dom.XmlNode data) {
        return null;
    }
    global static Integer CountActiveBatchJobs() {
        return null;
    }
    global static skuid__Page__c DividePageLayout(String xml, skuid__Page__c p) {
        return null;
    }
    global static List<skuid__Page_Assignment__c> ExtractPageAssignmentsFromStaticResourceBody(StaticResource sr) {
        return null;
    }
    global static List<skuid__Page__c> ExtractPagesFromStaticResourceBody(StaticResource sr) {
        return null;
    }
    global static String GetAllPageAssignmentsAsJSON() {
        return null;
    }
    global static void GetAllPageAssignmentsAsJSONAndSendInEmail() {

    }
    global static void GetAllPageAssignmentsAsJSONAndSendInEmail(String emailAddress) {

    }
    global static String GetCRONExpression(Datetime dt) {
        return null;
    }
    global static Map<String,Id> GetRecordTypeIdsByDeveloperName(Schema.DescribeSObjectResult obj) {
        return null;
    }
    global static Integer GetTimeZoneOffsetMinutesFromUTC(String timezoneKey) {
        return null;
    }
    global static Integer GetUTCOffsetMinutesForCurrentUser() {
        return null;
    }
    @Deprecated
    global Integer GetUTCOffsetMinutesForTimeZone(String timezoneKey) {
        return null;
    }
    global static String GetUniqueIdForPage(skuid__Page__c page) {
        return null;
    }
    global static void InitializeDependencies() {

    }
    global static String MakeCSSResourceString(String src) {
        return null;
    }
    global static String MakeJSResourceString(String src) {
        return null;
    }
    global static String MakePluginString(String id, String pluginName, String xmlData) {
        return null;
    }
    global static Boolean MaxBatchJobsReached() {
        return null;
    }
    global static String PackagePagesInModule(String module, Boolean sendEmail) {
        return null;
    }
    global static String PackagePages(List<skuid__Page__c> pages, Boolean sendEmail) {
        return null;
    }
    global static skuid.Utils.PageRefreshResult RefreshPagesFromStaticResource(List<StaticResource> srList) {
        return null;
    }
    global static skuid.Utils.PageRefreshResult RefreshPagesFromStaticResource(List<String> srIds) {
        return null;
    }
    global static List<skuid__Page__c> RefreshPagesInModule(String module) {
        return null;
    }
    global static List<skuid__Page__c> RefreshPages() {
        return null;
    }
    global static skuid.Utils.PageRefreshResult RefreshSkuidPages(List<skuid__Page__c> pages) {
        return null;
    }
    global static Boolean RegisterProtectedModule(String moduleName) {
        return null;
    }
    global static String getResourceURL(String resourceName) {
        return null;
    }
    global static String getResourceURL(String resourceName, String namespace) {
        return null;
    }
    global static String toXmlString(dom.XmlNode xmlNode) {
        return null;
    }
global class DBError {
}
global class DBInsertResult {
}
global class FieldDataResult {
}
global class PageRefreshResult {
}
global class SkuidDBResult {
}
global class SkuidResult {
}
}
