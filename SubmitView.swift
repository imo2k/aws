//
//  SubmitView.swift
//  aws_til
//
//  Created by o2k on 6/14/24.
//

import SwiftUI

struct SubmitView: View {
    @Binding var planText: String
    @Binding var realText: String
    @State private var responseText: String = ""
    @State private var isLoading: Bool = false
    private let openAIClient = OpenAIClient()

    var body: some View {
        VStack {
            Text("Today I Learned")
                .font(Font.system(size: 37))
                .padding()
                .padding(.bottom, 60)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("계획했던 공부")
                Text(planText)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 150)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                
                Text("실제 공부")
                Text(realText)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 150)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
            }
            .padding()
            
            NavigationLink(destination: AdviceView(planText: $planText, realText: $realText)) {
                Text("AI Advice")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)

            Spacer()
        }
        .navigationTitle("Submit View")
        .navigationBarItems(leading: NavigationLink(destination: ContentView()) {
            Text("Home")
        })
    }
}



struct SubmitView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView(planText: .constant(""), realText: .constant(""))
    }
}
