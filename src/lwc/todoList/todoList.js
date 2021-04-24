import { LightningElement, api, wire } from "lwc";
import getTodoList from "@salesforce/apex/TodoController.getTodoList";
import { refreshApex } from '@salesforce/apex';

export default class TodoList extends LightningElement {
    @api searchValue;
    todos;
    error;
    resultForRefresh;
    isPopUpCreateOpen = false;
    isPopUpEditOpen = false;
    isPopUpCreateSubOpen = false;
    isPopUpEditSubOpen = false;
    recordIdToEdit;//
    recordIdToSubEdit;//
    recordIdForSubCreate;//

    @wire(getTodoList, { searchValue: '$searchValue' })
    wiredTodos(result) {
        if (result.data != undefined && result.data.length > 0) {
            this.resultForRefresh = result;
            this.todos = result.data;
            this.error = false;
        } else {
            this.todos = false;
            this.error = true;
        }
    }

    handleDelete() {
        return refreshApex(this.resultForRefresh);
    }

    handleCreate() {
        return refreshApex(this.resultForRefresh);
    }

    handleEdit() {
        return refreshApex(this.resultForRefresh);
    }

    showCreatePopUp() {
        this.isPopUpCreateOpen = true;
    }

    handleClosePopUp() {
        this.isPopUpCreateOpen = false;
        this.isPopUpEditOpen = false;
        this.isPopUpCreateSubOpen = false;
        this.isPopUpEditSubOpen = false;
    }

    handleShowEdit(event) {
        this.recordIdToEdit = event.detail;
        this.isPopUpEditOpen = true;
    }

    handleShowCreateSub(event) {
        this.recordIdForSubCreate = event.detail;
        this.isPopUpCreateSubOpen = true;
    }

    handleShowEditSub(event) {
        this.recordIdToSubEdit = event.detail;
        this.isPopUpEditSubOpen = true;
    }
}