import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['filter'];

  filter() {
    this.filterTargets.forEach((input) => {
      console.log(input);
    });
  }
}
