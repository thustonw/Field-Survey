import Foundation

class FieldObservationsJSONLoader{
    
    class func load(fileName:String) -> [FieldObservation]{
        var observations = [FieldObservation]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
            observations = FieldObservationsJSONParser.parse(data)
        }
        return observations
    }
}
