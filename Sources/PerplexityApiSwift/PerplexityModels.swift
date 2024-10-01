import Foundation

public enum PerplexityModel: String {
    case sonar = "sonar-small-online"
    case sonarMedium = "sonar-medium-online"
    case sonarLarge = "sonar-large-online"
    case codellama34b = "codellama-34b-instruct"
    case llama2_70b = "llama-2-70b-chat"
    case mistral7b = "mistral-7b-instruct"
    case mixtral8x7b = "mixtral-8x7b-instruct"
}

public enum PerplexityModelSize: String {
    case small = "small"
    case medium = "medium"
    case large = "large"
}