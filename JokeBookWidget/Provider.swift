//
//  Provider.swift
//  JokeBookWidgetExtension
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import WidgetKit

struct Provider: TimelineProvider {
    let loader: JokeItemResource = JokeItemResource()
    typealias Entry = JokeBookEntry

    func placeholder(in context: Context) -> JokeBookEntry {
        JokeBookEntry.mockTravelEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (JokeBookEntry) -> ()) {
        let entry = JokeBookEntry.mockTravelEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        loader.getJokeItems(category: "general") { (response) in
            let currentDate = Date()
            let entry = JokeBookEntry(date: currentDate, joke: response)
            let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }

    }
}
