import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  connect() {
    console.log("chart connected");
    new Chart(document.getElementById("bar-chart"), {
      type: 'bar',
      data: {
        labels: ["Lack of recognition", "Lack of career development", "Covid impact", "Unsatisfactory remuneration", "Work-life balance issues"],
        datasets: [
          {
            label: "",
            backgroundColor: ["332c54", "rgb(232, 169, 169)", "rgb(235, 216, 178)", "rgb(212, 173, 252)", "rgb(244, 211, 211)"],
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
