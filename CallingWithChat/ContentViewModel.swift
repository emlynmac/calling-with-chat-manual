//
//  ContentViewModel.swift
//  CallingWithChat
//
//  Created by Emlyn Bolton-Maggs on 2023-01-30.
//

import SwiftUI

import AzureCommunicationUIChat
import AzureCommunicationUICalling
import AzureCommunicationCommon

class ContentViewModel: ObservableObject {
    @Published var chatAdapter: ChatAdapter?

    private let endpoint = "<ACS_ENDPOINT>"
    private let identifier = "<IDENTIFIER"
    private let token = "<TOKEN_STRING>"
    private let chatThreadId = "<CHAT_THREAD_ID>"
    private let groupCallId = UUID(uuidString: "<GROUP_CALL_UUID")!

    func createChatAdapter() async {
        let adapter = ChatAdapter(
            endpoint: endpoint,
            identifier: CommunicationUserIdentifier(identifier),
            credential: try! CommunicationTokenCredential(token: token),
            threadId: chatThreadId
        )
        do {
            try await adapter.connect()
            Task { @MainActor in
                self.chatAdapter = adapter
            }
        } catch {
            print(error)
        }
    }

    func startVideoCall() {
        let composite = CallComposite()
        composite.launch(
            remoteOptions: RemoteOptions(
                for: .groupCall(groupId: groupCallId),
                credential: try! CommunicationTokenCredential(token: token),
                displayName: "Test here"
            )
        )
    }
}
