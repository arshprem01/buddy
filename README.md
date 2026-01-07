# FocusBuddy 🧠 + 📖

FocusBuddy is a smart study companion designed to help students master their time without burning out. Use it to track your deep work sessions, visualize your progress, and get intelligent alerts when it's time to take a break.

I built this because tracking study hours manually is tedious, and existing timers don't tell you when you're pushing too hard. FocusBuddy solves that by calculating a real-time **Burnout Score** based on your daily activity.

---

## ✨ Features

- **Deep Work Timer**: A distraction-free, dark-themed timer interface to keep you in the flow.
- **Burnout Warning System**: The app analyzes your total study limits for the day. If you exceed recommended thresholds, it warns you (Low, Medium, High risk) so you know when to step back.
- **Weekly Analytics**: Interactive charts visualize your study trends over the last 7 days, helping you build consistency.
- **Glassmorphic UI**: A modern, eye-friendly Dark Mode design built with Tailwind CSS to reduce eye strain during late-night sessions.
- **Seamless Resume**: Dropped off? One-click resume from the dashboard gets you right back into your session without losing data.

## 🛠️ Tech Stack

This project is a modern **Ruby on Rails 7** application leveraging the power of **Hotwire** for a single-page-app feel without the complexity of a heavy frontend framework.

- **Backend**: Ruby on Rails 7.1
- **Database**: SQLite (optimized for local development).
- **Frontend**: 
  - **Tailwind CSS**: For that crisp, custom styling.
  - **StimulusJS**: Handles the client-side timer logic and interactivity.
  - **Turbo**: For instant page transitions and partial updates.
- **Visualization**: Chart.js (via CDN) & Chartkick.
- **Authentication**: Devise (secure user sessions).

## 🚀 Getting Started

If you want to run this on your own machine, here is exactly what you need to do:

1.  **Clone the repo**:
    ```bash
    git clone https://github.com/arsh/focus-buddy.git
    cd focus-buddy
    ```

2.  **Install dependencies**:
    Make sure you have Ruby installed (v3.2+ recommended).
    ```bash
    bundle install
    ```

3.  **Setup the database**:
    ```bash
    bin/rails db:create db:migrate
    ```

4.  **Fire it up**:
    ```bash
    bin/dev
    ```
    *Note: We use `bin/dev` to run both the Rails server and the Tailwind CSS watcher simultaneously.*

5.  **Open your browser**:
    Navigate to `http://localhost:3000`.

---

**Enjoy your study sessions!** 
