import { LightningElement,track } from 'lwc';

export default class HelloWebComponent extends LightningElement {
    @track greeting ='Karthik';
    handleGreetingChange(event)
{
    this.greeting = event.target.value;
}
}