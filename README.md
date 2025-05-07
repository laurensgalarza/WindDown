# Wind Down

**Wind Down** is a night routine assistant app designed to help users relax, reflect, and build healthier nighttime habits through journaling, meditation sounds, and personalized sleep insights.

---

## Features

- **Journal Page** — Log journal entry; view and delete past entries
- **Meditative Sounds** — Play relaxing background audio to wind down
- **Sleep Insights** — Get weather-based insights that influence sleep quality

---

## Purpose and Target Audience

Wind Down is a simple, aesthetic app designed to guide users through a calming night routine. By combining journaling, meditative sounds, and personalized weather-based insights, the app encourages relaxation, mindfulness, and better sleep.

It's especially aimed at individuals who feel overstimulated at night and struggle to "wind down". Each feature is crafted to help users ease into restful sleep on their own terms.

---

## API Usage

Weather data is fetched from the [OpenWeatherMap API](https://openweathermap.org/api):

- **Base URL:** `https://api.openweathermap.org/data/2.5`
- **Endpoint:** `/weather?q={city}&units=imperial&appid={API key}`
- **Data used:** Temperature, wind speed, humidity

These metrics power personalized sleep insights like:
> “Cool temperatures tonight promote deep sleep.”

---

## Wireframes

Figma design:  
🔗 [View Wireframes](https://www.figma.com/design/mRb8cN2e4ahFwJpXt6OuMl/Wind-Down-app?node-id=0-1&t=AhmAn0A5dE8h6mmM-1)

---

## Tech Stack

- Swift & SwiftUI
- REST APIs (OpenWeatherMap)

---

## Future Developments

Wind Down was originally developed as a term project for an iOS Development course, but I plan to continue improving it. Some features I’d like to implement include:

- **Home Screen Enhancements**: Make the home screen more engaging with visual mood elements, daily quotes, or ambient animations to set the tone for the night.

- **Mood Recording in Journal**:  Add a mood recording feature that saves alongside journal entry. This would possibly require reworking how to journal entry is saved and decoded.

- **Settings Improvements**: Allow users to set a default city for weather insights, toggle between light and dark themes, and manage scheduled nightly reminders.

- **Scheduled Notifications**: Enable customizable push notifications to remind users when it's time to wind down, encouraging consistent sleep habits. Use alternating messages, possibly integrated with the insight message.

- **App Store Deployment**: I'm exploring the possibility of polishing and publishing Wind Down on the App Store. Even if it remains a personal project, I'd love to make it accessible to others seeking a peaceful end to their day.

---

## Getting Started

To run this project:
1. Clone the repo
2. Open the `.xcodeproj` file in Xcode
3. Run the app on simulator or device
