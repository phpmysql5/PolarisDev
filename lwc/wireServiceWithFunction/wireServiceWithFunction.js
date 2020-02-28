import { LightningElement, track, wire, api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class WireServiceUsingFunction extends LightningElement {
    @track accountName;    
    @api accid;

    @wire(getRecord, { recordId: '$accid', fields: ['Account.Name'] })
    // eslint-disable-next-line no-unused-vars
    wiredAccount({ error, data }) {
        if (data) {
            this.accountName = data.fields.Name.value;
        }
        else{
            this.accountName = error.value;
        }
    }

    renderedCallback(){
        // eslint-disable-next-line no-console
        console.log('Render Completed - Wire Service Using Function');
    }
}