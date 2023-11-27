//
//  ContentView.swift
//  ShowLiveActivities
//
//  Created by Ruchikon Mueanphet on 23/11/2566 BE.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
	var body: some View {
		VStack {
			Image(systemName: "capsule")
				.imageScale(.large)
				.foregroundColor(.black)
			Text("Hello, Dynamic Island")
		}.onAppear(perform: {
			startActivity()
		})
		.padding()
	}
	
	func startActivity() {
		let attributes = ActivityAttributesSample(teamA: "Phuket", teamB: "Samui")
		let contentState = ActivityAttributesSample.Status(scoreA: 1, scoreB: 2)
		let content = ActivityContent(state: contentState, staleDate: nil)
		do {
			let _ = try Activity<ActivityAttributesSample>.request(
				attributes: attributes,
				content: content,
				pushType: nil)
		}
		catch (let error) {
			print(error.localizedDescription)
		}
	}
}

#Preview {
	ContentView()
}
