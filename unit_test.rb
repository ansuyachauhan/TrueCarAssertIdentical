require_relative 'assert'
require 'minitest/autorun'

class UnitTest < Minitest::Test

  def test_objects_of_different_class
    object_1 = [1, 2, 3]
    object_2 = '1234'

    assert_raises StandardError do
      Assert.assert_identical(object_1, object_2)
    end

  end

  def test_objects_of_different_length
    object_1 = { a: 'value1' }
    object_2 = { a: 'value2' , b: 'value2' }
    assert_raises StandardError do
      Assert.assert_identical(object_1, object_2)
    end
  end

  def test_simple_objects
    object_1 = {
      key1:'value 1',
      key2: 3,
      key3: ['a', 'b', 'c'],
    }
    object_2 ={
      key1:'value 100',
      key2: 30,
      key3: ['c', 'b', 'a'],
    }

    assert_raises StandardError do
      Assert.assert_identical(object_1, object_2)
    end
  end

  def test_same_complex_objects
    object_1= [
      {
        key1: 'val1',
        key2: 'val2',
        key3: [
          {
            subkey_1: ['a', 'b', 'c'],
            subkey_2: 'some value',
          },
          {
            subkey_1: ['d', 'e', 'f'],
            subkey_2: 'another value'
          }
        ]
      },
      {
        key1: 'val3',
        key2: 'val4',
        key3: [
          {
            subkey_1: ['g', 'h', 'i'],
            subkey_2: 'a different value',
          },
          {
            subkey_1: ['j', 'k', 'l'],
            subkey_2: 'value'
          }
        ]
      },
    ]
    object_2=[
      {
        key1: 'val1',
        key2: 'val2',
        key3: [
          {
            subkey_1: ['a', 'b', 'c'],
            subkey_2: 'some value',
          },
          {
            subkey_1: ['d', 'e', 'f'],
            subkey_2: 'another value'
          }
        ]
      },
      {
        key1: 'val3',
        key2: 'val4',
        key3: [
          {
            subkey_1: ['g', 'h', 'i'],
            subkey_2: 'a different value',
          },
          {
            subkey_1: ['j', 'k', 'l'],
            subkey_2: 'value'
          }
        ]
      },
    ]
    assert_nil(Assert.assert_identical(object_1, object_2))
  end

  def test_nested_complex_objects

    object_1= [
      {
        key1: 'val1',
        key2: 'val2',
        key3: [
          {
            subkey_1: ['a', 'b', 'c'],
            subkey_2: 'some value',
          },
          {
            subkey_1: ['d', 'e', 'f'],
            subkey_2: 'another value'
          }
        ]
      },
      {
        key1: 'val3',
        key2: 'val4',
        key3: [
          {
            subkey_1: ['g', 'h', 'i'],
            subkey_2: 'a different value',
          },
          {
            subkey_1: ['j', 'k', 'l'],
            subkey_2: 'value'
          }
        ]
      },
    ]
    object_2= [
      {
        key1: 'val1',
        key2: 'val2',
        key3: [
          {
            subkey_1: ['a', 'b', 'c'],
            subkey_2: 'some value',
          },
          {
            subkey_1: ['d', 'e', 'f'],
            subkey_2: 'another value'
          }
        ]
      },
      {
        key1: 'val3',
        key2: 'val4',
        key3: [
          {
            subkey_1: ['g', 'h', 'l'],
            subkey_2: 'a different value',
          },
          {
            subkey_1: ['j', 'k', 'l'],
            subkey_2: 'different value'
          }
        ]
      },
    ]
    assert_raises StandardError do
      Assert.assert_identical(object_1, object_2)
    end

  end
end
