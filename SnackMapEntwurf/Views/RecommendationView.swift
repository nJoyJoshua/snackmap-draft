//
//  RecommendationView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI

struct RecommendationView: View {
    let recentItems = ["Snackbox Berlin", "Tobacco World", "Bauernmarkt München", "Grillmeister", "Süße Ecke"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Kategorien")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(VendingCategory.allCases, id: \.self) { category in
                                Button {
                                    print("Selected category: \(category.displayName)")
                                } label: {
                                    Text(category.displayName)
                                        .bold()
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 4)
                                }
                                .foregroundStyle(.primary)
                                .buttonStyle(BorderedButtonStyle())
                                .buttonBorderShape(.roundedRectangle(radius: 8))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Zuletzt")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        ForEach(recentItems, id: \.self) { item in
                            Button {
                                print("Selected Recent: \(item)")
                            } label: {
                                HStack {
                                    Image(systemName: "clock.arrow.circlepath")
                                        .foregroundStyle(.gray)
                                    
                                    Text(item)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.gray)
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                
                            }
                            .foregroundStyle(.primary)
                            .buttonStyle(BorderedButtonStyle())
                            .buttonBorderShape(.roundedRectangle(radius: 8))
                            //                            RecentItemRow(title: item)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    RecommendationView()
}
