import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trash"
export default class extends Controller {
  trash() {
    this.updateTrash(true);
  }

  restore() {
    this.updateTrash(false);
  }

  updateTrash(inTrash) {
    const itemId = this.element.dataset.itemId;

    fetch(`/tasks/${itemId}/trash`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ in_trash: inTrash }),
    })
      .then(response => response.json())
      .then(data => {
        // Handle success or error as needed
        console.log(data);
      });
  }
  toggleTrashSubmenu() {
    const submenu = this.element.querySelector('.trash-submenu');
    submenu.classList.toggle('visible');
  }
}
