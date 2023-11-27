//
//  ActivityAttributesSample.swift
//  ShowLiveActivities
//
//  Created by Ruchikon Mueanphet on 23/11/2566 BE.
//

import ActivityKit

struct ActivityAttributesSample: ActivityAttributes {
	let teamA: String
	let teamB: String
	public typealias Status = ContentState
	public struct ContentState: Codable, Hashable {
		var scoreA: Int
		var scoreB: Int
	}
}
