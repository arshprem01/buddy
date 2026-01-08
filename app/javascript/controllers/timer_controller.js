import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time", "audio", "muteButton", "muteIcon", "muteText"]
  static values = {
    startTime: String
  }

  connect() {
    this.isMuted = false
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
    this.playAudio()
    this.timer = setInterval(() => {
      this.update()
    }, 1000)
  }

  stopTimer() {
    if (this.timer) {
      clearInterval(this.timer)
    }
    this.pauseAudio()
  }

  toggleAudio() {
    this.isMuted = !this.isMuted

    if (this.isMuted) {
      this.pauseAudio()
      this.muteIconTarget.textContent = "🔇"
      this.muteTextTarget.textContent = "Nature Sounds Off"
      this.muteButtonTarget.classList.add("opacity-50")
    } else {
      this.playAudio()
      this.muteIconTarget.textContent = "🔊"
      this.muteTextTarget.textContent = "Nature Sounds On"
      this.muteButtonTarget.classList.remove("opacity-50")
    }
  }

  playAudio() {
    if (!this.isMuted && this.hasAudioTarget) {
      this.audioTarget.play().catch(e => console.log("Audio play failed (interaction required):", e))
    }
  }

  pauseAudio() {
    if (this.hasAudioTarget) {
      this.audioTarget.pause()
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
