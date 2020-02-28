import { LightningElement, wire, api } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import Account_Site from '@salesforce/schema/Account.Site';


//import STATUS_FIELD from '@salesforce/schema/Case.Status';
//import ID_FIELD from '@salesforce/schema/Case.Id';

//import { updateRecord } from 'lightning/uiRecordApi';
//import STATUS_FIELD from '@salesforce/schema/Case.Status';

//const fields = [STATUS_FIELD];

const FIELDS = [
    Account_Site 
];

import {
    ShowToastEvent
    } from 'lightning/platformShowToastEvent' ;

export default class closeCaseFunctionality extends LightningElement {
    @api recordId;
    @api objectName  ;
    
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    account;

    get accountSite() {
      return  getFieldValue(this.account.data, Account_Site);
      
        // eslint-disable-next-line no-console
        //console.log(email +'Karthik ');
        //return email;
    }
     
    handleSuccess (){
        const evt = new ShowToastEvent({
            title: "Success!",
            message: "The Contact's record has been successfully saved.",
            variant: "success",
        });
        this.dispatchEvent(evt);
    }

    

    /*updateCase()
    {
        const fields = {};
            fields[ID_FIELD.fieldApiName] = this.recordId;
            
            fields[STATUS_FIELD.fieldApiName] = this.value;

            const recordInput = { fields };

       /* let record ={fields:{
            Id : this.recordId,
            status :this.value,
        },
    };
*/
    /*updateRecord(recordInput).
    // eslint-disable-next-line no-unused-vars
    then(() =>{
        this.dispatchEvent(new ShowToastEvent({
        
                title: 'Success',
                message: 'Record Is Updated',
                variant: 'success',
            }),
        );
    })
    // eslint-disable-next-line no-unused-vars
    .catch(error => {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error on data save',
                message: 'Not able to update',
                variant: 'error',
            }),
        );
    });

        
    }






    /*
    status = STATUS_FIELD;
    @wire(getRecord, { recordId: '$recordId', fields })
    case;
 
    //get status() {
    //    return getFieldValue(this.case.data, STATUS_FIELD);
    //}
    */
    
}