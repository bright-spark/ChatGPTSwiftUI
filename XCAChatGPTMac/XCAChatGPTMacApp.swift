//
//  XCAChatGPTMacApp.swift
//  XCAChatGPTMac
//
//  Created by Alfian Losari on 04/02/23.
//

import SwiftUI

@main
struct XCAChatGPTMacApp: App {
    
    @StateObject var vm = ViewModel(api: ChatGPTAPI(apiKey: "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"))
    
    var body: some Scene {
        MenuBarExtra("XCA ChatGPT", image: "icon") {
            VStack(spacing: 0) {
                HStack {
                    Text("XCA ChatGPT")
                        .font(.title)
                    Spacer()
                   
                    Button {
                        guard !vm.isInteractingWithChatGPT else { return }
                        vm.clearMessages()
                    } label: {
                        Image(systemName: "trash")
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 24))
                    }

                    .buttonStyle(.borderless)
                    
                    
                    Button {
                        exit(0)
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 24))
                    }

                    .buttonStyle(.borderless)
                }
                .padding()
                
                ContentView(vm: vm)
            }
            .frame(width: 480, height: 576)
        }.menuBarExtraStyle(.window)
    }
}
