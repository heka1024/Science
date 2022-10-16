import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["source"]

    //v1 - with a button, using the browswer Clipboard API
    copy() {
        navigator.clipboard.writeText(this.sourceTarget.value)
    }

}