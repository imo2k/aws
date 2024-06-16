//
//  HomeView.swift
//  aws_til
//
//  Created by o2k on 6/14/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Today I Learned")
                .font(.largeTitle)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Plan")
                TextField("Plan 내용", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Real")
                TextField("Real 내용", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            HStack {
                Button(action: {
                    // Action for 목록 button
                }) {
                    Text("목록")
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    // Action for 제출 button
                }) {
                    Text("제출")
                }
                .padding()
            }
        }
        .navigationTitle("Home View")
        .navigationBarItems(trailing: NavigationLink(destination: SubmitView()) {
            Text("Submit View")
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
