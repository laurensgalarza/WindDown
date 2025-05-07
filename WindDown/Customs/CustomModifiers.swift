//  CustomModifiers.swift
//  WindDown
//  Created by Lauren Galarza on 12/9/24.
//  Defines custom viewmodiers, including ButtonStyle

import Foundation
import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(radius: 2, y: 5)
            .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .title3).pointSize))
            .tracking(2)
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            
    }
}

extension View {
    
    func buttonModifier() -> some View {
        modifier(ButtonStyle())
    }
}

