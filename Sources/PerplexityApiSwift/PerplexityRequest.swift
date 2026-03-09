import Foundation

public enum SearchMode: String, Codable {
    case web
    case academic
    case sec
}

public enum SearchRecencyFilter: String, Codable {
    case hour, day, week, month, year
}

public enum ReasoningEffort: String, Codable {
    case minimal, low, medium, high
}

public struct PerplexityRequest: Codable {
    public let model: String
    public let messages: [Message]
    public let maxTokens: Int?
    public let temperature: Double?
    public let topP: Double?
    public let stream: Bool
    public let stop: [String]?
    public let disableSearch: Bool?
    public let searchMode: SearchMode?
    public let searchDomainFilter: [String]?
    public let searchLanguageFilter: [String]?
    public let searchRecencyFilter: SearchRecencyFilter?
    public let returnImages: Bool?
    public let returnRelatedQuestions: Bool?
    public let reasoningEffort: ReasoningEffort?
    public let languagePreference: String?

    enum CodingKeys: String, CodingKey {
        case model, messages, temperature, stream, stop
        case maxTokens = "max_tokens"
        case topP = "top_p"
        case disableSearch = "disable_search"
        case searchMode = "search_mode"
        case searchDomainFilter = "search_domain_filter"
        case searchLanguageFilter = "search_language_filter"
        case searchRecencyFilter = "search_recency_filter"
        case returnImages = "return_images"
        case returnRelatedQuestions = "return_related_questions"
        case reasoningEffort = "reasoning_effort"
        case languagePreference = "language_preference"
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