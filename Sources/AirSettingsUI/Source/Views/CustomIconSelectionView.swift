//
//  CustomIconSelectionView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CustomIconSelectionView: View {

    @Environment(\.dismiss) private var dismiss
        
    var icons: [AppIcon] = AppIcon.allCases
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 4)

    public init() {}

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(icons, id: \.self) { icon in
                    Button {
                        UIApplication.shared.setAlternateIconName(icon.name)
                    } label: {
                        if UIApplication.shared.alternateIconName == icon.name {
                            Image(uiImage: icon.preview)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.accentColor, lineWidth: 3.5)
                                )
                        } else {
                            Image(uiImage: icon.preview)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(16)
                        }
                    }
                    .buttonStyle(.borderless)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Strings.appIcon)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(Strings.done, action: dismiss.callAsFunction)
            }
        }
    }
}

@available(iOS 16.0, *)
struct CustomIconSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CustomIconSelectionView()
        }
    }
}
