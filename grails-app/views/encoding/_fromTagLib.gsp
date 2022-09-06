<%@ page import="grails.converters.JSON" %>
<script type="text/javascript">
    logIt("${aString}");

    logIt("${aMap}");
    logIt("${raw(aMap)}");
    logIt("${raw(aMap as String)}");
    logIt("${raw(aMap as JSON)}");
    logIt(${raw((aMap as JSON) as String)});        // probably what's wanted

    logIt("${aMap.encodeAsJSON()}");
</script>