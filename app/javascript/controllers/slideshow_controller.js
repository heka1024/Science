import { Controller } from "@hotwired/stimulus";

class SlideshowController extends Controller {
    static targets = ["slide"]
    SLIDE_LIMIT = 4;

    initialize() {
        this.index = 0
        this.showCurrentSlide()
    }

    previous() {
        this.index = (this.index - 1) % this.SLIDE_LIMIT
        this.showCurrentSlide()
    }

    next() {
        this.index = (this.index + 1) % this.SLIDE_LIMIT
        this.showCurrentSlide()
    }

    showCurrentSlide() {
        this.slideTargets.forEach((element, index) => {
            element.hidden = (index !== this.index)
        })
    }
}

export default SlideshowController;