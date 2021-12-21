# Overview of Cloudflare

## What it is

1. Global network that provides multiple services
   1. CDN
   1. Bot protection
   1. DNS resolution
   1. etc.
1. Primary use case: protect + accelerate public-facing web properties

## Protection

## DNS

## Domain registrar

## Workers

## Pages

## Basic Integration

1. Add domain
1. Change domain nameservers
1.

## Integration with S3

## Integration with EC2

## Integration with Vercel

## Integration with Netlify

## CDN

1. Cache static resources on edge servers across the Cloudflare network
   1. Content can include:
      1. HTML pages
      1. JS files
      1. Stylesheets
      1. Images
   1. Reduce origin server load and bandwidth
   1. Caches content based on:
      1. Where visitors come from
      1. Data center reached
      1. How often visitors require resource at data center
1. Default behaviour respects origin web server's cache headers (unless overridden with an Edge Cache TTL page rule)
   1. If Cache-Control header is private, no-store, no-cache or max-age=0, or if there is a cookie in the response, then Cloudflare does NOT cache response
   1. If Cache-Control header is public AND (max-age > 0 OR Expires header is a date in future), Cloudflare will cache the resource
      1. If both max-age and Expires header set, then max-age is used
   1. Certain HTTP codes cached by default if no Cache-Control or Expires directive provided:
      1. 200, 206, 301: 120 minutes
      1. 302, 303: 20 minutes
      1. 404, 410: 3 minutes
   1. Does NOT cache HTML by default(why?)
      1. To prevent caching pages with dynamic content

### Origin Cache-Control

### Content Security Policy
