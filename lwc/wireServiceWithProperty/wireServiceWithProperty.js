import { LightningElement,wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';


export default class WireServiceUsingProperty extends LightningElement {
    @api accid;

    @wire(getRecord, { recordId: '$accid', fields: ['Account.Website'] })
    account;

    get website(){
        if( typeof this.account.data !== 'undefined' ){
            return this.account.data.fields.Website.value
        }
        return '';
    }

    renderedCallback(){
        // eslint-disable-next-line no-console
        console.log('Render Completed - Wire Service Using Property');
    }
}