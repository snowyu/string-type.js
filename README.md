## string-type [![npm][npm-svg]][npm]

[![Build Status][travis-svg]][travis]
[![Code Climate][codeclimate-svg]][codeclimate]
[![Test Coverage][codeclimate-test-svg]][codeclimate-test]
[![downloads][npm-download-svg]][npm]
[![license][npm-license-svg]][npm]

[npm]: https://npmjs.org/package/string-type
[npm-svg]: https://img.shields.io/npm/v/string-type.svg
[npm-download-svg]: https://img.shields.io/npm/dm/string-type.svg
[npm-license-svg]: https://img.shields.io/npm/l/string-type.svg
[travis-svg]: https://img.shields.io/travis/snowyu/string-type.js/master.svg
[travis]: http://travis-ci.org/snowyu/string-type.js
[codeclimate-svg]: https://codeclimate.com/github/snowyu/string-type.js/badges/gpa.svg
[codeclimate]: https://codeclimate.com/github/snowyu/string-type.js
[codeclimate-test-svg]: https://codeclimate.com/github/snowyu/string-type.js/badges/coverage.svg
[codeclimate-test]: https://codeclimate.com/github/snowyu/string-type.js/coverage

The string type info object.

## Usage

```js
var StringType  = require('string-type')
var Str = StringType(min:1, max:6)
var s = Str.create('a str')
console.log(s+ '!')
//='a str!'
console.log(s.isValid())
//=true
console.log(s.toJson()))
//='"a str"'
console.log(s.toJson({withType:true})))
//='{"value":'a str',"name":"String","min":1,"max":6}'
n.assign('1234567')
//=TypeError: "1234567" is an invalid String
n.assign('123456')
//="123456"
```

## API

See [abstract-type](https://github.com/snowyu/abstract-type.js)

## TODO


## License

MIT
