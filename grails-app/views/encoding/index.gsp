<%@ page import="grails.converters.JSON" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Encoding</title>

    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css" />

    <g:javascript>
        $(document).ready(function() {
            $("#logIt").click(function(){
                // string input
                logIt("${aString}");
                logIt("${aString.encodeAsJSON()}");
                logIt("${raw(aString)}");

                // map of string keys and values
                logIt("${aStringMap}");
                logIt("${aStringMap.encodeAsJSON()}");
                logIt("${raw(aStringMap)}");
                logIt(${raw((aStringMap as JSON) as String)});         // probably what's wanted but use below in chance of null input
                logIt(${raw((aStringMap as JSON) as String ?: '[]')});
                logIt("${aStringMap.encodeAsRaw()}")

                // map of integer keys and values
                logIt("${anIntegerMap}");
                logIt("${anIntegerMap.encodeAsJSON()}");
                logIt("${raw(anIntegerMap)}");
                logIt(${raw((anIntegerMap as JSON) as String)});                 // probably what's wanted but use below if chance of null input
                logIt(${raw((anIntegerMap as JSON) as String ?: '{}')});

                // null
                logIt(${raw(justNull)})                                  // bad
                logIt(${raw((justNull as JSON) as String ?: '{}')})      // THIS COVERS ALL BASES WHEN INPUT IS MAP, LIST, OBJECT ETC I.E. NOT CONVERTED BY CONTROLLER TO JSON

                // null converted to JSON by controller
                logIt(${nullAsJson as String})                          // not what's wanted if something should be supplied to function e.g. empty array
                logIt(${raw(nullAsJson) ?: raw('[]')})                  // handles the input being null and passes empty array
                logIt(${nullAsJson ? raw(nullAsJson) : raw('[]')})      // alternative to above
                logIt(${raw(nullAsJson ?: '[]')})                       // another alternative and more concise
                logIt(${raw(nullAsJson as String ?: '[]')})              // THIS COVERS ALL BASES & IS PROBABLY BEST OPTION WHEN CONTROLLER HAS ALREADY CONVERTED TO JSON

                // empty list converted to JSON by controller
                logIt(${raw(anEmptyListAsJson as String)})              // fine if you know the input will never be null, use above it if might

                // populated list converted to JSON by controller
                logIt(${raw(aNonEmptyListAsJson as String)})             // again fine if input will never be null otherwise use ?: null safe option above
            });
        });
    </g:javascript>
</head>

<body>
    <input type="button" id="logIt" value="LogIt" class="btn btn-info">

    <br>
    ${aString}
    <br>
    ${aStringMap}
    <br>
    ${anIntegerMap}

    <br>
    <mw:encodeSomething aString="fungus" aMap="[tree: 92, 1902: 'banana']"/>
</body>
</html>