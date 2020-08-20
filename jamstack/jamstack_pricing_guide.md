# JamStack platform pricing guide

Comparison of pricing across major JamStack platforms

## Vercel

| Type    | Hobby | Pro                       |
| ------- | ----- | ------------------------- |
| Pricing | Free  | \$20 per month per member |

### Fair Use Policies

| Type                           | Hobby         | Pro           |
| ------------------------------ | ------------- | ------------- |
| Bandwidth                      | 100 GB        | 1TB           |
| Serverless functions execution | 100 GB-Hrs    | 1000 GB-Hrs   |
| Build execution                | Up to 100 hrs | Up to 400 hrs |

### Hard Limits

| Limit Type                              | Hobby | Pro  | Enterprise |
| --------------------------------------- | ----- | ---- | ---------- |
| Deployments (per day)                   | 100   | 3000 | Custom     |
| Serverless functions per deployment     | 12    | 24   | Custom     |
| Serverless functions per month          | 160   | 640  | Custom     |
| Serverless functions duration (seconds) | 10    | 60   | 900        |
| Deployments created from CLI per week   | 2000  | 2000 | Custom     |
| Members per team                        | NA    | 10   | Custom     |

## Netlify

| Type    | Starter | Pro                       | Business                  |
| ------- | ------- | ------------------------- | ------------------------- |
| Pricing | Free    | \$19 per month per member | \$99 per month per member |

### Included features

| Type                            | Starter                | Pro                    | Business  |
| ------------------------------- | ---------------------- | ---------------------- | --------- |
| Concurrent builds               | 1                      | 3                      | 5         |
| Bandwidth                       | 100GB                  | 400GB                  | 600 GB    |
| Build minutes                   | 300                    | 1000                   | 1000      |
| Websites                        | Unlimited              | Unlimited              | Unlimited |
| Serverless function invocations | 125k per site          | 125k per site          | Unlimited |
| Forms submissions               | 100 per site per month | 100 per site per month | Unlimited |
| Identity active users           | 1k per site/month      | 1k per site/month      | Unlimited |
| Large media transformations     | 2.5k per site/month    | 2.5k per site/month    | Unlimited |
| Site Analytics                  | \$9 per site/month     | \$9 per site/month     | Unlimited |

### Additional pricing beyond inclusions

| Type                            | Starter         | Pro             | Business        |
| ------------------------------- | --------------- | --------------- | --------------- |
| Concurrent builds               | NA              | \$40 each       | \$40 each       |
| Bandwidth                       | \$20 per 100 GB | \$20 per 100 GB | \$20 per 100 GB |
| Build minutes                   | \$7 per 500     | \$7 per 500     | \$7 per 500     |
| Serverless function invocations | \$25+           | \$25+           | NA              |
| Form submissions                | \$19+           | \$19+           | NA              |
| Identity active users           | \$99            | \$99            | Unlimited       |
| Large media transformations     | \$20+           | \$20            | Unlimited       |

## Additional Thoughts

1. Both platforms great for hobby+personal sites
1. For businesses, these platforms are great for teams that have little backend expertise AND/OR no time to invest in backend
1. Vercel seems better-oriented towards NextJS and offers far greater build minutes at the expense of limits on serverless functions
   1. However, overall Vercel pricing model seems less intuitive
1. Netlify Business pricing offers a few unlimited pricing categories. Are they really unlimited?
