# Resolvable UUIDs

**Resolvable UUIDs (RUUIDs)** are standard 128-bit RFC 9562
Universally Unique Identifiers which can be dereferenced, enabling
them to be used both as UUIDs and in contexts where locators are
required, not just opaque identifiers.

RUUIDs currently fit within the RFC 9562 definitions as a variant 10,
version 8 Custom/Experimental UUID version. An RUUID encodes an IPv6
/64 network prefix, or an IPv4 address (/32) encapsulated as an IPv6
6to4 network prefix. These network prefixes may be resolved to a
domain name via a reverse DNS lookup (a PTR record in DNS).  The
domain can be further resolved to a Controlled Identifier document,
which the spec refers to as the "UUID Document". Once retrieved, this
can be used along with the fields of the UUID to yield a URI which can
be used to dereference the UUID.  A well-known template is also
defined which may allow RUUIDs to be resolved when there is no UUID
Document.

Thus, a UUID conforming to this specification can be generated and
dereferenced using generally available Internet infrastructure.

This repo houses two specifications:

- **`draft-motters-ruuid-00`** — the IETF Internet-Draft
  "Resolvable Universally Unique Identifiers". Read it as
  [HTML with clickable cross-references](https://worldresolvable.github.io/ruuid-draft/draft-motters-ruuid-00.html)
  or as [canonical IETF text](https://worldresolvable.github.io/ruuid-draft/draft-motters-ruuid-00.txt).
  
- **[did:uuid method specification](https://worldresolvable.github.io/ruuid-draft/did-uuid-method/)**
  — a W3C-style Decentralized Identifier (DID) Method specification
  for a "uuid" DID method.  Essentially a thin wrapper around the
  RUUID resolution method, this encapsulates an RUUID as a DID.

The Markdown (`.md`) source code for the Internet Draft is provided,
as well as `.xml`, `.txt`, and `.html` versions, which are build
artifacts committed to the repo for the convenience of reviewers, so
that building the Markdown source is not required.

A Python reference implementation for RUUIDs is also available on
GitHub, in the [ruuid-tools](https://github.com/WorldResolvable/ruuid-tools)
repository.

## Build the Internet-Draft

Dependencies: `kramdown-rfc` (Ruby gem) and `xml2rfc` (Python).

```
gem install kramdown-rfc
python3 -m pip install --user xml2rfc
make
```

