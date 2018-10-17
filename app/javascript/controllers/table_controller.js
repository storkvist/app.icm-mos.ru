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
    document.querySelectorAll('.create-export-form input[name="export[kit_ids][]"]').forEach((item) => {
      item.remove();
    });

    const button = document.querySelectorAll('.export-selected');
    const selectedItems = this.checkboxTargets.filter((item) => item.checked);

    if (selectedItems.length > 0) {
      button.forEach((b) => { b.classList.remove('is-hidden') });

      document.querySelectorAll('.create-export-form').forEach((form) => {
        selectedItems.forEach((item) => {
          let checkbox = document.createElement('input');
          checkbox.type = 'hidden';
          checkbox.name = 'export[kit_ids][]';
          checkbox.value = item.value;
          form.appendChild(checkbox);
        });
      });
    } else {
      button.forEach((b) => { b.classList.add('is-hidden') });
    }
  }
}
