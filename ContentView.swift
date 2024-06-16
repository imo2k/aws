//
//  ContentView.swift
//  aws_til
//
//  Created by o2k on 6/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var planText: String = ""
    @State private var realText: String = ""
    @State private var isSubmitViewActive = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Today I Learned")
                    .font(Font.system(size: 45))
                    .padding()
                    .padding(.bottom, 70)
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("계획했던 공부")
                            .bold()
                        TextEditor(text: $planText)
                            .frame(height: 150)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("실제 공부")
                            .bold()
                        TextEditor(text: $realText)
                            .frame(height: 150)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1))
                    }
                    .padding(.horizontal)
                }
                .padding()
                
                HStack {
                    NavigationLink(destination: SubmitView(planText: $planText, realText: $realText)) {
                        Text("제출")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 5)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
