chai            = require 'chai'
sinon           = require 'sinon'
sinonChai       = require 'sinon-chai'
should          = chai.should()
expect          = chai.expect
assert          = chai.assert
chai.use(sinonChai)

setImmediate    = setImmediate || process.nextTick

StringType            = require '../src'

describe 'String', ->
  string = StringType()

  it 'should be exist string type', ->
    expect(string).to.be.instanceOf StringType
    string.pathArray().should.be.deep.equal ['type', string.name]

  describe 'range', ->
    it 'should not set the wrong range of string', ->
      expect(string.createType.bind(string, max:'as')).to.be.throw 'the max should be an integer'
      expect(string.createType.bind(string, min:'as')).to.be.throw 'the min should be an integer'
      expect(string.createType.bind(string, min:4, max:3)).to.be.throw 'the max should be greater than min'
      result = string.clone()
      try
        result.max = 5
        result.min = 6
      catch e
        err = e
      expect(err).to.be.exist
      expect(err.message).to.be.include 'the min should be less than max'
    it 'should limit the range of string value', ->
      n = string.createType(min: '2', max:'6')
      expect(n.min).to.be.equal 2
      expect(n.max).to.be.equal 6
      expect(n.validate('12')).to.be.true
      expect(n.validate('sjj')).to.be.true
      expect(n.validate('123456')).to.be.true
      expect(n.validate.bind(n,'1')).to.be.throw 'an invalid ' + string.name
      expect(n.validate.bind(n,'1234567')).to.be.throw 'an invalid ' + string.name
      expect(n.isValid('')).to.be.false
      expect(n.isValid('1234567')).to.be.false
    it 'should limit max string value', ->
      n = string.createType(max:6)
      expect(n.validate('1')).to.be.true
      expect(n.validate('1234')).to.be.true
      expect(n.validate('12')).to.be.true
      expect(n.validate('123456')).to.be.true
      expect(n.validate.bind(n,'1234567')).to.be.throw 'an invalid ' + string.name
      expect(n.isValid('')).to.be.true
      expect(n.isValid('1234567')).to.be.false
      expect(n.isValid('12345678')).to.be.false
    it 'should limit min string value', ->
      n = string.createType(min: 2)
      expect(n.validate('1234')).to.be.true
      expect(n.validate('12')).to.be.true
      expect(n.validate('123456')).to.be.true
      expect(n.validate('1234567')).to.be.true
      expect(n.validate.bind(n,'1')).to.be.throw 'an invalid ' + string.name
      expect(n.isValid('')).to.be.false
      expect(n.isValid(2)).to.be.false

  describe '.validate', ->
    it 'should validate string string value', ->
      expect(string.validate('123')).to.be.true
      expect(string.validate.bind(string,[])).to.be.throw 'an invalid ' + string.name

  describe '.cloneType', ->
    it 'should clone type', ->
      t = string.createType(min:1, max:3)
      result = t.cloneType()
      expect(t.isSame result).to.be.true
