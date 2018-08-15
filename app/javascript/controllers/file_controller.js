import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['filename', 'input']

  initialize() {
    this.inputTarget.addEventListener('change', () => {
      if (this.inputTarget.files.length > 0) {
        this.filenameTarget.innerHTML = this.inputTarget.files[0].name;
      }
    });
  }
}
