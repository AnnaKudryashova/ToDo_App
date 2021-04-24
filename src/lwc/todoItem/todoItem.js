import { LightningElement, api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class TodoItem extends LightningElement {
    @api todoData;

    get isSubTodoExist() {
        return this.todoData.Sub_ToDos__r != undefined;
    }

    showEditPopUp(event) {
        const recordId = event.target.dataset.recordid;
        const showEditEvent = new CustomEvent('showedit', { detail: recordId });
        this.dispatchEvent(showEditEvent);
    }

    showCreatePopUp(event) {
        const recordId = event.target.dataset.recordid;
        const showCreateEvent = new CustomEvent('showcreatesub', { detail: recordId });
        this.dispatchEvent(showCreateEvent);
    }

    deleteTodo(event) {
        const recordId = event.target.dataset.recordid;
        
        deleteRecord(recordId)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Todo ' + this.todoData.Name + ' was deleted',
                        variant: 'success'
                    })
                );
                const deleteEvent = new CustomEvent('delete');
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