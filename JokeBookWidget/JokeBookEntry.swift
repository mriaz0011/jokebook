//
//  JokeBookEntry.swift
//  JokeBookWidgetExtension
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import WidgetKit

struct JokeBookEntry: TimelineEntry {
    let date: Date
    let joke : [JokeItems?]
    
    static func mockTravelEntry() -> JokeBookEntry{
        return JokeBookEntry(date: Date(), joke: [JokeItems(type: "general", setup: "Where do young cows eat lunch?", id: 2, punchline: "In the calf-ateria.")])
    }

}
