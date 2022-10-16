import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["name"]

    greet() {
        console.log(`Hello, ${this.nameTarget.value}!`)
    }
}