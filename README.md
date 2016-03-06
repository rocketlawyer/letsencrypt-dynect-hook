# dynect hook for letsencrypt.sh ACME client

This a hook for the [Let's Encrypt](https://letsencrypt.org/) ACME client [letsencrypt.sh](https://github.com/lukas2511/letsencrypt.sh), that enables using DNS records on [DynECT](https://www.dyn.com/) to respond to `dns-01` challenges. Requires Python 2 and your DynECT account credentials being set in your environment.

## Setup

```
$ git clone https://github.com/lukas2511/letsencrypt.sh
$ cd letsencrypt.sh
$ mkdir hooks
$ git clone https://github.com/mdevreugd/letsencrypt-dnsmadeeasy-hook hooks/dynect
$ pip install -r hooks/dynect/requirements.txt
$ . hooks/dynect/dynect-creds.sh
```

## Usage

```
$ ./letsencrypt.sh -c -d example.com -t dns-01 -k 'hooks/dynect/dynect-hook.py'
#
# !! WARNING !! No main config file found, using default config!
#
Processing example.com
 + Signing domains...
 + Creating new directory /home/user/letsencrypt.sh/certs/example.com ...
 + Generating private key...
 + Generating signing request...
 + Requesting challenge for example.com...
 + dnsmadeeasy hook executing: deploy_challenge
 + DNS not propagated, waiting 30s...
 + Responding to challenge for example.com...
 + dnsmadeeasy hook executing: clean_challenge
 + Challenge is valid!
 + Requesting certificate...
 + Checking certificate...
 + Done!
 + Creating fullchain.pem...
 + dnsmadeeasy hook executing: deploy_cert
 + ssl_certificate: /home/user/letsencrypt.sh/certs/example.com/fullchain.pem
 + ssl_certificate_key: /home/user/letsencrypt.sh/certs/example.com/privkey.pem
 + Done!
```
