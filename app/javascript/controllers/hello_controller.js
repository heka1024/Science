import { Controller } from "@hotwired/stimulus"

class HelloController extends Controller {
    static targets = ["name"]

    greet() {
        console.log(`Hello, ${this.nameTarget.value}!`)
    }

    get name() {
        return this.nameTarget.value
    }
}

export default HelloController