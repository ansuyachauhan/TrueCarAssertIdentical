
# About Assert_Identical 

Assert_Identical() method that accepts different data structures and verify if two given data structures are identical. 

## Installation Instruction
	1.Install ruby on your machine
	2.Download Assert.rb and UnitTest.rb to a directory
	
## How to Run Unit Test

	1.Open command prompt or terminal
	2.Navigate to directory where files are located(CD directory name). Make sure Assert.rb and UnitTest.rb is located in the same directory
	3.Type ruby UnitTest.rb. This command will run unit all unit tests 
 
## How it works
Assert_Identical(param_1,Param_2) method takes two parameters and checks for various conditions before it returns true. if two data structures are not Identical, it returns Standard error message. The method first checks for object class, If they are identical. For non-identical values the method returns “Both objects do not match, object_1 is ‘value of object_1’ and object_2 is ‘value of object_2’.

This method can accept simple as well as complex data structures. i.e array, array of hash, hash, hash of array.

Verify_array(object1, object2, key1): this method verify if given two arrays are identical. It also checks for if arrays are nested with hash and if it’s a valid array or not.

Verify_hash(object_1, object_2) This method checks if both given inputs has same length and identical. It also checks for array and returns error “Key_1 has a value: ‘value of key_1’ :Key2 has value ‘value’

### Examples 

 Assert_Identical (object_1, object_2) returns true where  object_1, object_2 has the following values
 	Object_1 = { key1: 'key1', key2: 3,key3: ['a', 'b', 'c'],}
 	and 
	object_2 = {  key1: 'key1',  key2: 3,  key3:['a', 'b', 'c'],}


 Assert_identical(object_1,object_2) will raise standard error for each of three unequal values; where object_1 and object_2 has the following values.
	Object_1 = { key1: 'value 1',  key2: 3,  key3: ['a', 'b', 'c'],}
 	and 
	object_2 = {  key1: 'value 100',  key2: 30,  key3: ['c', 'b', 'a'],}


### Future enhancements 
 - Better Exception handling
 - Keeping tracking of number of errors in a log
 
