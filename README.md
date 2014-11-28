# Fingerprint

Fingeprint objects and arrays.

## Usage

This library can be used to create a *fingerprint* for: Objects, Arrays and primitives such as String and Number.
You can combine these fingerprinting techniques to create fingerprints for complex, composite object structures
 and thus create a unique fingerprint for any data-structure.
This technique is often used for caching purposes.

[Permit-Authorize](https://github.com/kristianmandrup/permit-authorize) uses fingerprinting for its caching,
mostly to identify repeated access requests and then returning the cached authorization
result for that fingerprint instead of recalculating which drastically improves authorization performance!

### Array

```js
finger-printer = (array) ->
  new ArrayFingerPrint array

access-request := ['hello', 'goodbye']

finger-printer(access-request).fingerprint!
```

### Object

```js
finger-printer = (obj) ->
  new ObjectFingerPrint obj

access-request := {subject: subj, role: 'editor', object: post, ctx: 'admin'}

finger-printer(access-request).fingerprint!`
```

For any object, the `ObjectFingerPrint` will try to call a `hash` function on the object if available, then a
`fingerprint` function and finally fall back to doing a JSON stringify that is md5'ed.

This is in order to avoid expensive hash calculations for each object. Say you have a user object, it is much
more efficient to add a `fingerprint` method which returns the unique `id` or `email` as the fingerprint key.

## TODO

Add Fingerprint method to fingerprint an Object or Array recursively.

## Licence

MIT License
Copyright 2014-2015 Kristian Mandrup

See LICENSE file