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
                logIt(${raw((aStringMap as grails.converters.JSON) as java.lang.String)});
                logIt("${aStringMap.encodeAsRaw()}")

                logIt("${anIntegerMap}");
                logIt("${anIntegerMap.encodeAsJSON()}");
                logIt("${raw(anIntegerMap)}");
                logIt(${raw((anIntegerMap as grails.converters.JSON) as java.lang.String)});
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
    <mw:encodeSomething aString="fungus" aMap="[tree: 92]"/>
</body>
</html>