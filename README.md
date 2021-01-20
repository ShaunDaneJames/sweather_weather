# Sweater Weather API

This API fetches data from several locations. It does so to aggregate data for the front end of this application.

## Table of Contents

- [Gems](#gems)
- [Setup](#setup)
- [Endpoints](#endpoints)

## Gems

This API uses the following gems:
- Faraday
- Fast JSON API
- Figaro
- bcrypt
- Rspec
- Shoulda-Matchers
- Simplecov

## Setup

1. Clone this repo

2. ```bundle install```

3. ```rails db:{create,migrate}```

4. Obtain your own API keys

5. ```rails s```

6. The [Endpoints](#endpoints) listed below should now be available to you!

## Endpoints

### Forecast
```GET /api/v1/forecast?location=denver,co```
```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-01-19T20:52:55.000-07:00",
                "sunrise": "2021-01-19T07:17:07.000-07:00",
                "sunset": "2021-01-19T17:04:03.000-07:00",
                "temp": 26.46,
                "feels_like": 20.86,
                "humidity": 59,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01n"
            },
            "daily_weather": [
                {
                    "date": "2021-01-19T12:00:00.000-07:00",
                    "sunrise": "2021-01-19T07:17:07.000-07:00",
                    "sunset": "2021-01-19T17:04:03.000-07:00",
                    "max_temp": 36.45,
                    "min_temp": 26.46,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-01-20T12:00:00.000-07:00",
                    "sunrise": "2021-01-20T07:16:35.000-07:00",
                    "sunset": "2021-01-20T17:05:12.000-07:00",
                    "max_temp": 50.79,
                    "min_temp": 32.38,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-01-21T12:00:00.000-07:00",
                    "sunrise": "2021-01-21T07:16:00.000-07:00",
                    "sunset": "2021-01-21T17:06:21.000-07:00",
                    "max_temp": 44.6,
                    "min_temp": 34.11,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-01-22T12:00:00.000-07:00",
                    "sunrise": "2021-01-22T07:15:24.000-07:00",
                    "sunset": "2021-01-22T17:07:31.000-07:00",
                    "max_temp": 42.13,
                    "min_temp": 30.83,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2021-01-23T12:00:00.000-07:00",
                    "sunrise": "2021-01-23T07:14:45.000-07:00",
                    "sunset": "2021-01-23T17:08:41.000-07:00",
                    "max_temp": 48.58,
                    "min_temp": 27.14,
                    "conditions": "light snow",
                    "icon": "13d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "2021-01-19T20:00:00.000-07:00",
                    "temp": 26.46,
                    "wind_speed": 0.18,
                    "wind_direction": 89,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "2021-01-19T21:00:00.000-07:00",
                    "temp": 29.17,
                    "wind_speed": 2.35,
                    "wind_direction": 216,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "2021-01-19T22:00:00.000-07:00",
                    "temp": 30.74,
                    "wind_speed": 1.81,
                    "wind_direction": 188,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "2021-01-19T23:00:00.000-07:00",
                    "temp": 31.69,
                    "wind_speed": 5.21,
                    "wind_direction": 188,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "2021-01-20T00:00:00.000-07:00",
                    "temp": 32.38,
                    "wind_speed": 6.73,
                    "wind_direction": 192,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "2021-01-20T01:00:00.000-07:00",
                    "temp": 32.58,
                    "wind_speed": 6.49,
                    "wind_direction": 198,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "2021-01-20T02:00:00.000-07:00",
                    "temp": 32.65,
                    "wind_speed": 6.6,
                    "wind_direction": 210,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "2021-01-20T03:00:00.000-07:00",
                    "temp": 32.67,
                    "wind_speed": 5.97,
                    "wind_direction": 219,
                    "conditions": "clear sky",
                    "icon": "01n"
                }
            ]
        }
    }
}
```

### Background
```GET /api/v1/backgrounds?location=denver,co```
```json
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "picture_url": "https://images.unsplash.com/photo-1600041161228-519e6dd27bac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTkxNjV8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
            "location": "denver,co",
            "source": "unsplash.com"
        }
    }
}
```

### Users
```POST /api/v1/users```
```json
{
    "data": {
        "id": "114",
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "719f9a1d-6cda-4753-b396-129dfbd4a441"
        }
    }
}
```

### Sessions
```POST /api/v1/sessions```
```json
{
    "data": {
        "id": "114",
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "719f9a1d-6cda-4753-b396-129dfbd4a441"
        }
    }
}
```

### RoadTrip
```POST /api/v1/road_trip```
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "denver",
            "end_city": "vail,co",
            "travel_time": "01 hrs 39 mins",
            "weather_at_eta": {
                "temperature": 14.92,
                "conditions": "clear sky"
            }
        }
    }
}
```
