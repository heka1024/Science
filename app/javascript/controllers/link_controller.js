import { Controller } from "@hotwired/stimulus";

class LinkController extends Controller {
    click(event) {
        event.preventDefault()
    }
}

export default LinkController;