/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AgreementTemplateLoadInvocableAction {
    global AgreementTemplateLoadInvocableAction() {

    }
    @InvocableMethod(label='Load Agreement Template' description='Generate an agreement using the specified agreement template.')
    global static List<echosign_dev1.AgreementTemplateLoadInvocableAction.AgreementTemplateLoadResponse> load(List<echosign_dev1.AgreementTemplateLoadInvocableAction.AgreementTemplateLoadRequest> requests) {
        return null;
    }
global class AgreementTemplateLoadRequest {
    @InvocableVariable(label='Async Processing' description='Specify whether the processing will occur asynchronously.' required=false)
    global Boolean isAsync;
    @InvocableVariable(label='Master Record ID' description='The record ID of the master record of the master object type specified on the agreement template or leave blank for global.' required=false)
    global Id masterId;
    @InvocableVariable(label='Agreement Template ID' description='The record ID of the agreement template to use or leave blank for default.' required=false)
    global Id templateId;
    @InvocableVariable(label='Agreement Template Runtime Variables' description='The comma separated name and value pairs of runtime variables (name1=value1,name2=value2).' required=false)
    global List<String> templateVariables;
    global AgreementTemplateLoadRequest() {

    }
}
global class AgreementTemplateLoadResponse {
    @InvocableVariable(label='Agreement ID' description='The record ID of the generated agreement.' required=false)
    global Id agreementId;
    @InvocableVariable(label='Error' description='Any error which occured when generating the agreement.' required=false)
    global String error;
    global AgreementTemplateLoadResponse() {

    }
}
}
