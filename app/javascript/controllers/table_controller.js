import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['filter', 'checkAll', 'checkbox'];

  filter() {
    this.filterTargets.forEach((input) => {
      console.log(input);
    });
  }

  checkAll() {
    const checked = this.checkAllTarget.checked;
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.checked = checked;
    });
  }

  uncheckCheckAll(event) {
    if (!event.currentTarget.checked) {
      this.checkAllTarget.checked = false;
    }
  }
}
