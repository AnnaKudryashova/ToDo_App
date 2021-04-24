import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import SUB_TODO_OBJECT from '@salesforce/schema/Sub_ToDo__c';
import NAME_FIELD from '@salesforce/schema/Sub_ToDo__c.Name';
import DESCRIPTION_FIELD from '@salesforce/schema/Sub_ToDo__c.Description__c';
import IS_DONE_FIELD from '@salesforce/schema/Sub_ToDo__c.Is_Done__c';
import TODO_FIELD from '@salesforce/schema/Sub_ToDo__c.ToDo__c';

export default class PopUpCreateTodo extends LightningElement {
    @api isPopUpOpen;
    @api recordId;

    objectApiName = SUB_TODO_OBJECT;
    name = NAME_FIELD;
    description = DESCRIPTION_FIELD;
    isDone = IS_DONE_FIELD;
    toDo = TODO_FIELD;
    
    handleSuccess(event) {
        this.closeCreatePopUp();
        const toastEvent = new ShowToastEvent({
            title: "Sub Todo created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
        const createEvent = new CustomEvent('create');
        this.dispatchEvent(createEvent);
    }

    closeCreatePopUp() {
        const closePopUpEvent = new CustomEvent('close');
        this.dispatchEvent(closePopUpEvent);
    }
}