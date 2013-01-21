coffeegrailbone
===============

Underscore Templates in GSP pages
---------------------------------

One issue I ran into was that the syntax for Underscore templates is very 
similar to the GSP syntax and the conflict was giving me some very strange 
errors as Grails was attempting to handle the Underscore templates. In order 
to get around this, I simply changed the Underscore template syntax settings 
as discussed here: http://lauripiispanen.github.com/blog/2012/01/31/building-a-backend-for-backbone-dot-js-todos-example-with-grails-and-mongodb/.

Of course, by no means are we required to use Underscore templates. There 
are a bunch of competitors out there (Mustache and EJS come to mind). The 
advantage of Underscore being that it is built into Underscore which is 
required by Backbone.

REST and URL Mappings
---------------------

For every Grails controller it is necessary to adjust `UrlMappings.groovy` to 
direct REST calls to the appropriate actions. For example,

    "/todos/$id?"(controller: "todos") {
        action = [GET:"list", POST: "save", DELETE: "delete", PUT: "edit"]
    }

Generalizing this to all controllers is discussed here: 
http://stackoverflow.com/questions/6120570/gerneric-url-mapping-for-restful-resources-in-grails.

It may be even simpler to just adjust `Backbone.sync` to our specific needs so that 
CRUD actions are not mapped in the REST way but to the standard Grails way. This method 
may allow us to take advantage of Grails's scaffolding. This is discussed in the 
official Backbone documentation and here: http://stackoverflow.com/questions/5096549/how-to-override-backbone-sync

Frontend Testing
----------------

Although I didn't do any testing, I realized that it would be easy to test 
the frontend Backbone components on their own by simulating a Grails backend. 
This could be done by "spying" on the `Backbone.sync` function with Jasmine or 
QUnit and some SinonJS.

Selective JSON property exclusion
---------------------------------

When serializing objects to JSON, it is sometimes useful to control 
which fields are included, how they are serialized, etc. A simple 
solution is provided here http://compiledammit.com/2012/08/16/custom-json-marshalling-in-grails-done-right/.
However, I don't think this is actually the simplest solution. I 
believe it would be much simpler to create a JSON serialization class 
which can be given an object as well as a set of fields in that object 
to ignore. Moreover, I can't think of many situations where excluding 
fields in the JSON will be necessary.
