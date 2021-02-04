//
//  JBWidgetMediumView.swift
//  JokeBookWidgetExtension
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import SwiftUI
import WidgetKit

struct JBWidgetMediumView: View {
    
    private var joke: [JokeItems?]
    
    init(_joke: [JokeItems?]) {
        self.joke = _joke
    }

    var body: some View {
        Color.appYellowColor
            .ignoresSafeArea()
            .overlay(
                HStack(spacing: 10) {
                    Image("img_joker_small")
                    Image("img_joker_text")
                })
        VStack() {
            Text("Tap to read latest joke!").padding(10)
        }
    }
}

struct JBWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        JBWidgetMediumView(_joke: [JokeItems(type: "general", setup: "Where do young cows eat lunch?", id: 2, punchline: "In the calf-ateria.")])
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
