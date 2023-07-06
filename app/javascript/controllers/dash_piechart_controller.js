import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  connect() {
    new Chart(document.getElementById("pie-chart"), {
      type: 'pie',
      data: {
        labels: ["New job opportunity", "Career transition"],
        datasets: [{
          label: "Career",
          backgroundColor: ["#3e95cd", "#8e5ea2"],
          data: [84, 16]
        }]
      },
      options: {
        plugins: {
          title: {
            display: true,
            text: "Actual employee situation (%)"
          }
        }
      }
    });
  }
}
