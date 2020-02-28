public class Utils {
    
    
    public static Map<String, Schema.DescribeFieldResult> getFieldMetaData(  
  Schema.DescribeSObjectResult dsor, Set<String> fields) {

  // the map to be returned with the final data
  Map<String,Schema.DescribeFieldResult> finalMap = 
    new Map<String, Schema.DescribeFieldResult>();
  // map of all fields in the object
  Map<String, Schema.SObjectField> objectFields = dsor.fields.getMap();

  // iterate over the requested fields and get the describe info for each one. 
  // add it to a map with field name as key
  for(String field : fields){
    // skip fields that are not part of the object
    if (objectFields.containsKey(field)) {
      Schema.DescribeFieldResult dr = objectFields.get(field).getDescribe();
      // add the results to the map to be returned
      finalMap.put(field, dr); 
    }
  }
  return finalMap;
}
    

}