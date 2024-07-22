//
//  ProfileMenuItem.swift
//  iOSAccessibility
//
//  Created by Arvind Seth on 22/07/24.
//

import SwiftUI

struct ProfileMenuItem: View {
    var icon: String
    var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .accessibilityHidden(true)
            Text(text)
                .foregroundColor(.primary)
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(text) menu item")
        .accessibilityHint("Double tap to open the \(text) section")
    }
}
