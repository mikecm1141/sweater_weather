# Sweater Weather

![alt text](https://img.shields.io/badge/ruby-2.4.0-red.svg "Ruby")
![alt text](https://img.shields.io/badge/rails-%3E%3D%205.1.0-red.svg "Ruby on Rails")
[![Build Status](https://travis-ci.org/mikecm1141/sweater_weather.svg?branch=master)](https://travis-ci.org/mikecm1141/sweater_weather)
[![Test Coverage](https://img.shields.io/badge/coverage-100%25-green.svg)](https://codecov.io/gh/mikecm1141/sweater_weather)

## Purpose

This is a back-end API endpoint application that will power a separate front-end application. It retrieves current, hourly, and daily weather from the Dark Sky API, using coordinates generated from a user inputted location gathered from the Google Geocoder API. This application also has the ability to hit the Flickr photo API to display a location-based image.

## System Requirements

 - Ruby >= 2.4.0
 - Rails >= 5.1.6
 - Your own Google API key
 - Your own Flickr API key
 - Your own Dark Sky API key

## Setup

1. Clone or fork this project to your local machine.
2. Run `bundle` in the project folder.
3. Run `figaro install` in the project folder.
4. Add the following API keys to config/application.yml with the variable names exactly as shown:
   - `FLICKR_API_KEY`
   - `GOOGLE_API_KEY`
   - `DARK_SKY_API_KEY`
5. Run `rails db:{create,migrate}` in the project folder.
6. Run `rspec` to run the full test suite, or `rails server` to load up the application.

## API Endpoints

### GET /api/v1/forecast?location=[city],[state abbreviation]

Returns the current, hourly, and daily forecast for the weather for that location.

Example usage:

`GET /api/v1/forecast?location=denver,co`

Example response:

```json
{
    "data": {
        "id": "Denver, CO",
        "type": "weather_result",
        "attributes": {
            "currently": {
                "time": 1541611120,
                "summary": "Mostly Cloudy",
                "icon": "partly-cloudy-day",
                "nearestStormDistance": 9,
            },
            "hourly": {
                "summary": "Partly cloudy until tomorrow morning.",
                "icon": "partly-cloudy-night",
                "data": [
                    {
                        "time": 1541610000,
                        "summary": "Overcast",
                        "icon": "cloudy",
                        "precipIntensity": 0,
                    }
                ]
            },
            "daily": {
                "summary": "Light snow (1–4 in.) today and Sunday, with high temperatures bottoming out at 31°F on Sunday.",
                "icon": "snow",
                "data": [
                    {
                        "time": 1541574000,
                        "summary": "Partly cloudy throughout the day.",
                        "icon": "partly-cloudy-day",
                    },
                ]
            }
        }
    }
}
```

### GET /api/v1/backgrounds?location=[city],[state abbreviation]

Returns a random background image for the inputted location.

Example usage:

`GET /api/v1/backgrounds?location=denver,co`

Example response:

```json
{
    "data": {
        "id": "Denver, CO",
        "type": "image_result",
        "attributes": {
            "random_image_url": "https://farm2.staticflickr.com/1914/30519496357_ecb6f5192b_o.jpg"
        }
    }
}
```

### POST /api/v1/users

Creates an account so users can save locations as favorites. All fields are required.

Example usage:

```
POST /api/v1/users

{
  "email": "example@example.org",
  "password": "password",
  "password_confirmation": "password"
}
```

Example response:

```json
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "api_key": "wAZ0MkPASX-ou9QOHnp8Qw"
      }
    }
}
```

### POST /api/v1/sessions

Logs in a user and returns their API key. All fields are required.

Example usage:

```
POST /api/v1/sessions

{
  "email": "example@example.org",
  "password": "password"
}
```

Example response:

```json
{
    "data": { 
        "id": "1",
        "type": "user",
        "attributes": {
            "api_key": "vV0agM5PqWKD85cPATxsaA"
        }
    }
}
```

### POST /api/v1/favorites

Saves a location as a favorite for a particular user. All fields are required.

Example usage:

```
POST /api/v1/favorites

body:

{
  "location": "Denver, CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

### GET /api/v1/favorites

Returns a list of the user's favorites with the current weather for each one. All fields are required.

Example usage:

```
GET /api/v1/favorites

{
  api_key: "vV0agM5PqWKD85cPATxsaA"
}
```

Example response:

```json
{
    "data": [
        {
            "id": "1",
            "type": "favorites",
            "meta": {
                "data": {
                    "id": "Denver,  CO",
                    "type": "weather_favorite",
                    "attributes": {
                        "currently": {
                            "time": 1541612833,
                            "summary": "Mostly Cloudy",
                            "icon": "partly-cloudy-day",
                            "nearestStormDistance": 10,
                            "nearestStormBearing": 273,
                            "precipIntensity": 0,
                            "precipProbability": 0,
                            "temperature": 36.47,
                            "apparentTemperature": 36.47,
                            "dewPoint": 23.52,
                            "humidity": 0.59,
                            "pressure": 1021.51,
                            "windSpeed": 1.85,
                            "windGust": 6.73,
                            "windBearing": 85,
                            "cloudCover": 0.75,
                            "uvIndex": 3,
                            "visibility": 6.18,
                            "ozone": 260.98
                        }
                    }
                }
            }
        },
        {
            "id": "2",
            "type": "favorites",
            "meta": {
                "data": {
                    "id": "Golden,  CO",
                    "type": "weather_favorite",
                    "attributes": {
                        "currently": {
                            "time": 1541612835,
                            "summary": "Mostly Cloudy",
                            "icon": "partly-cloudy-day",
                            "nearestStormDistance": 0,
                            "precipIntensity": 0,
                            "precipProbability": 0,
                            "temperature": 36.6,
                            "apparentTemperature": 36.6,
                            "dewPoint": 20.79,
                            "humidity": 0.52,
                            "pressure": 1021.51,
                            "windSpeed": 2.11,
                            "windGust": 7.39,
                            "windBearing": 110,
                            "cloudCover": 0.71,
                            "uvIndex": 3,
                            "visibility": 6.02,
                            "ozone": 259.99
                        }
                    }
                }
            }
        }
    ]
}
```

### DELETE /api/v1/favorites

Removes a favorite location for a particular user. All fields are required.

Example usage:

```
DELETE /api/v1/favorites

body:

{
  "location": "Denver, CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Example response:

```json
{
    "data": [
        {
            "id": "2",
            "type": "favorites",
            "meta": {
                "data": {
                    "id": "Golden,  CO",
                    "type": "weather_favorite",
                    "attributes": {
                        "currently": {
                            "time": 1541612835,
                            "summary": "Mostly Cloudy",
                            "icon": "partly-cloudy-day",
                            "nearestStormDistance": 0,
                            "precipIntensity": 0,
                            "precipProbability": 0,
                            "temperature": 36.6,
                            "apparentTemperature": 36.6,
                            "dewPoint": 20.79,
                            "humidity": 0.52,
                            "pressure": 1021.51,
                            "windSpeed": 2.11,
                            "windGust": 7.39,
                            "windBearing": 110,
                            "cloudCover": 0.71,
                            "uvIndex": 3,
                            "visibility": 6.02,
                            "ozone": 259.99
                        }
                    }
                }
            }
        }
    ]
}
```
