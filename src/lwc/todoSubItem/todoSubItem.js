import { LightningElement, api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class TodoSubHelper extends LightningElement {
    @api todoSub;
    @api selectedItem;

    get isSelected() {
        return this.todoSub.Name == this.selectedItem;
    }

    showEditPopUp() {
        const recordId = this.todoSub.Id;
        const showEditEvent = new CustomEvent('showeditsub', { detail: recordId, bubbles: true, composed: true });
        this.dispatchEvent(showEditEvent);
    }

    handleDelete() {
        deleteRecord(this.todoSub.Id)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Todo ' + this.todoSub.Name + ' was deleted',
                        variant: 'success'
                    })
                );
                const deleteEvent = new CustomEvent('deletesub', { bubbles: true, composed: true });
                this.dispatchEvent(deleteEvent);
            })
            .catch((error) => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting record',
                        message: reduceErrors(error).join(', '),
                        variant: 'error'
                    })
                );
            });
    }
}