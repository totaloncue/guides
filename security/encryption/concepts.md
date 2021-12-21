# Cryptography Concepts

1. Symmetric cryptography
1. Asymmetric cryptography
1. Public key cryptography
1. Certificate
1. Certificate authority
1. Digital Signature
1. Hash
1. Encryption
1. Decryption
1. Digest
1. Plaintext
1. Cipher
1. Ciphertext
1. SHA
1. MD5
1. Diffie-Hellman Key Exchange
1. RSA
1. Forward secrecy
1. SSL
1. TLS
1. IPSec
   1. Secure network protocol suite that **authenticates** and **encrypts** packets of data to provide secure encrypted communications
   1. Used in virtual private networks (VPNs)
1. JSON Web Tokens
1. Public Key Infrastructure(PKI)
1. OpenSSL
1. LibreSSL
1. Common Vulnerabilities and Exposures database
1. Privacy Enhanced Mail (PEM)
1. Message Authentication
   1. Message has not been modified in transit (data integrity) and that the receiving party can verify the source of the message
   1. Methods include MAC, authenticated encryption (AE) and digital signatures
1. Message Authentication Code(MAC)
   1. Short piece of information used to authenticate a message
   1. Sometimes referred to as Message Integrity Code (MIC) but not recommended
   1. Differ from signatures in that MAC values are both generated and verified using the same secret key
   1. Any user who is capable of verifying a MAC is also capable of generating MACs for other messages
   1. MACs do NOT offer non-repudiation
1. Hash-based message authentication code (HMAC)
   1. Specific type of MAC using a cryptographic hash function and a secret cryptographic key
   1. Relies on a trusted channel between parties communicating to agree on key prior to communication
      1. vs. using PKI
1. SNI
1. HTTP/2
1. TLS 1.3
1. TLS 1.3 0-RTT
1. OCSP stapling
1. Dynamic record sizing
1. ALPN
1. Authenticated encryption

## Links

1. [Mozilla Recommended CipherSuites](https://wiki.mozilla.org/Security/Server_Side_TLS#Recommended_Ciphersuite)
1. [Mozilla SSL configuration guide](https://ssl-config.mozilla.org/)
1. [OpenSSL cookbook](https://www.feistyduck.com/books/openssl-cookbook/)
1. [Is TLS Fast Yet?](https://istlsfastyet.com/)
1. [Qualys SSL Test](https://www.ssllabs.com/ssltest/)
1. [High Performance Browser Networking Book](https://hpbn.co/)

## TLS Overview

1. Transport Layer Security
1. Latest version is 1.3

### Handshake

1. [Reference](https://hpbn.co/transport-layer-security-tls/#tls-handshake)
1. Process between client and server to agree on various parameters regarding encryption tunnel between them
   1. Agreement on TLS protocol, ciphersuites and verification of certificates as necessary
1. Multiple packet roundtrips needed => significant startup latency to all TLS connections
1. Round trips required
1. False start
