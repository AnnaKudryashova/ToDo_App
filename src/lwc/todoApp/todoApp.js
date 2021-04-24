import { LightningElement } from 'lwc';

export default class TodoApp extends LightningElement {
    searchValue = '';

    handleSearch(event) {
        this.searchValue = event.detail;
    }
}