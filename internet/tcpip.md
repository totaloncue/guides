# Overview of TCP/IP

## Links

1. [Cloudflare reference on protocols](https://www.cloudflare.com/learning/network-layer/internet-protocol/)

## Terms

1. Ethernet - protocol for sending packets between devices on the same network
1. Internet Protocol (IP) - protocol for sending packets from network to network
1. Transmission Control Protocol (TCP) - transport protocol to ensure packets successfully arrive in order
   1. Designed for reliability vs speed
1. Hypertext Transfer Protocol (HTTP) - protocol to format data for websites and applications
1. User Datagram Protocol (UDP) - transport protocol often used for streaming video
   1. Faster than TCP but not as reliable
   1. Does not make sure all packets are delivered and in order
   1. Does not establish a connection before beginning or receiving transmissions
1. IPsec - group of protocols used together to set up encrypted connections between devices
   1. Common use case is to set up VPNs
   1. Encrypts IP packets + authenticates source
   1. Most often uses UDP instead of TCP
      1. Allows IPSec packets to go through firewalls
   1. Usually uses port 500
1. Virtual Private Network (VPN) - encrypted connection between two or more computers
1.
