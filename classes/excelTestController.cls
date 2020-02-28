public without sharing class excelTestController{

public string xmlheader {get;set;}

public string endfile{get;set;}

public List<String> listString{get;set;}

 

public excelTestController() {

//VF page gives some issues directly using the below code there, so wrap up in variable

xmlheader ='<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?>';

endfile = '</Workbook>';

listString = new List<String>();

listString.add('1');

listString.add('2');

}

}