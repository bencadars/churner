import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  connect() {
    new Chart(document.getElementById("bar-chart-horizontal"), {
      type: 'horizontalBar',
      data: {
        labels: ["Provide opportunities for professional development and continuing education", "Improve perks and rewards", "Foster a more inclusive and collaborative corporate culture", "Improve internal communication and transparency", "Reduce workload and promote work-life balance"],
        datasets: [
          {
            label: "Suggestions",
            backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
            data: [20, 30, 25, 40, 25]
          }
        ]
      },
      options: {
        indexAxis: 'y',
        plugins: {
          title: {
            display: true,
            text: "Suggestions given by former employees (%)"
          }
        }
      }
    });
  }
}
