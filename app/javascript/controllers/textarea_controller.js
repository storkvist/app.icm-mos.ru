import { Controller } from 'stimulus';

export default class extends Controller {
  initialize() {
    this.minRows = 4;

    this.initBaseScrollHeight();
    this.resize();

    this.element.addEventListener('input', () => this.resize());
  }

  initBaseScrollHeight() {
    let savedValue = this.element.value;
    this.element.value = '';
    this.baseScrollHeight = this.element.scrollHeight;
    this.element.value = savedValue;
  }

  resize() {
    this.element.rows = this.minRows;
    const rows = Math.ceil((this.element.scrollHeight - this.baseScrollHeight) / 26);
    this.element.rows = this.minRows + rows;
  }
}
