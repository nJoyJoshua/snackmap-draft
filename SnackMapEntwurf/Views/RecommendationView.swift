//
//  RecommendationView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI

struct RecommendationView: View {
    let categories = ["Snack", "Zigaretten", "Bauern", "Grill", "Getränke", "Süßigkeiten", "Fast Food", "Obst"]
    
    let recentItems = ["Snackbox Berlin", "Tobacco World", "Bauernmarkt München", "Grillmeister", "Süße Ecke"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Empfehlungen")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categories, id: \.self) { category in
                                CategoryButton(title: category)
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
                            RecentItemRow(title: item)
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

struct CategoryButton: View {
    let title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray6))
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.primary)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
        }    }
}

struct RecentItemRow: View {
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "clock.arrow.circlepath")
                .foregroundStyle(.gray)
            
            Text(title)
                .font(.subheadline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    RecommendationView()
}
