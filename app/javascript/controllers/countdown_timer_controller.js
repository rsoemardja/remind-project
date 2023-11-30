import { Controller } from "stimulus"

export default class extends Controller {
 getDate() {
    const date = new Date(this.data.get("HH"), this.data.get("MM"), this.data.get("SS"))
    const today = new Date();
    return date
  }
}
