package wood.mike

class EncodingController {

    def index() {
        [
            aString: 'cheese',
            aStringMap: ["key1": "val1", 'key2': 'val2'],
            anIntegerMap: [123: 456, 888: 002]
        ]
    }
}
