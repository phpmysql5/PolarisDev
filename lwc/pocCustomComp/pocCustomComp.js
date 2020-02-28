import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class PocCustomComp extends LightningElement {
    @api recordId;
    @api acceptedFormats;
    handleUploadFinished() {
        this.dispatchEvent(new CustomEvent('uploadfinished', {
            composed: true,
            bubbles: true,
            cancelable: true,
            detail: {
                data: { name: 'some data', recordId: this.recordId }
            }
        }));
        
        this.dispatchEvent(new ShowToastEvent({
            title: 'Completed',
            message: 'File has been uploaded',
        }));
    }
}