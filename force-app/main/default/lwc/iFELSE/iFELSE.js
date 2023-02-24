import { LightningElement,track } from 'lwc';
 

export default class IFELSE extends LightningElement {

    @track fname='true';
    @track lname='false';

    handlefirst(event){
        this.fname=true;
        this.lname=true;
    }
    handlelast(event){
        this.fname=false;
        this.lname=false;
    }

}