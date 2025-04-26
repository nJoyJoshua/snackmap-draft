//
//  SheetView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI

struct SheetView: View {
    @State var searchText: String = ""
    @State var showProfileView: Bool = false
    @Binding var currentDetent: PresentationDetent
    var body: some View {
        ScrollView {
            HStack{
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemGray6))
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        
                        TextField("Automaten finden", text: $searchText)
                            .overlay(alignment: .trailing) {
                                if !searchText.isEmpty {
                                    Button(action: { searchText = "" }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundStyle(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                    }
                    .padding(8)
                }
                .padding(.leading)
                
                
                Button ( action: { showProfileView = true } ) {
                    Image(systemName: "person.circle")
                        .font(.system(size: 28))
                        .padding(.trailing)
                }
            }
            .padding(.top)
            Spacer()
            
            if currentDetent != .height(50) {
                RecommendationView()
            }
            
        }
        .animation(.easeInOut(duration: 0.2), value: currentDetent)
        .fullScreenCover(isPresented: $showProfileView) {
            ProfileView(isPresented: $showProfileView)
        }
    }
}


#Preview {
    SheetView( currentDetent: .constant(.large))
}

