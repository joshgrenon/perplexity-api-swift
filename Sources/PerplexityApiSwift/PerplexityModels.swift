import Foundation

public enum PerplexityModel: String {
    // Research and Reasoning Models
    case sonarDeepResearch = "sonar-deep-research"    // 128k context
    case sonarReasoningPro = "sonar-reasoning-pro"    // 128k context

    // General Purpose Models
    case sonarPro = "sonar-pro"                       // 200k context
    case sonar = "sonar"                              // 128k context
    case r1_1776 = "r1-1776"                          // 128k context
}