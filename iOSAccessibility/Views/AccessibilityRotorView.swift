//
//  AccessibilityRotorView.swift
//  iOSAccessibility
//
//  Created by Arvind Seth on 22/07/24.
//

import SwiftUI

struct City: Identifiable, Hashable {
    var id: String { name }
    let name: String
}

struct AccessibilityRotorView: View {
    let cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio"].map(City.init)

    var body: some View {
        List(cities, id: \.self) { city in
            Text(city.name)
        }
        .accessibilityRotor("Cities", entries: cities, entryLabel: \.name)
    }
}

struct AccessibilityRotorView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityRotorView()
    }
}


/*

 Accessibility Custom Rotors(accessibilityCustomRotors) : enhance the navigational experience for users who rely on VoiceOver and other assistive technologies. By using accessibility rotors, we can create custom navigation options that allow users to quickly move through lists or collections of items with a simple gesture. This is especially useful in applications where efficient navigation through a large set of data is essential. The term "rotor" refers to a VoiceOver gesture where users rotate two fingers on the screen, enabling them to select different navigation options and then swipe up or down to navigate through the selected options.
 
 Accessibility rotors can be particularly useful in scenarios such as navigating through a list of contacts in a phone book, scrolling through a list of messages in an email app, or browsing through categories in a shopping app. These rotors provide a streamlined way for users to jump to specific items without having to swipe through each one individually.


 The .accessibilityRotor modifier in SwiftUI is used to create a custom rotor labeled "Cities" specifically designed for VoiceOver users. This rotor enables seamless navigation through the list of cities (cities) by using familiar VoiceOver gestures. Users can select "Cities" from the rotor options and swipe up or down to quickly move through different cities, improving accessibility and user experience.
 .accessibilityRotor("Cities", entries: cities, entryLabel: \.name): This configuration specifies the label "Cities" for the rotor, populates it with entries from the cities array, and uses the name property of each City object as the label for navigation, ensuring clarity and usability for VoiceOver users

 */
