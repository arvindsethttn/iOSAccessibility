//
//  MagnificationGestureView.swift
//  iOSAccessibility
//
//  Created by Arvind Seth on 22/07/24.
//

import SwiftUI

struct MagnificationGestureView: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            Text("Pinch to Zoom")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .accessibilityLabel("Pinch to Zoom")
                .accessibilityHint("Use two fingers to zoom in or out")

            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 200 * scale, height: 200 * scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            self.scale = value.magnitude
                            UIAccessibility.post(notification: .announcement, argument: "Zoom level \(Int(self.scale * 100))%")
                        }
                        .onEnded { _ in
                            // Perform any additional actions
                        }
                )
                .accessibilityLabel("Image")
                .accessibilityValue("\(Int(scale * 100))% zoomed")
        }
        .padding()
    }
}

struct MagnificationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureView()
    }
}

/*
 MagnificationGesture allows users to perform pinch-to-zoom gestures on views like images or text, adjusting the scale of the content based on their touch input.

 The Image uses MagnificationGesture to enable pinch-to-zoom functionality. During the gesture (onChanged), it updates the scale state and posts an accessibility announcement to inform VoiceOver users about the zoom level. This provides real-time feedback on the zoom operation.
 The Image also uses accessibilityValue to dynamically announce the current zoom level as a percentage, ensuring VoiceOver users are informed about the visual changes caused by the gesture.
 A user with motor impairments can activate the custom gesture via AssistiveTouch by tapping on-screen controls or using a switch device to interact with the app.
 */
