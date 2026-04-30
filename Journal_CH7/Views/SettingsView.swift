//
//  SettingsView.swift
//  Journal_CH7
//
//  Created by jeffrey lullen on 4/30/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("SETTINGS_APPEARANCE_THEME_KEY") private var theme: Theme = .system
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $theme){
                        ForEach(Theme.allCases, id:\.self){ theme in
                            Text(theme.rawValue).tag(theme)
                            
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
