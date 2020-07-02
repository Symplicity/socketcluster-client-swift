import Foundation

public class JSONConverter {
    
    public static func deserializeString(message : String) -> [String : Any]? {
        let jsonObject = try? JSONSerialization.jsonObject(with: message.data(using: .utf8)!, options: [])
        let jsonString = jsonObject as? [String : Any]
        guard jsonString == nil else {
            return jsonString
        }

        let jsonString2 = jsonObject as? [[String : Any]]
        guard let json = jsonString2 else {
            return nil
        }

        guard json.indices.contains(1), json.indices.contains(0) else {
            return nil
        }

        return [
            "data":json[1]["data"] ?? "",
            "rid": json[0]["rid"] ?? 0,
            "event": json[1]["event"] ?? ""
        ]
    }
    
    public static func deserializeData(data : Data) -> [String : Any]? {
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
        return jsonObject as? [String : Any]
    }
    
    public static func serializeObject(object : Any) -> String? {
        let message = try? JSONSerialization.data(withJSONObject: object, options: [])
        return String(data: message!, encoding: .utf8)
    }
}
