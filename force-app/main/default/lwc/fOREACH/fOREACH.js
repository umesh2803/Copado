import { LightningElement } from 'lwc';

export default class FOREACH extends LightningElement {

    students = 
        [
            {
            id : '111',
            Name:'Harry',
            branch:'CS'
            },
            {
                id : '112',
                Name:'Potter',
                branch:'IT' 
            },
            {
                id : '113',
                Name:'Potter',
                branch:'Pharma' 
            }
        ];
    
}