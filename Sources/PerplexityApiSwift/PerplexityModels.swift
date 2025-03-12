import Foundation

public enum PerplexityModel: String {
    // Research and Reasoning Models
    case sonarDeepResearch = "sonar-deep-research"    // 128k context
    case sonarReasoningPro = "sonar-reasoning-pro"    // 128k context
    case sonarReasoning = "sonar-reasoning"           // 128k context
    
    // General Purpose Models
    case sonarPro = "sonar-pro"                       // 200k context
    case sonar = "sonar"                              // 128k context
    case r1_1776 = "r1-1776"                         // 128k context
}

// We can keep this enum if it's still useful for your application
public enum PerplexityModelSize: String {
    case small = "small"
    case large = "large"
    case huge = "huge"
}