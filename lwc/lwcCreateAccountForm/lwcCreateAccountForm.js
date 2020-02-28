/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';
export default class lwcCreateAccountForm extends LightningElement {
    @track showAccount;
    
    changeHandler(event) {
        this.showAccount = event.target.checked;
        console.log(this.showAccount);

    }
}