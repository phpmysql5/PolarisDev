import { LightningElement,track } from 'lwc';

export default class Hello extends LightningElement {
    
    @track greeting='Hi Bhai';
    changeHandler(event)
    {
        this.greeting = event.target.value;
    }





}