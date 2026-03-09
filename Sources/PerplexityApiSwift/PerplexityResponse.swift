import Foundation

public struct PerplexityResponse: Codable {
    public let id: String
    public let model: String
    public let object: String
    public let created: Int
    public let choices: [Choice]
    public let usage: Usage
    public let citations: [String]?
    public let searchResults: [SearchResult]?
    public let images: [ImageResult]?
    public let relatedQuestions: [String]?

    enum CodingKeys: String, CodingKey {
        case id, model, object, created, choices, usage, citations, images
        case searchResults = "search_results"
        case relatedQuestions = "related_questions"
    }
}

public struct SearchResult: Codable {
    public let title: String?
    public let url: String?
    public let date: String?
    public let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case title, url, date
        case lastUpdated = "last_updated"
    }
}

public struct ImageResult: Codable {
    public let url: String?
    public let originURL: String?
    public let height: Int?
    public let width: Int?

    enum CodingKeys: String, CodingKey {
        case url, height, width
        case originURL = "origin_url"
    }
}

public struct Choice: Codable {
    public let index: Int
    public let finishReason: String
    public let message: Message
    public let delta: Delta?

    enum CodingKeys: String, CodingKey {
        case index
        case finishReason = "finish_reason"
        case message, delta
    }
}

public struct Delta: Codable {
    public let role: String?
    public let content: String?
}

public struct Usage: Codable {
    public let promptTokens: Int
    public let completionTokens: Int
    public let totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}