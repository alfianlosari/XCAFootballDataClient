# XCAFootbalDataClient

Swift Client to interact with [Football-Data API](https://www.football-data.org). It uses Swift Async Await API to fetch data from API.

## Register For API Key
To get a Free API Key with limited Quota, please visit [Football-Data API](https://www.football-data.org)

## Usage

### Initialize passing API Key
```swift
let client = FootballDataClient(apiKey: "Your API KEY")
```

### Fetch Standings
Fetch latest table standings for EPL
```swift
let standings = try await client.fetchStandings(competitionId: 2021, filterOption: .latest)
```

### Fetch Top Scorers 
Fetch top scorers for Spanish La Liga on season 2020/2021
```swift
let scorers = try await client.fetchTopScorers(competitionId: 2014, filterOption: .year(2020)
```

