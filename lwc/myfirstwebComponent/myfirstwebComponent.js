import { LightningElement ,track} from 'lwc';

export default class MyfirstwebComponent extends LightningElement {
    @track

    contacts=[
        {
            Id :1,
            Name: 'Amy Taylor',
            Title :'VP of Engineering',
        },
        {
            Id :2,
            Name: 'Amy Taylor',
            Title :'VP of Engineering',
        },
        {
            Id : 3,
            Name : 'Amy Yuio',
            Title :'asasas'
        },
    ];
}