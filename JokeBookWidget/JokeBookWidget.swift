//
//  JokeBookWidget.swift
//  JokeBookWidget
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import WidgetKit
import SwiftUI

struct JokeBookWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemMedium:
            JBWidgetMediumView(_joke: entry.joke)
        default:
            fatalError()
        }
    }
}

@main
struct JokeBookWidget: Widget {
    let kind: String = "JokeBookWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            JokeBookWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Joke Book Widget")
        .description("This is a Joke Book widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct MyTravelWidget_Previews: PreviewProvider {
    static var previews: some View {
        JokeBookWidgetEntryView(entry: JokeBookEntry.mockTravelEntry())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
