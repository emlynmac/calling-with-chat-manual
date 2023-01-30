//
//  ContentView.swift
//  CallingWithChat
//
//  Created by Emlyn Bolton-Maggs on 2023-01-27.
//

import SwiftUI
import AzureCommunicationUIChat
import AzureCommunicationUICalling

struct ContentView: View {

    @ObservedObject var contentViewModel: ContentViewModel

    var body: some View {
        TabView {
            chatView
                .navigationTitle("Chat")
                .navigationBarTitleDisplayMode(.inline)
                .tag("Chat")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }
            callingView
                .navigationTitle("Calling")
                .navigationBarTitleDisplayMode(.inline)
                .tag("Calling")
                .tabItem {
                    Image(systemName: "video.bubble.left.fill")
                    Text("Calling")
                }
        }
        .task {
            await contentViewModel.createChatAdapter()
            contentViewModel.startVideoCall()
        }
        .padding()
    }

    private var chatView: some View {
        VStack {
            if let adapter = self.contentViewModel.chatAdapter {
                ChatCompositeView(with: adapter)
            } else {
                EmptyView()
            }
        }
    }

    private var callingView: some View {
        VStack {
//            Button("Start Call") {
//                contentViewModel.startVideoCall()
//            }
            if let callVc = self.contentViewModel.callViewController {
                CallView(hostedViewController: callVc)
            } else {
                EmptyView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            contentViewModel: ContentViewModel()
        )
    }
}
