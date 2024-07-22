//
//  ContentView.swift
//  iOSAccessibility
//
//  Created by Arvind Seth on 22/07/24.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Profile One")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityHint("This is the profile page header")

                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 180, height: 180)

                    Image("profile")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .accessibilityLabel("User profile picture")
                        .accessibilityHint("Profile picture of the user")
                }

                Text("profile.one@example.com")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .accessibilityLabel("Email address")
                    .accessibilityValue("profile dot one at example dot com")
            }
            .accessibilityElement(children: .contain)
            .accessibilityLabel("Profile section")
            .accessibilityHint("Contains profile picture and email address")

            List {
                ProfileMenuItem(icon: "creditcard", text: "Wallet")
                ProfileMenuItem(icon: "gearshape", text: "Settings")
                ProfileMenuItem(icon: "questionmark.circle", text: "Help")
                ProfileMenuItem(icon: "bubble.left", text: "Feedback")
            }
            .listStyle(InsetGroupedListStyle())
            .accessibilityElement(children: .contain)
            .accessibilityLabel("Profile menu list")
            .accessibilityHint("Contains wallet, settings, help, and feedback options")

            Spacer()

            Button(action: {
                // Log Out action
            }) {
                Text("Log Out")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
            .accessibilitySortPriority(1)
            .accessibilityElement(children: .contain)
            .accessibilityLabel("Log out button")
            .accessibilityHint("Double tap to log out of the application")
            .accessibilityAction {
                // VoiceOver activation action: Additional feedback or behavior for VoiceOver users
                print("Logging out...")
                // Add logout functionality specific to VoiceOver activation here
            }
        }
        .padding()
        .onAppear(){
            UIAccessibility.post(notification: .announcement, argument: "Profile updated")
        }

    }
}

#Preview {
    ProfileView()
}



/*
Accessibility Label (accessibilityLabel):
Purpose: The Text("Profile One") uses .accessibilityLabel("Profile One"). This label is read aloud by VoiceOver to describe the text to users with visual impairments. It helps them understand that this is the title of the profile page.
Implementation: Applied directly to the Text element using .accessibilityLabel("Profile One").

Accessibility Hint (accessibilityHint):
Purpose: The Text("Profile One") also includes .accessibilityHint("This is the profile page header"). This hint provides additional context about the text's purpose or function. VoiceOver users can access this hint to understand more about the profile page header.
Implementation: Added to the Text element using .accessibilityHint("This is the profile page header").

Accessibility Traits (accessibilityAddTraits):
Purpose: The Text("Profile One") is further enhanced with .accessibilityAddTraits(.isHeader). This trait informs VoiceOver that this text serves as a header, indicating its importance and role within the content.
Implementation: Used to add the header trait to the Text element, helping VoiceOver users navigate and understand the structure of the profile page.

Accessibility Value (accessibilityValue):
Purpose: The Text("profile.one@example.com") includes .accessibilityValue("profile dot one at example dot com"). This provides the exact email address as a value to VoiceOver users, ensuring they receive accurate information.
Implementation: Set on the Text element to convey the email address to VoiceOver users.

Accessibility Action  (accessibilityAction):
Purpose: The Button("Log Out") utilizes .accessibilityAction() to specify actions when activated by VoiceOver. In this context, it's used to log the user out of the application.
Implementation: Implemented with .accessibilityAction { /* action code */ } to define the log-out action specifically for VoiceOver activation, enhancing accessibility by providing a direct action for VoiceOver users. In this example, tapping the button logs the user out, while VoiceOver activation triggers specific actions or feedback, enhancing accessibility in apps.

Accessibility Element (accessibilityElement):
Purpose: Both the profile section and the profile menu list use .accessibilityElement(children: .contain) to group related UI elements for VoiceOver navigation. This helps VoiceOver users understand and navigate these sections as cohesive units rather than individual elements.
Implementation: Applied to the containers (VStack, List) to indicate that their child elements should be treated together as single accessible units.
*/
