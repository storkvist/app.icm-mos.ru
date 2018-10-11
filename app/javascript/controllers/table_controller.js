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
    const selectedItems = this.checkboxTargets.filter((item) => item.checked);
    const somethingSelected = selectedItems.length > 0;
    const exportLinks = document.querySelectorAll('.export-links');
    const exportLinksButton = document.querySelectorAll('.export-links button');

    if (somethingSelected) {
      exportLinks.forEach((div) => {
        div.classList.add('is-hoverable');
      });
      exportLinksButton.forEach((button) => {
        button.removeAttribute('disabled');
      });

      document.querySelectorAll('.export-links a').forEach((link) => {
        let href = link.href.replace(/\?.*/, '');
        link.setAttribute('href', href + '?' + selectedItems.map((item) => `ids[]=${item.value}`).join('&'));
      });
    } else {
      exportLinks.forEach((div) => {
        div.classList.remove('is-hoverable');
      });
      exportLinksButton.forEach((button) => {
        button.setAttribute('disabled', true);
      });
    }
  }
}
