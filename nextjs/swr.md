# SWR Overview

[Reference](https://swr.vercel.app/)

## What it is

1. A React hooks library for data fetching
1. SWR from 'stale-while-revalidate', a cache invalidation strategy
1. First returns the data from the cache (stale), then sends the fetch request (revalidate) and updates data
1. Components get a stream of data updates **constantly** and **automatically**
1. Works with both React and React Native
1. Built-in cache and request deduplication

## Special Features

1. Polling on interval
1. Data dependency
1. Revalidation on focus
1. Revalidation on network recovery
1. Local mutation (optimistic UI)
1. Smart error retry

## Basic Example

```javascript
import useSWR from "swr";

function Profile() {
  const { data, error } = useSWR("/api/user", fetcher);
  if (error) return <div>failed to load</div>;
  if (!data) return <div>loading...</div>;
  return <div>hello {data.name}!</div>;
}
```

1. **key** is a unique id for the data (API URL) that will be passed to fetcher
1. **fetcher** is an async function that actually retrieves the data

   1. Simple fetcher function shown below:

   ```javascript
   const fetcher = (...args) => fetch(...args).then((res) => res.json());
   ```
