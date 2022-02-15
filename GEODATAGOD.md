
## Live data geo querying
- 2 sides: Queriables & Queries

### Queriables
- Add queriables these will be websockets you open between clients who's live location you will be querying. Upon connecting they wait to be sent request to ask their location.

### Querying
- When you want to query by lat, long, radius, result_cap: All those who are connected to socket have their data retrieved by geohash resolution corresponding to input, and returned.

### Issues
- How to optimize not querying all queriables for location?

## Use case flow
- Queriables connect via websockets and listen to a room.
- Sever has get end points which take lat, long, proximity, and cap.
- Server when asked for query get lat and long from queriables.
- All of these lat and longs are converted to geohashes.
- based on radius and input lat and long we construct a geohash
- we match the query geohash to result geohashes, and rank them by remaining geohash digits, and return those.