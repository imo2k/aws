//
//  ListView.swift
//  aws_til
//
//  Created by o2k on 6/14/24.
//

import SwiftUI

struct ListView: View {
    @State private var date = Date()
    var body: some View {
        VStack {
            Text("Calendar")
                .font(.largeTitle)
                .padding()
            
            // Calendar representation
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            
            Button(action: {
                // Action for Home button
            }) {
                Text("Home")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("List View")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
