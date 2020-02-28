/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@RestResource(urlMapping='/template/load/*')
global class AgreementTemplateWebService {
    global AgreementTemplateWebService() {

    }
    @Deprecated
    @HttpGet
    global static echosign_dev1.AgreementTemplateWebService.LoadResult doGet() {
        return null;
    }
    @HttpPost
    global static echosign_dev1.AgreementTemplateWebService.LoadResult doPost() {
        return null;
    }
global class LoadResult {
    global String agreementId;
    global String error;
    global LoadResult() {

    }
}
}
