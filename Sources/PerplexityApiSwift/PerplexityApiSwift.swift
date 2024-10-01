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
        
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw PerplexityError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 500)
        }
        
        let perplexityResponse = try JSONDecoder().decode(PerplexityResponse.self, from: data)
        return perplexityResponse
    }
}

// MARK: - Error Handling

public enum PerplexityError: Error {
    case tokenNotSet
    case invalidResponse(statusCode: Int)
    case invalidResponseFormat
}
