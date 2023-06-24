# XCAFootbalDataClient

Swift Client to interact with [Football-Data API](https://www.football-data.org). It uses Swift Async Await API to fetch data from API.

## Register For API Key
To get a Free API Key with limited Quota, please visit [Football-Data API](https://www.football-data.org)

## Usage

### Initialize passing API Key
```swift
let client = FootballDataClient(apiKey: "Your API KEY")
```

### Fetch Latest Standings
Fetch latest table standings for EPL
```swift
let standings = try await client.fetchLatestStandings(competitionId: 2021, filterOption: .latest)
```

### Fetch Top Scorers for Spanish La Liga on season 2020
Fetch latest table standings for EPL
```swift
let scorers = try await client.fetchTopScorers(competitionId: 2014, filterOption: .year(2020)
```
