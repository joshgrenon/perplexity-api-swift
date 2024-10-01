import Foundation

public struct PerplexityRequest: Codable {
    public let model: String
    public let messages: [Message]
    public let maxTokens: Int?
    public let temperature: Double
    public let topP: Double
    public let returnCitations: Bool
    public let searchDomainFilter: [String]?
    public let returnImages: Bool
    public let returnRelatedQuestions: Bool
    public let searchRecencyFilter: String?
    public let topK: Int
    public let stream: Bool
    public let presencePenalty: Double
    public let frequencyPenalty: Double

    enum CodingKeys: String, CodingKey {
        case model, messages, temperature, stream
        case maxTokens = "max_tokens"
        case topP = "top_p"
        case returnCitations = "return_citations"
        case searchDomainFilter = "search_domain_filter"
        case returnImages = "return_images"
        case returnRelatedQuestions = "return_related_questions"
        case searchRecencyFilter = "search_recency_filter"
        case topK = "top_k"
        case presencePenalty = "presence_penalty"
        case frequencyPenalty = "frequency_penalty"
    }
}

public struct Message: Codable {
    public let role: String
    public let content: String?
    
    public init(role: String, content: String?) {
        self.role = role
        self.content = content
    }
}