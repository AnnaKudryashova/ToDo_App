import { LightningElement } from 'lwc';

const delay = 300;

export default class SearchBlock extends LightningElement {
    searchValue = '';

    handleSearchChange(event) {
        window.clearTimeout(this.delayTimeout);
        const searchValue = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.searchValue = searchValue;
            const searchEvent = new CustomEvent('search', {
                detail: this.searchValue
            });
            this.dispatchEvent(searchEvent);
        }, delay);
    }
}