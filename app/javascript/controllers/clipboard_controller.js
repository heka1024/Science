import { Controller } from "@hotwired/stimulus"

class ClipboardController extends Controller {
    static targets = ["source"]

    copy() {
        navigator.clipboard.writeText(this.sourceValue)
    }

    get sourceValue() {
        return this.sourceTarget.value
    }
}

export default ClipboardController