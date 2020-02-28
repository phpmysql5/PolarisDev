import { LightningElement, track, wire } from 'lwc';
import startRequestURL from '@salesforce/apexContinuation/ContinuationHandler_AC.startRequestURL';
export default class LWCWithContinuationCallout extends LightningElement {
    @track studentList;
    @track customerList;
    @track candidateList;
    @track loaded = false;


    startRequestURL() {
        this.loaded = true;
        startRequestURL()
        .then(result => {
            var parsedVal = JSON.parse(result);
            
            this.studentList = parsedVal.studentWrapperList;
            console.log('studentList -->  '+JSON.stringify(this.studentList));

            
            this.candidateList = parsedVal.candidateWrapperList;
            console.log('candidateList -->  '+JSON.stringify(this.candidateList));

            
            this.customerList = parsedVal.customerWrapperList;
            console.log('customerList -->  '+JSON.stringify(this.customerList));
            this.loaded = false;
        })
        .catch(error => {
            this.error = error;
        });
    }

}