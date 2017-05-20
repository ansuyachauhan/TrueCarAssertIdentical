require 'logger'


# Module build to assert to objects
module Assert

  # Methods to assert to identical objects
  def self.assert_identical(object_1, object_2)
    # check for object class
    unless object_1.class == object_2.class
      raise StandardError , "Both objects do not match, Object_1 is #{object_1.class} and Object_2 is #{object_2.class}"
    end

    errors = if object_1.is_a?(Array)
              verify_array(object_1, object_2)
            elsif object_1.is_a?(Hash)
              verify_hash(object_1, object_2)
            elsif !object_1 == object_2
                "Objects do not match : object_1 has value: #{object_1} & object_2 has value : #{object_2}"
            end

    unless errors.empty?
      errors.prepend("Objects are not identical \n")
      raise StandardError, "\n #{errors}"
    end
  end
end

# verify array and nested array
def verify_array(object_1, object_2, key_1: nil, errors: '')
  array_errors = ''
  # check if array
  if object_1.is_a?(Array)
    # check if array is with nested hash
    object_1.each_with_index do |value, index|
      if value.is_a?(Hash) && object_2[index].is_a?(Hash)
        array_errors << verify_hash(object_1[index], object_2[index], key_1: key_1, errors: errors)
      else
        unless object_1 == object_2
          array_errors << "\t #{key_1} has value: #{object_1} \n"
          break
        end
      end
    end
  end
  array_errors
end

# verify hash with array's
def verify_hash(object_1, object_2, key_1: nil, errors: '')
  hash_errors = ''
  # check for length
  if object_1.is_a?(Hash)
    # check for same length
    unless object_1.length  == object_2.length
      raise StandardError, "Objects length are different"
    end
    unless object_1.keys == object_2.keys
      raise StandardError, "Object Keys do not match"
    end
    object_1.each_pair do |key, value|
      if value.is_a?(Array)
        key_value = key_1.nil? ? key : "#{key_1}.#{key}"
        hash_errors << verify_array(object_1[key], object_2[key], key_1: key_value , errors: errors)
      else
        unless object_1[key] == object_2[key]
          # check if nested key exists
          if key_1.nil?
            error_msg = "\t #{key} has a value: #{value} \n"
          else
            error_msg = "\t #{key_1}.#{key} has a value: #{value} \n"
          end
          hash_errors << error_msg
        end
      end
    end
  end
  hash_errors
end
#TrueCarAssertIdentical
