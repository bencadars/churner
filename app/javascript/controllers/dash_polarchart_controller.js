import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  connect() {
    new Chart(document.getElementById("polar-chart"), {
      type: 'polarArea',
      data: {
        labels: ["Opportunities", "Perks/rewards", "Corporate culture", "Transparency", "Work-life balance"],
        datasets: [
          {
            label: "Suggestions by former employees",
            backgroundColor: ["332c54", "rgb(232, 169, 169)", "rgb(235, 216, 178)", "rgb(212, 173, 252)", "rgb(244, 211, 211)"],
            data: [20, 30, 25, 40, 25]
          }
        ]
      },
      options: {
        plugins: {
          title: {
            display: true,
            text: "Suggestions by former employees"
          }
        }
      }
    });
  }
}
