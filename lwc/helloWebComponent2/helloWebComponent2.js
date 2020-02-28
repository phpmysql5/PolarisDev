import { LightningElement,track } from 'lwc';

export default class HelloWebComponent2 extends LightningElement {
    @track greeting = 'TrailBlazer';
    
    currentDate = new Date().toDateString();

    handleGreetingChange(event)
    {
        this.greeting= event.target.value;
    }

    get capitalizedGreeting()
    {
        return `Hello $(this.greeting.toUpperCase()}!`; 
    }

}