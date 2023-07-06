import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  connect() {
    console.log("chart connected");
    new Chart(document.getElementById("bar-chart"), {
      type: 'bar',
      data: {
        labels: ["Lack of recognition", "Lack of career development", "Toxic corporate culture", "Unsatisfactory remuneration", "Work-life balance issues"],
        datasets: [
          {
            label: "Factors",
            backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
            data: [25, 30, 10, 20, 15]
          }
        ]
      },
      options: {
        plugins: {
          title: {
            display: true,
            text: "Factors of resignation (%)"
          }
        }
      }
    });
  }
}
