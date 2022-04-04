# Cryptography Concepts

## Key ideas

1. Encryption => Use someone's public key to write a message that can ONLY be decrypted by someone who has the private key
1. Signing =>
   1. Alice wants to send a message M-sent to Bob such that:
      1. Only Bob can read it
      1. Bob can be sure the message is from Alice AND has not been modified by anyone in transit
   1. For first part, encrypt the message with Bob's public key and generate M-sent-encrypted
      1. Bob's public key ideally should be obtained via a digital certificate that guarantees that the public key is valid and belongs to Bob
   1. For the second part:
      1. Pass the original message through a hash function H1 to get a **message digest** M-sent-hashed
      1. Encrypt the mesage digest M2 with Alice's private key to  generate M-sent-hashed-and-encrypted
   1. When Bob recieves a message:
      1. He gets M-received-encrypted (this is the message that is encrypted using his public key)
      1. He gets M-received-hashed-and-encrypted (this is the message hashed with H1 and then encrypted with Alice's private key)
      1. He uses his own private key to decrypt the message M-received-encrypted to get M-received
      1. Now he needs to check that the contents of M-received are the same as M-sent and gain trust that it was sent by Alice
      1. He uses Alice's public key to decrypt M-received-hashed-and-encrypted to generate M-received-hashed
   
1. Certificate =>
   1. Uses master trust in a higher-level third party (certificate authorities) to enable trust in some information about you
   1. e.g. public keys are distributed using certificates
      1. The signature of the CA guarantees that the public key information shared in the certificate is valid and belongs to the party mentioned in the certificate

## References

1. [StackOverflow on difference between signing and encryption](https://stackoverflow.com/questions/454048/what-is-the-difference-between-encrypting-and-signing-in-asymmetric-encryption)
1. [StackOverflow on process of message transmission from Alice->Bob](https://stackoverflow.com/questions/2882506/what-is-the-difference-between-digital-signature-and-digital-certificate)
1. [Another StackOverflow reference](https://stackoverflow.com/questions/18257185/how-does-a-public-key-verify-a-signature/18259395#18259395)
1. [Why hash data before signing?](https://crypto.stackexchange.com/questions/12768/why-hash-the-message-before-signing-it-with-rsa)
   1. Efficiency
   1. Compatibility
   1. Integrity

## Terms

1. Symmetric cryptography
1. Session key - encryption key used to symmetrically encrypt one communication session only
   1. What is a session?
      1. Similar to a single conversation
      1. Can either be a set period of time or can last for as long as two parties are communicating
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
1. [Cloudflare reference on encryption](https://www.cloudflare.com/learning/ssl/what-is-encryption/)

## TLS Overview

1. Transport Layer Security
1. Latest version is 1.3

### Handshake

1. [Reference](https://hpbn.co/transport-layer-security-tls/#tls-handshake)
1. [Cloudflare reference](https://www.cloudflare.com/learning/ssl/what-happens-in-a-tls-handshake/)
1. Process between client and server to agree on various parameters regarding encryption tunnel between them
   1. Kicks off a communication session that uses TLS encryption
   1. Agreement on TLS protocol, ciphersuites and verification of certificates as necessary
   1. Includes following:
      1. Acknowledgement
      1. Verification
      1. Establishment of encryption algorithms to be used
      1. Agreement on session keys
1. Multiple packet roundtrips needed => significant startup latency to all TLS connections
1. Round trips required
1. False start
1. Client and server send each other 'random' data, and then make calculations separately to derive a common session key
1. Process generates 4 total session keys
   1. Client write key
   1. Server write key
   1. Client write MAC key
   1. SErver write MAC key
1. SSL/TLS handshake occurs before the client device indicates over HTTP which website it's connecting to
   1. => need for SNI (Server Name Identification)
   1. SNI adds the domain name to the TLS handshake
