//
//  XCAChatGPTApp.swift
//  XCAChatGPT
//
//  Created by Alfian Losari on 01/02/23.
//

import SwiftUI

@main
struct XCAChatGPTApp: App {
    
    @StateObject var vm = ViewModel(api: ChatGPTAPI(apiKey: "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"))
    @State var isShowingTokenizer = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(vm: vm)
                    .toolbar {
                        ToolbarItem {
                            Button("Clear") {
                                vm.clearMessages()
                            }
                            .disabled(vm.isInteractingWithChatGPT)
                        }
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Tokenizer") {
                                self.isShowingTokenizer = true
                            }
                            .disabled(vm.isInteractingWithChatGPT)
                        }
                    }
            }
            .fullScreenCover(isPresented: $isShowingTokenizer) {
                NavigationTokenView()
            }
        }
    }
}


struct NavigationTokenView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            TokenizerView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Close") {
                            dismiss()
                        }
                    }
                }
        }
        .interactiveDismissDisabled()
    }
}


