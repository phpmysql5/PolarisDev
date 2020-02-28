/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class EchoSignApiService {
    global static String AGREEMENT_APPROVED_STATUS;
    global static String AGREEMENT_SIGNED_STATUS;
    global EchoSignApiService() {

    }
    global static void cancelDocument(Id agreementId) {

    }
    global static void delegateSigner(Id agreementId, String delegatedEmail) {

    }
    global static void delegateSigner(Id agreementId, String delegatedEmail, String message) {

    }
    global static echosign_dev1.EchoSignApiService.DocumentInfo getDocumentInfo(Id agreementId) {
        return null;
    }
    global static List<echosign_dev1.EchoSignApiService.SigningUrl> getSigningUrls(Id agreementId) {
        return null;
    }
    global static List<echosign_dev1.EchoSignApiService.SigningUrl> getSigningUrls(Id agreementId, Boolean isUserFilter) {
        return null;
    }
    global static echosign_dev1.EchoSignApiService.AgreementViewUrl getViewAgreementUrl(Id agreementId) {
        return null;
    }
    global static void removeDocument(Id agreementId) {

    }
    global static void replaceSigner(Id replacementRecipientId) {

    }
    global static void replaceSigner(Id replacementRecipientId, String message) {

    }
    global static echosign_dev1.EchoSignApiService.SendDocumentResult sendDocument(Id agreementId) {
        return null;
    }
    global static void sendReminder(Id agreementId) {

    }
global enum ACTION_TYPE {AGREEMENT_CANCEL, AGREEMENT_DELETE, AGREEMENT_REMIND, AGREEMENT_SEND, AGREEMENT_UPDATE}
global class AgreementViewUrl {
    global String viewUrl {
        get;
        set;
    }
    global AgreementViewUrl() {

    }
}
global class DocumentHistoryEvent {
    global String actingUserIpAddress {
        get;
        set;
    }
    global String eventType {
        get;
        set;
    }
    global String participantEmail {
        get;
        set;
    }
    global DocumentHistoryEvent() {

    }
}
global class DocumentInfo {
    global Map<String,Map<String,echosign_dev1.EchoSignApiService.ParticipantInfo>> alternateParticipantsByEmail {
        get;
        set;
    }
    global Map<String,List<echosign_dev1.EchoSignApiService.DocumentHistoryEvent>> historyByEmail {
        get;
        set;
    }
    global Map<String,echosign_dev1.EchoSignApiService.DocumentHistoryEvent> historyEventByTimeType {
        get;
        set;
    }
    global Map<String,echosign_dev1.EchoSignApiService.ParticipantInfo> participantsByEmail {
        get;
        set;
    }
    global Map<String,echosign_dev1.EchoSignApiService.ParticipantInfo> participantsByName {
        get;
        set;
    }
    global String senderEmail {
        get;
        set;
    }
    global String status {
        get;
        set;
    }
    global DocumentInfo() {

    }
}
global class ParticipantInfo {
    global String company {
        get;
        set;
    }
    global String email {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global String status {
        get;
        set;
    }
    global String title {
        get;
        set;
    }
    global ParticipantInfo() {

    }
}
global class SendDocumentResult {
    global String documentKey {
        get;
        set;
    }
    global Exception error {
        get;
        set;
    }
    global String url {
        get;
        set;
    }
    global SendDocumentResult() {

    }
}
global class SigningUrl {
    global String email {
        get;
        set;
    }
    global String esignUrl {
        get;
        set;
    }
    global String simpleEsignUrl {
        get;
        set;
    }
    global SigningUrl() {

    }
}
}
