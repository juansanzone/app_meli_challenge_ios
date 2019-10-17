import Foundation

public enum NetworkingErrors:Error {
    case noData
}

public struct Networking {
    private init() {}
    
    public static func get<T:Codable>(_ request:URLRequest, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let networkingError = error {
                    completionHandler(nil, response, networkingError)
                    return
                }
                
                guard let data = data else {
                    completionHandler(nil, response, NetworkingErrors.noData)
                    return
                }

                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(result, response, error)
                } catch {
                    completionHandler(nil, response, error)
                }
            }
        }.resume()
    }
}
