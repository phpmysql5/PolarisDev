import { LightningElement,api,track } from 'lwc';

export default class Child extends LightningElement {
    @api reactivepublicproperty;
    @track reactiveprivateproperty;
    nonreactiveprivateproperty;


    handleChange1(event)
   { 
       this.reactivepublicproperty = event.target.value;

   }

   handleChange2(event)
   {
       this.reactiveprivateproperty = event.target.value;
   }

   handleChange3(event)
   {
       this.nonreactiveprivateproperty= event.target.value;
   }



}