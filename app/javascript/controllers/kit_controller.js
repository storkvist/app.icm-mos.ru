import { Controller } from 'stimulus';

// import * as Dropzone from 'dropzone';

export default class extends Controller {
  static targets = ['dropzone', 'images'];

  connect() {
    // this.dropzone = new Dropzone(this.dropzoneTarget);
    // this.dropzone.on('success', file => {
    //   fetch(this.data.get('images-url'), { credentials: 'same-origin' })
    //     .then(response => response.text())
    //     .then(html => {
    //       this.imagesTarget.innerHTML = html
    //     });
    // });
  }
}
