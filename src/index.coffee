isInt           = require 'util-ex/lib/is/string/int'
isFloat         = require 'util-ex/lib/is/string/float'
isNumber        = require 'util-ex/lib/is/type/number'
isString        = require 'util-ex/lib/is/type/string'
isInteger       = require 'util-ex/lib/is/type/integer'
Attributes      = require 'abstract-type/lib/attributes'
Type            = require 'abstract-type'
register        = Type.register
aliases         = Type.aliases

module.exports = class StringType
  register StringType
  aliases  StringType, 'string'

  constructor: ->
    return super

  $attributes: Attributes
    min:
      type: 'Number'
      assigned: '_min' # the internal property name for min.
      assign: (value, dest)->
        value = dest.validateMin(value) if dest instanceof StringType
        value
    max:
      type: 'Number'
      assigned: '_max'
      assign: (value, dest)->
        value = dest.validateMax(value) if dest instanceof StringType
        value

  validateMin: (value)->
    throw new TypeError 'the min should be less than max:' + value if value > @_max
    try value = parseInt(value) if isString value
    throw new TypeError 'the min should be an integer' unless isInteger value
    value
  validateMax: (value)->
    throw new TypeError 'the max should be greater than min:' + value if value < @_min
    try value = parseInt(value) if isString value
    throw new TypeError 'the max should be an integer' unless isInteger value
    value
  _isValid: (value)-> isString value
  _validate: (aValue, aOptions)->
    result = @_isValid aValue
    if result
      if aOptions
        vMin = aOptions.min
        vMax = aOptions.max
        aValue = aValue.length
        if vMin?
          result = aValue >= vMin
          if not result
            @error 'should be equal or greater than minimum length: ' + vMin
        if result and vMax?
          result = aValue <= vMax
          if not result
            @error 'should be equal or less than maximum length: ' + vMax
    result
