//
//  aws_tilApp.swift
//  aws_til
//
//  Created by o2k on 6/14/24.
//

import Amplify
import SwiftUI

@main
struct aws_til: App {
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.configure()
            print("Amplify configure 성공")
        } catch {
            print("실패", error)
        }
    }
}
