//
//  ContentView.swift
//  Configs
//
//  Created by Amari Duran on 11/5/21.
//

import SwiftUI

struct ContentView: View {
	@State private var showDevelopment = false
	
	init() {
		#if PRODUCTION
		print("Environment: PRODUCTION")
		#elseif STAGING
		print("Environment: STAGING")
		#else
		print("Environment: DEVELOPMENT")
		#endif
	}
	
	var body: some View {
		NavigationView {
			VStack {
				Text("Create a Development Environment")
				Link("Get Help", destination: URL(string: "https://www.google.com")!)
					.font(.title2)
			}
			.navigationTitle("Config & Flags")
			.toolbar {
				#if DEVELOPMENT
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						showDevelopment.toggle()
					} label: {
						Text("Dev")
					}
				}
				#endif
			}
		}
		.sheet(isPresented: $showDevelopment) {
//			DevScreen()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
