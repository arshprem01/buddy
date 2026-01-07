import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time"]
  static values = {
    startTime: String
  }

  connect() {
    if (this.hasStartTimeValue) {
      this.startTimer()
    }
  }

  disconnect() {
    this.stopTimer()
  }

  startTimer() {
    this.stopTimer()
    this.update()
    this.timer = setInterval(() => {
      this.update()
    }, 1000)
  }

  stopTimer() {
    if (this.timer) {
      clearInterval(this.timer)
    }
  }

  update() {
    const start = new Date(this.startTimeValue).getTime()
    const now = new Date().getTime()
    const diff = Math.floor((now - start) / 1000)

    const hours = Math.floor(diff / 3600)
    const minutes = Math.floor((diff % 3600) / 60)
    const seconds = diff % 60

    const displayHours = Math.max(0, hours)
    const displayMinutes = Math.max(0, minutes)
    const displaySeconds = Math.max(0, seconds)

    this.timeTarget.textContent = `${this.pad(displayHours)}:${this.pad(displayMinutes)}:${this.pad(displaySeconds)}`
  }

  pad(num) {
    return num.toString().padStart(2, "0")
  }
}
