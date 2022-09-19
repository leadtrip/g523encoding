package wood.mike

import grails.converters.JSON

class EncodingController {

    def index() {
        [
            aString: 'cheese',
            aStringMap: ["key1": "val1", 'key2': 'val2'],
            anIntegerMap: [123: 456, 888: 002],
            justNull: null,
            nullAsJson : null as JSON,
            anEmptyListAsJson: [] as JSON,
            aNonEmptyListAsJson: ['screwdriver', 'hammer', 'drill']
        ]
    }
}
