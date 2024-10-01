import Foundation

// MARK: - Perplexity API Client

public class PerplexityApiSwift {
    private var bearerToken: String?
    
    public init(token: String? = nil) {
        self.bearerToken = token
    }
    
    public func chatCompletion(messages: [Message], model: PerplexityModel = .sonarLarge) async throws -> PerplexityResponse {
        guard let bearerToken = bearerToken else {
            throw PerplexityError.tokenNotSet
        }
        
        let url = URL(string: "https://api.perplexity.ai/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = PerplexityRequest(
            model: model.rawValue,
            messages: messages,
            maxTokens: nil,
            temperature: 0.2,
            topP: 0.9,
            returnCitations: false,
            searchDomainFilter: nil,
            returnImages: false,
            returnRelatedQuestions: false,
            searchRecencyFilter: nil,
            topK: 0,
            stream: false,
            presencePenalty: 0,
            frequencyPenalty: 1
        )
        
        // Log request details
        print("Request URL: \(url)")
        print("Request Headers:")
        request.allHTTPHeaderFields?.forEach { key, value in
            print("\(key): \(value)")
        }
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(body)
            request.httpBody = jsonData
            
            print("Request Body:")
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        } catch {
            throw PerplexityError.encodingError(error)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PerplexityError.invalidResponse(statusCode: 0)
        }
        
        print("Response Status Code: \(httpResponse.statusCode)")
        print("Response Headers:")
        httpResponse.allHeaderFields.forEach { key, value in
            print("\(key): \(value)")
        }
        
        print("Response Body:")
        if let responseString = String(data: data, encoding: .utf8) {
            print(responseString)
        }
        
        if !(200...299).contains(httpResponse.statusCode) {
            throw PerplexityError.apiError(statusCode: httpResponse.statusCode, data: data)
        }
        
        do {
            let perplexityResponse = try JSONDecoder().decode(PerplexityResponse.self, from: data)
            return perplexityResponse
        } catch {
            throw PerplexityError.decodingError(error)
        }
    }
}

// MARK: - Error Handling

public enum PerplexityError: Error, LocalizedError {
    case tokenNotSet
    case invalidResponse(statusCode: Int)
    case apiError(statusCode: Int, data: Data)
    case encodingError(Error)
    case decodingError(Error)
    
    public var errorDescription: String? {
        switch self {
        case .tokenNotSet:
            return "API token not set"
        case .invalidResponse(let statusCode):
            return "Invalid response (Status \(statusCode))"
        case .apiError(let statusCode, let data):
            let message = String(data: data, encoding: .utf8) ?? "No error message"
            return "API error (Status \(statusCode)): \(message)"
        case .encodingError(let error):
            return "Error encoding request: \(error.localizedDescription)"
        case .decodingError(let error):
            return "Error decoding response: \(error.localizedDescription)"
        }
    }
}
