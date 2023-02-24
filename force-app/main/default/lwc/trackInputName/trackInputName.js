import { LightningElement, track } from 'lwc';

export default class TrackInputName extends LightningElement {
    @track fname='Harry Potter';

    handlechange(event){
        this.fname=event.target.value ;
      
    }
}