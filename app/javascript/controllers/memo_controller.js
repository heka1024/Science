import { Controller } from "@hotwired/stimulus";

class MemoController extends Controller {
  static targets = ["source", "content"];

  update() {
    console.log(this.sourceTarget.value);
    this.contentTarget.innerText = this.sourceTarget.value;
  }
}

export default MemoController;