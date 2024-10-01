# PerplexityApiSwift

<p>
    <img src="https://img.shields.io/badge/iOS-16.0+-blue.svg" />
    <img src="https://img.shields.io/badge/Swift-5.5+-ff69b4.svg" />
    <img src="https://img.shields.io/badge/License-MIT-green.svg" />
    <a href="https://twitter.com/joshgrenon">
        <img src="https://img.shields.io/badge/Contact-@joshgrenon-lightgrey.svg?style=flat" alt="Twitter: @joshgrenon" />
    </a>
</p>

PerplexityApiSwift is a Swift framework that provides a convenient wrapper for the Perplexity AI API. This framework simplifies the process of making chat completion requests to Perplexity's advanced language models.

## Features

- Easy-to-use Swift interface for the Perplexity AI API
- Support for multiple Perplexity AI models
- Asynchronous API calls using Swift's modern concurrency features
- Built-in error handling for common API issues

## Basic usage

To use PerplexityApiSwift, you need to create an instance of `PerplexityAPI` with your API token and then make chat completion requests. Here's a basic example:

```swift
import PerplexityApiSwift

// Initialize the API client
let api = PerplexityAPI(token: "your_api_token_here")

// Create a message
let messages = [Message(role: "user", content: "What is the capital of France?")]

// Make a chat completion request
do {
    let response = try await api.chatCompletion(messages: messages, model: .sonarLarge)
    print(response.choices.first?.message.content ?? "No response")
} catch {
    print("Error: \(error)")
}
```

**Important:** You need to obtain an API token from Perplexity AI to use this framework. Make sure to keep your token secure and never share it publicly.

## Available Models

The framework supports various Perplexity AI models through the `PerplexityModel` enum:

- `.sonarSmallOnline`: "llama-3.1-sonar-small-128k-online"
- `.sonarLargeOnline`: "llama-3.1-sonar-large-128k-online"
- `.sonarHugeOnline`: "llama-3.1-sonar-huge-128k-online"
- `.sonarSmallChat`: "llama-3.1-sonar-small-128k-chat"
- `.sonarLargeChat`: "llama-3.1-sonar-large-128k-chat"
- `.llama8bInstruct`: "llama-3.1-8b-instruct"
- `.llama70bInstruct`: "llama-3.1-70b-instruct"

## Error Handling

PerplexityApiSwift defines a `PerplexityError` enum for common errors:

- `.tokenNotSet`: The API token has not been set
- `.invalidResponse(statusCode:)`: The API returned an invalid response with the given status code
- `.invalidResponseFormat`: The API response could not be decoded

## Documentation

For more detailed information about the Perplexity AI API, please refer to the official documentation:

[Perplexity AI API Documentation](https://docs.perplexity.ai/)