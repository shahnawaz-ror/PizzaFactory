// Using plain JavaScript (recommended for simplicity)
document.addEventListener('DOMContentLoaded', function() {
  const pizzaSelect = document.getElementById('pizza_select');
  
  if(pizzaSelect) {
    pizzaSelect.addEventListener('change', function() {
      const pizzaId = this.value;
      const sizeSelect = document.getElementById('size_select');
      
      // Clear previous options
      sizeSelect.innerHTML = '<option value="">Select Size</option>';
      
      if(pizzaId) {
        fetch(`/pizzas/${pizzaId}/pizza_variants`)
          .then(response => response.json())
          .then(variants => {
            variants.forEach(variant => {
              const option = document.createElement('option');
              option.value = variant.id;
              option.textContent = `${variant.size} ($${variant.price})`;
              sizeSelect.appendChild(option);
            });
          });
      }
    });
  }
});


// app/javascript/controllers/pizza_variants_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // This runs when the controller is connected
    const pizzaSelect = this.element.querySelector('#pizza_select');
    const sizeSelect = this.element.querySelector('#size_select');

    if (pizzaSelect) {
      pizzaSelect.addEventListener('change', () => {
        const pizzaId = pizzaSelect.value;
        
        // Clear previous options
        sizeSelect.innerHTML = '<option value="">Select Size</option>';
        
        if (pizzaId) {
          fetch(`/pizzas/${pizzaId}/pizza_variants`)
            .then(response => response.json())
            .then(variants => {
              variants.forEach(variant => {
                const option = document.createElement('option');
                option.value = variant.id;
                option.textContent = `${variant.size} ($${variant.price})`;
                sizeSelect.appendChild(option);
              });
            })
            .catch(error => console.error('Error fetching pizza variants:', error));
        }
      });
    }
  }
}
