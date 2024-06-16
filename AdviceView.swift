//
//  AdviceView.swift
//  aws_til
//
//  Created by o2k on 6/14/24.
//
import SwiftUI

struct AdviceView: View {
    @Binding var planText: String
    @Binding var realText: String
    @State private var responseText: String = ""
    @State private var isLoading: Bool = false
    private let openAIClient = OpenAIClient()

    var body: some View {
        VStack {
            Text("AI Advice")
                .font(Font.system(size: 37))
                .padding()
                .padding(.bottom, 60)

            if isLoading {
                ProgressView()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            } else {
                ScrollView {
                    Text(responseText)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity) // Text 뷰의 너비를 최대로 확장
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // ScrollView의 크기를 최대로 확장
                .padding()
            }

            Spacer()
        }
        .onAppear(perform: fetchAIAdvice)
        .navigationTitle("Advice View")
    }

    private func fetchAIAdvice() {
        isLoading = true
        responseText = ""
        openAIClient.sendRequest(planText: planText, realText: realText) { response in
            DispatchQueue.main.async {
                self.responseText = response ?? "Failed to get response"
                self.isLoading = false
            }
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView(
            planText: .constant("This is a sample plan text."),
            realText: .constant("This is a sample real text.")
        )
    }
}

