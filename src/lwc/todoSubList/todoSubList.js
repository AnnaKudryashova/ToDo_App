import { LightningElement, api } from 'lwc';

export default class TodoSubItems extends LightningElement {
    @api todoSubs;
    selectedItem;

    handleSelect(event) {
        this.selectedItem = event.detail.name;
    }
}