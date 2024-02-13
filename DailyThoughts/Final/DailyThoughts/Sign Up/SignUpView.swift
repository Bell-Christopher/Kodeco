//
//  SignUpView.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var isJournalShown = false
    
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.mint
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 40) {
                header()
                inputFields()
                signUpButton()
                Text("or")
                signInButton()
            }
        }
    }
    
    @ViewBuilder
    private func header() -> some View {
        VStack(spacing: 0) {
            Image("swift-laughing")
            Text("Daily Thoughts")
                .bold()
                .font(.largeTitle)
        }
    }
    
    @ViewBuilder
    private func inputFields() -> some View {
        
        VStack(alignment: .center, spacing: 16) {
            
            TextField("Email Address", text: $emailAddress)
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
            
            SecureField("Password", text: $password)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func signUpButton() -> some View {
        
        Button(action: {
            authModel.signUp(
                emailAddress: emailAddress,
                password: password
            )
        }, label: {
            Text("Sign Up")
                .bold()
                .foregroundStyle(Color.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(Capsule())
                .padding(.horizontal)
        })
    }
    
    @ViewBuilder
    private func signInButton() -> some View {
        
        Button(action: {
            authModel.signIn(
                emailAddress: emailAddress,
                password: password
            )
        }, label: {
            Text("Sign In")
                .bold()
                .foregroundStyle(Color.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(Capsule())
                .padding(.horizontal)
        })
    }
}

#Preview {
    SignUpView()
}
