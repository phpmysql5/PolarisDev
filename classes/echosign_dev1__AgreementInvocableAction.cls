/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AgreementInvocableAction {
    global AgreementInvocableAction() {

    }
global class AgreementActionRequest {
    @InvocableVariable(label='Agreement ID' description='The record ID of the agreement to take the action on.' required=true)
    global Id agreementId;
    global AgreementActionRequest() {

    }
}
global class AgreementActionResponse {
    @InvocableVariable(label='Error' description='Any error which occured when performing the agreement action.' required=false)
    global String error;
    global AgreementActionResponse() {

    }
}
}
