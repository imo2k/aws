//
//  OpenAIClient.swift
//  aws_til
//
//  Created by o2k on 6/15/24.

import Foundation
import OpenAISwift

struct Usage: Codable {
    let promptTokens: Int
    let completionTokens: Int
    let totalTokens: Int
}

class OpenAIClient {
    private let apiKey = "YOUT API KEY를 사용해주세요"
    private let url = URL(string: "https://api.openai.com/v1/chat/completions")!
    
    func sendRequest(planText: String, realText: String, completion: @escaping (String?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let prompt = "공부 계획은 \(planText) 였는데 실제 공부한 것은 \(realText) 였어. 공부에 대해서 조언을 2줄 요약해서 알려줘."
        
        let messages = [
            ["role": "system", "content": "You are a helpful assistant."],
            ["role": "user", "content": prompt]
        ]
        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": messages,
            "max_tokens": 150
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            print("Failed to encode request: \(error)")
            completion("Failed to encode request: \(error.localizedDescription)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error)")
                completion("Request failed with error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data in response")
                completion("No data in response")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response JSON: \(jsonString)")
            }

            do {
                let response = try JSONDecoder().decode(OpenAIResponse.self, from: data)
                
                // Extract first choice and summarize into 3 lines
                if let advice = response.choices?.first?.message.content {
                    let summarizedAdvice = self.summarizeText(advice)
                    completion(summarizedAdvice)
                } else {
                    completion("Failed to get advice from response")
                }
            } catch {
                print("Failed to decode response: \(error)")
                completion("Failed to decode response: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    private func summarizeText(_ text: String) -> String {

        let lines = text.components(separatedBy: "\n")
        
        let summary = lines.prefix(3).joined(separator: "\n")
        
        return summary
    }
}

