coffeegrailbone
===============

Selective JSON property exclusion
---------------------------------

When serializing objects to JSON, it is sometimes useful to control 
which fields are included, etc. A simple solution is provided here
http://compiledammit.com/2012/08/16/custom-json-marshalling-in-grails-done-right/.
However, I don't think this is actually the simplest solution. I 
believe it would be much simpler to create a JSON serialization class 
which can be given an object as well as a set of fields in that object 
to ignore.
