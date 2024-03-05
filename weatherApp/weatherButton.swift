//
//  weatherButton.swift
//  weatherApp
//
//  Created by Ahmet Burak Dinc on 6.03.2024.
//

import SwiftUI

struct WeatherAppButtonView: View {
    var backgroundColor: Color
    var textColor: Color
    var title: String
    var body: some View {
        Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size:  20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}

