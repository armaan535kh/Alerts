//
//  ContentView.swift
//  Alerts
//
//  Created by Armaan Khan  on 05/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingLoginAlert = false
    @State private var isShowigBasicAlert = false
    @State private var isShowingEnterValueAlert = false
    @State private var valueString = ""
    @State private var error: MyAppError =  .noNetwork
    var body: some View {
        VStack(spacing: 40) {
            Button("Fetch Data") {
                isShowigBasicAlert = true
            }
            .alert("No Network", isPresented: $isShowigBasicAlert) {
                
                Button("Try again") {
                    //Do try again code
                }
                
                Button("Delete", role: .destructive) {
                    //Do delete code
                }
                
                Button("Cancel", role: .cancel) {}
                
            } message: {
                Text("No network detected. Connect to Wi-Fi or cellular and try again.")
            }
            
            Button("Enter Data") {
                isShowingEnterValueAlert = true
            }
            .alert("Enter Value", isPresented: $isShowingEnterValueAlert) {
                TextField("Value", text: $valueString)
                
                Button("Submit") {
                    //Submit value
                }
                
                Button("Cancel", role: .cancel) {
                    
                }
                
            } message: {
                Text("Enter the dollar value of your item")
            }
            
            Button("Log In") {
                error = .invalidPassword
                isShowigBasicAlert = true
            }
            .alert(isPresented: $isShowingLoginAlert, error: error) { error in
                
                
            } message: { error in
                Text(error.failureReason)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


enum MyAppError: LocalizedError {
    case invalidUserName
    case invalidPassword
    case noNetwork
    
    var errorDescription: String? {
        switch self {
        case .invalidUserName:
            "Invalid Username"
        case .invalidPassword:
            "Invalid Password"
        case .noNetwork:
            "No network connection"
        }
    }
    
    var failureReason: String {
        switch self {
        case .invalidUserName:
            "The username entered does not exist in our database."
        case .invalidPassword:
            "The password entered for the username is incorrect"
        case .noNetwork:
            "Unable to detect a network connection. Please connect to Wi-Fi or cellular and try again"
        }
    }
    
    
}
