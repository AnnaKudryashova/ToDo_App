import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import TODO_OBJECT from '@salesforce/schema/ToDo__c';
import NAME_FIELD from '@salesforce/schema/ToDo__c.Name';
import DESCRIPTION_FIELD from '@salesforce/schema/ToDo__c.Description__c';
import CATEGORY_FIELD from '@salesforce/schema/ToDo__c.Category__c';
import PRIORITY_FIELD from '@salesforce/schema/ToDo__c.Priority__c';
import STATUS_FIELD from '@salesforce/schema/ToDo__c.Status__c';

export default class PopUpEditTodo extends LightningElement {
    @api isPopUpOpen;
    @api recordId;

    objectApiName = TODO_OBJECT;
    name = NAME_FIELD;
    description = DESCRIPTION_FIELD;
    category = CATEGORY_FIELD;
    priority = PRIORITY_FIELD;
    status =STATUS_FIELD;
    
    handleSuccess(event) {
        this.closeCreatePopUp();
        const toastEvent = new ShowToastEvent({
            title: "Todo edited",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
        const editEvent = new CustomEvent('edit');
        this.dispatchEvent(editEvent);
    }

    closeCreatePopUp() {
        const closePopUpEvent = new CustomEvent('close');
        this.dispatchEvent(closePopUpEvent);
    }
}