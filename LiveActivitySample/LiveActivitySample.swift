//
//  LiveActivitySample.swift
//  LiveActivitySample
//
//  Created by Ruchikon Mueanphet on 24/11/2566 BE.
//

import WidgetKit
import SwiftUI

struct LiveActivitySampleEntryView : View {
	var attributes: ActivityAttributesSample
	var state: ActivityAttributesSample.ContentState
	var body: some View {
		VStack {
			HStack {
				Text(attributes.teamA)
					.bold()
					.foregroundColor(.white)
				Text("VS")
					.bold()
					.foregroundColor(.white)
				Text(attributes.teamB)
					.bold()
					.foregroundColor(.white)
			}
			Text(String(state.scoreA) + " - " + String(state.scoreB))
				.bold()
				.font(.system(size: 24))
				.foregroundColor(.white)
		}
		.activityBackgroundTint(.red)
	}
}

struct LiveActivitySample: Widget {
	var body: some WidgetConfiguration {
		ActivityConfiguration(for: ActivityAttributesSample.self) { context in
			LiveActivitySampleEntryView(attributes: context.attributes, state: context.state)
		} dynamicIsland: { context in
			DynamicIsland {
				DynamicIslandExpandedRegion(.center) {
					LiveActivitySampleEntryView(attributes: context.attributes, state: context.state)
				}
				DynamicIslandExpandedRegion(.leading) {
					Image(systemName: "soccerball.inverse")
				}
				DynamicIslandExpandedRegion(.trailing) {
					Text("LCup")
				}
				DynamicIslandExpandedRegion(.bottom) {
					HStack {
						Image(systemName: "trophy.fill")
							.foregroundColor(.orange)
						Image(systemName: "trophy.fill")
							.foregroundColor(.orange)
						Image(systemName: "trophy.fill")
							.foregroundColor(.orange)
					}
				}
			} compactLeading: {
				Image(systemName: "soccerball.inverse")
			} compactTrailing: {
				Text(String(context.state.scoreA) + " : " + String(context.state.scoreB))
					.font(.system(size: 24))
					.foregroundColor(.white)
			} minimal: {
				Image(systemName: "soccerball.inverse")
			}
		}
	}
}
