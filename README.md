# PerplexityApiSwift

PerplexityApiSwift is a Swift framework that provides a convenient wrapper for the Perplexity AI API. This framework simplifies the process of making chat completion requests to Perplexity's advanced language models.

## Features

- Easy-to-use Swift interface for the Perplexity AI API
- Support for multiple Perplexity AI models
- Asynchronous API calls using Swift's modern concurrency features
- Built-in error handling for common API issues

## Quick Start

1. Initialize the API client with your token:
   ```swift
   let api = PerplexityAPI(token: "your_api_token_here")
   ```

2. Make a chat completion request:
   ```swift
   let messages = [Message(role: "user", content: "Hello, AI!")]
   let response = try await api.chatCompletion(messages: messages, model: .sonarLarge)
   ```

## Models

The framework supports various Perplexity AI models, including:
- Sonar (small, medium, large)
- CodeLlama-34b
- Llama-2-70b
- Mistral-7b
- Mixtral-8x7b

## Documentation

For detailed information about the Perplexity AI API, including available endpoints, request/response formats, and model capabilities, please refer to the official documentation:

[Perplexity AI API Documentation](https://docs.perplexity.ai/)

## License

[Add your license information here]

## Contributing

[Add contribution guidelines if applicable]