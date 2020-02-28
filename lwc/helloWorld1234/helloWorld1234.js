/* eslint-disable no-unused-vars */
/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';

export default class helloWorld extends LightningElement {
    @track greeting = 'World';
    @track myInput = 'Universe';
    handleChange(event) {
        this.greeting = event.target.value;
        console.log("event.target.value: ", event.target.value);
        this.myInput = this.greeting;
        console.log("Greeting: ", this.greeting);
        console.log("myInput: ", this.myInput);
    }
    handleClick () {
        this.greeting = this.myInput + ". It's a pleasure to meet you";
    }
}