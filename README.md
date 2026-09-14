# Muwaqqit

A Flutter prayer-times display application designed for masjid screens. It calculates the daily prayer timetable from the device's location and shows a live, full-screen dashboard with the current time, a countdown to the next Azan or Iqamah, and the day's prayer schedule.

## Project Overview

Muwaqqit (Arabic for "timekeeper") turns a landscape tablet, TV or browser into a masjid prayer-time board. Prayer times are calculated on the device with astronomical formulas, so no internet connection or external API is needed. The dashboard updates every second, and the display is built to be read clearly from across a prayer hall.

## Key Features

**Prayer Time Calculation**
- Offline astronomical calculation using the `adhan` library
- Karachi calculation method with Shafi madhab for Asr
- Six daily times: Fajr, Sunrise, Dhuhr, Asr, Maghrib and Isha
- Automatic Jumu'ah label on Fridays
- Next day's Fajr computed for the overnight countdown
- Daily timetable cached and recalculated only when the date changes

**Azan & Iqamah Countdown**
- Live countdown to the next event, covering both Azan and Iqamah
- Configurable Iqamah gaps per prayer (for example, Fajr +20 min, Maghrib +5 min)
- "Fajr ends in" countdown up to sunrise
- Automatic rollover to the next day's Fajr after Isha

**Live Dashboard**
- Large current-time panel with an animated 60-dot seconds ring
- Countdown panel with a reverse (anti-clockwise) seconds ring
- Prayer bar that highlights the current prayer
- Header showing the Gregorian date, masjid name and Hijri date
- Refreshed every second with a periodic timer

**Location Handling**
- Device GPS location through `geolocator` with runtime permission requests
- Graceful fallback to Colombo coordinates when location is disabled, denied or unavailable

**Display-First Experience**
- Landscape-locked, immersive full-screen mode for dedicated displays
- Responsive layout that scales the time panels to any screen size
- Outlined large-number typography for legibility at a distance
- Android and web support

## Architecture Highlights

- Clean Architecture with data, domain and presentation layers
- Feature-based modular structure
- BLoC/Cubit state management for predictable state handling
- Repository pattern with abstract domain contracts
- Dedicated services for location and prayer-time calculation
- Immutable entities with hand-written `copyWith`, and no code generation
- Reusable custom widgets (seconds ring, time display panel, prayer slot, dotted dividers)

## Technical Stack

- **Frontend:** Flutter, Dart 3.9+
- **State Management:** flutter_bloc
- **Prayer Calculation:** adhan
- **Location:** geolocator
- **Formatting:** intl
- **Typography:** Google Sans, Product Sans (bundled)
- **Platforms:** Android, Web

## Core Screens

1. **Dashboard** - Header bar with dates and masjid name, current-time and countdown panels, and the daily prayer-time bar
