import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

// Connects to data-controller="bar-chart"
export default class extends Controller {

  connect() {

    let labels = document.querySelector("#stat").dataset.label;
    labels = JSON.parse(labels)
    let stat = document.querySelector("#stat").dataset.departure;
    stat = JSON.parse(stat)
    const value = ["resignation", "retirement", "termination", "layoff", "end of contract", "redundancy"]
    const result = []
    stat.forEach((object, index) => {
      value.forEach((key) => {
        if (!object.hasOwnProperty(key)) {object[key] = 0}
      })
      object["x"] = labels[index]
      result.push(object)
      console.log(labels[index])
    })

    new Chart(
      this.element,
      {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Resignation',
          backgroundColor: '#332c54',
          data: result,
          parsing: {
            yAxisKey: 'resignation'
          }
        }, {
          label: 'Layoff',
          backgroundColor: 'rgb(235, 216, 178)',
          data: result,
          parsing: {
            yAxisKey: 'layoff'
          }
        }, {
          label: 'Termination',
          backgroundColor: 'rgb(108, 155, 207)',
          data: result,
          parsing: {
            yAxisKey: 'termination'
          }
        }, {
          label: 'Retirement',
          backgroundColor: 'rgb(244, 211, 211)',
          data: result,
          parsing: {
            yAxisKey: 'retirement'
          }
        }, {
          label: 'End of Contract',
          backgroundColor: 'rgb(212, 173, 252)',
          data: result,
          parsing: {
            yAxisKey: 'end of contract'
          }
        }, {
          label: 'Redundancy',
          backgroundColor: 'rgb(232, 169, 169)',
          data: result,
          parsing: {
            yAxisKey: 'redundancy'
          }
        }
      ]
      },
      options: {
        plugins: {
          title: {
            display: true,
            text: 'Departure Reasons in the last 12 Month'
          },
        },
        responsive: true,
        scales: {
          x: {
            stacked: true,
          },
          y: {
            stacked: true
          }
        }
      }
    }
    )
  }
}

