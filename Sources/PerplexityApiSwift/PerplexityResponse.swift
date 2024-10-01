import Foundation

public struct PerplexityResponse: Codable {
    public let id: String
    public let model: String
    public let object: String
    public let created: Int
    public let choices: [Choice]
    public let usage: Usage
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