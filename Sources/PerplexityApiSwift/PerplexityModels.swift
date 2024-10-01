import Foundation

public enum PerplexityModel: String {
    case sonarSmallOnline = "llama-3.1-sonar-small-128k-online"
    case sonarLargeOnline = "llama-3.1-sonar-large-128k-online"
    case sonarHugeOnline = "llama-3.1-sonar-huge-128k-online"
    case sonarSmallChat = "llama-3.1-sonar-small-128k-chat"
    case sonarLargeChat = "llama-3.1-sonar-large-128k-chat"
    case llama8bInstruct = "llama-3.1-8b-instruct"
    case llama70bInstruct = "llama-3.1-70b-instruct"
}

// We can keep this enum if it's still useful for your application
public enum PerplexityModelSize: String {
    case small = "small"
    case large = "large"
    case huge = "huge"
}