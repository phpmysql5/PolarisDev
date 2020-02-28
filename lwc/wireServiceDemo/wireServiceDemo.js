import { LightningElement, track } from 'lwc';

export default class WireServiceDemo extends LightningElement {
    @track accountid;    
    
    fetchAccount(){ 
        this.accountid = this.template.querySelector('lightning-input').value;
    }

    renderedCallback(){
        // eslint-disable-next-line no-console
        console.log('Render Completed - Wire Service Demo');
    }
}