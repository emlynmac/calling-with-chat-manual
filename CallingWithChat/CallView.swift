//
//  CallView.swift
//  CallingWithChat
//
//  Created by Emlyn Bolton-Maggs on 2023-01-30.
//

import SwiftUI
import UIKit

struct CallView: UIViewControllerRepresentable {

    var hostedViewController: UIViewController

    func makeUIViewController(context: Context) -> some UIViewController {
        return hostedViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}
