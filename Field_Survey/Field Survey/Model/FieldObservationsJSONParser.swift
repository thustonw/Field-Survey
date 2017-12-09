import Foundation

class FieldObservationsJSONParser{
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data:Data) -> [FieldObservation]{
        var dataObservations = [FieldObservation]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
           let root = json as? [String: Any],
           let status = root["status"] as? String,
           status == "ok"{
           
           if let observations = root["observations"] as? [Any]{
                for observation in observations{
                    if let observation = observation as? [String: String]{
                        if let classification = observation["classification"],
                           let title = observation["title"],
                           let description = observation["description"],
                           let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                                if let fieldObservation = FieldObservation(classificationName: classification, title:title, description:description, date:date){
                                dataObservations.append(fieldObservation)
                                }
                            }
                    }
                 }
            }
        }
        
        return dataObservations
    }


}
