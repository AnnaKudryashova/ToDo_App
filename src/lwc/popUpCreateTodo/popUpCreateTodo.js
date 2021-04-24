import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import TODO_OBJECT from '@salesforce/schema/ToDo__c';
import NAME_FIELD from '@salesforce/schema/ToDo__c.Name';
import DESCRIPTION_FIELD from '@salesforce/schema/ToDo__c.Description__c';
import CATEGORY_FIELD from '@salesforce/schema/ToDo__c.Category__c';
import PRIORITY_FIELD from '@salesforce/schema/ToDo__c.Priority__c';
import STATUS_FIELD from '@salesforce/schema/ToDo__c.Status__c';

export default class PopUpCreateTodo extends LightningElement {
    @api isPopUpOpen;
    objectApiName = TODO_OBJECT;
    fields = [NAME_FIELD, DESCRIPTION_FIELD, CATEGORY_FIELD, PRIORITY_FIELD, STATUS_FIELD];
    
    handleSuccess(event) {
        this.closeCreatePopUp();
        const toastEvent = new ShowToastEvent({
            title: "Todo created",
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