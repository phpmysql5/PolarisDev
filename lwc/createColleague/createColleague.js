import { LightningElement, track } from 'lwc';
//To show succes/error message using Lightning Toast
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//Create Record using User Interface API
import { createRecord } from 'lightning/uiRecordApi';
import Colleague_Object from '@salesforce/schema/Colleagues__c';
import NAME_FIELD from '@salesforce/schema/Colleagues__c.Name';
import EMAIL_FIELD from '@salesforce/schema/Colleagues__c.Email__c';

export default class CreateColleague extends LightningElement {
    @track colleagueId;
    //Account Id passed from Parent to Child Component using API decorator.
    

    name = '';
    email = '';
      
    

    handleNameChange(event) {
        this.colleagueId = undefined;
        this.name = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
    }

 

    createColleague() {
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.name;
        fields[EMAIL_FIELD.fieldApiName] = this.email;
        fields[Colleague_Object.fieldApiName] = this.colleagueId;
        const recordInput = { apiName: Colleague_Object.objectApiName, fields };
        createRecord(recordInput)
            .then(colleague => {
                this.colleagueId = colleague.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({                        
                        title: 'Error creating record',
                        message: error.message,
                        variant: 'error',
                    }),
                );
            });
    }
}