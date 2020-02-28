import LightningDatatable from 'lightning/datatable';
import pocFileUpload from './pocFileUpload.html';
 
export default class PocLightningDatatable extends LightningDatatable {
    static customTypes = {
        fileUpload: {
            template: pocFileUpload,
            typeAttributes: ['acceptedFormats'],
        }
    };
}