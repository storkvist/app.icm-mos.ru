import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['filter', 'checkAll', 'checkbox'];

  connect() {
    this.checkIfSomethingIsSelected();

    this.checkboxTargets.forEach((checkbox) =>  {
      checkbox.addEventListener('change', () => {
        this.checkIfSomethingIsSelected();
      }, false);
    });
  }

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

    this.checkIfSomethingIsSelected();
  }

  uncheckCheckAll(event) {
    if (!event.currentTarget.checked) {
      this.checkAllTarget.checked = false;
    }
  }

  checkIfSomethingIsSelected() {
    const link = document.querySelector('.export-selected');
    const selectedItems = this.checkboxTargets.filter((item) => item.checked);

    if (selectedItems.length > 0) {
      link.classList.remove('is-hidden');

      const href = link.href.replace(/\?.*/, '');
      const ids = selectedItems.map((item) => `kit_ids[]=${item.value}`).join('&');

      link.setAttribute('href', `${href}?${ids}`);
    } else {
      link.classList.add('is-hidden');
    }
  }
}
