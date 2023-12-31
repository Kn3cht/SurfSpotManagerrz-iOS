//
//  AuthViewModel.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 31.07.23.
//

import Foundation
import SurfSpotManagerrzApi
import KeychainSwift

class AuthViewModel: ObservableObject {
      
    @Published var authState: AuthState = .unauthorized
    
    @Published var findCurrentUserLoading: Bool = false
    
    @Published var loginLoading: Bool = false
    @Published var loginFailed: Bool = false
    
    @Published var createAccountLoading: Bool = false
    @Published var createAccountFailed: Bool = false
    
    @Published var deleteAccountLoading: Bool = false
    @Published var deleteAccountFailed: Bool = false
    
    func login(email: String, password: String) {
        loginLoading = true
        Network.shared.apollo.perform(mutation: LoginMutation(email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.loginLoading = false

            switch result {
            case .success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                    handleLoginFailed()
                    self.findCurrentUser()
                } else if let token = gqlResult.data?.login?.token, let currentUser = gqlResult.data?.login?.user?.fragments.userFragment {
                    handleLoginSuccess(token: token, user: currentUser)
                } else {
                    print("Login failed")
                    handleLoginFailed()
                }
            case .failure(let error):
                print(error)
                handleLoginFailed()
            }
        }
    }
    
    func createAccount(email: String, password: String, username: String) {
        createAccountLoading = true
        Network.shared.apollo.perform(mutation: CreateAccountMutation(username: username, email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.createAccountLoading = false
            
            switch result {
            case .success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                    handleAccountCreationFailed()
                } else if let createAccount = gqlResult.data?.createAccount, let token = createAccount.token, let user = createAccount.user?.fragments.userFragment {
                    handleAccountCreationSuccess(token: token, user: user)
                } else {
                    print("Login failed")
                    handleAccountCreationFailed()
                }
            case .failure(let error):
                print(error)
                handleAccountCreationFailed()
            }
        }
    }
    
    func findCurrentUser() {
        findCurrentUserLoading = true
        Network.shared.apollo.fetch(query: FindCurrentUserQuery()) { [weak self] result in
            guard let self = self else { return }
            self.findCurrentUserLoading = false
            self.loginLoading = false
            
            switch result {
            case .success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                    self.authState = .unauthorized
                } else if let user = gqlResult.data?.findCurrentUser?.fragments.userFragment {
                    self.authState = .authorized(currentUser: user)
                } else {
                    self.authState = .unauthorized
                }
            case .failure(let error):
                print(error)
                self.authState = .unauthorized
            }
        }
    }
    
    func logout() {
        let keychain = KeychainSwift()
        keychain.delete(Constants.Security.tokenKeychainKey)
        self.authState = .unauthorized
    }
    
    func deleteAccount() {
        deleteAccountLoading = true
        Network.shared.apollo.perform(mutation: DeleteAccountMutation()) { [weak self] result in
            guard let self = self else { return }
            self.deleteAccountLoading = false
            
            switch result {
            case .success(let gqlResult):
                if let errors = gqlResult.errors {
                    print(errors)
                    deleteAccountFailed = true
                } else if gqlResult.data?.deleteAccount != nil {
                    self.authState = .unauthorized
                    self.deleteAccountFailed = false
                } else {
                    print("account could not be deleted")
                    self.deleteAccountFailed = true
                }
            case .failure(let error):
                print(error)
                self.deleteAccountFailed = true
            }
        }
    }
}

extension AuthViewModel {
    
    func handleAccountCreationFailed() {
        let keychain = KeychainSwift()

        self.authState = .unauthorized
        self.createAccountFailed = true
        keychain.delete(Constants.Security.tokenKeychainKey)
    }
    
    
    func handleAccountCreationSuccess(token: String, user: UserFragment) {
        let keychain = KeychainSwift()

        self.authState = .authorized(currentUser: user)
        self.createAccountFailed = false
        keychain.set(token, forKey: Constants.Security.tokenKeychainKey)
    }
    
    func handleLoginFailed() {
        let keychain = KeychainSwift()

        self.authState = .unauthorized
        self.loginFailed = true
        keychain.delete(Constants.Security.tokenKeychainKey)
    }
    
    func handleLoginSuccess(token: String, user: UserFragment) {
        let keychain = KeychainSwift()
        
        loginFailed = false
        keychain.set(token, forKey: Constants.Security.tokenKeychainKey)
        self.authState = .authorized(currentUser: user)
    }
}

enum AuthState {
    case unauthorized
    case authorized(currentUser: UserFragment)
}
