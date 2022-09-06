package wood.mike

import grails.gsp.PageRenderer

class MyTagLib {
    static namespace = "mw"
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    PageRenderer groovyPageRenderer

    def encodeSomething = {args ->
        String aString = args.getOrDefault('aString', "")
        Map aMap = (Map) args.getOrDefault("aMap", [:])

        out << groovyPageRenderer.render(
                template: "/encoding/fromTagLib",
                model: [aString: aString, aMap: aMap]
        )
    }
}
