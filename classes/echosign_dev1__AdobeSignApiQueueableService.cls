/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AdobeSignApiQueueableService implements Database.AllowsCallouts, System.Queueable {
    global AdobeSignApiQueueableService(echosign_dev1.AdobeSignApiQueueableService.QueueableServiceParameter serviceParameter) {

    }
global class QueueableServiceParameter {
    global echosign_dev1.EchoSignApiService.ACTION_TYPE actionType {
        get;
        set;
    }
    global Id agreementId {
        get;
        set;
    }
    global QueueableServiceParameter() {

    }
}
}
