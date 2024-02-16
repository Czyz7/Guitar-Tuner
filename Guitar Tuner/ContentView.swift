//
//  ContentView.swift
//  Guitar Tuner
//
//  Created by Czyz Hernandez on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var microphoneAccessGranted = false
    
    var body: some View {
        VStack {
            if microphoneAccessGranted {
                Text("Tuning interphase coming soon!!")
            } else {
                Button("Request Microphone Access") {
                    requestMicrophoneAccess()
                }
            }
        }
        .padding()
    }
    
    private func requestMicrophoneAccess() {
        AVCaptureDevice.requestAccess(for: .audio) { granted in
            DispatchQueue.main.async {
                self.microphoneAccessGranted = granted
            }
        }
    }
}

#Preview {
    ContentView()
}
