import { LightningElement, api } from 'lwc';
import { FlowAttributeChangeEvent } from 'lightning/flowSupport';

export default class FlowTimeInput extends LightningElement {
  @api label;
  @api get value() {
    return this._value;
  }
  set value(x) {
    this._value = x;
  }

  onTimeChange(event) {
    this._value = event.target.value;
    this.dispatchEvent(new FlowAttributeChangeEvent('value', this._value));
  }
}
