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
                logIt("${aString}");
                logIt("${aString.encodeAsJSON()}");
                logIt("${raw(aString)}");

                logIt("${aStringMap}");
                logIt("${aStringMap.encodeAsJSON()}");
                logIt("${raw(aStringMap)}");
                logIt(${raw((aStringMap as JSON) as String)});         // probably what's wanted
                logIt("${aStringMap.encodeAsRaw()}")

                logIt("${anIntegerMap}");
                logIt("${anIntegerMap.encodeAsJSON()}");
                logIt("${raw(anIntegerMap)}");
                logIt(${raw((anIntegerMap as JSON) as String)});                 // probably what's wanted
                logIt(${raw((anIntegerMap as JSON) as String ?: '{}')});       // same as above but covers value being null and need to provide empty object

                logIt(${justNull})                                      // just null
                logIt(${raw((justNull as JSON) as String ?: '{}')})      // THIS COVERS ALL BASES WHEN INPUT IS MAP, LIST, OBJECT ETC I.E. NOT CONVERTED BY CONTROLLER TO JSON

                logIt(${nullAsJson as String})                          // not what's wanted if empty array is needed
                logIt(${raw(nullAsJson) ?: raw('[]')})                  // handles the input being null
                logIt(${nullAsJson ? raw(nullAsJson) : raw('[]')})      // alternative to above
                logIt(${raw(nullAsJson ?: '[]')})                       // surprisingly this works
                logIt(${raw(nullAsJson as String ?: '[1,2,3]')})        // THIS COVERS ALL BASES & IS PROBABLY BEST OPTION WHEN CONTROLLER HAS ALREADY CONVERTED TO JSON

                logIt(${raw(anEmptyListAsJson as String)})              // fine if you know the input will never be null, use above it if might

                logIt(${raw(aNonEmptyListAsJson as String)})
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