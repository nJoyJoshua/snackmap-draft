//
//  ProfileView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isPresented: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    Text("John Doe")
                        .font(.title.bold())
                    
                    Text("john.doe@example.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 100)
                
                Spacer()
                
                
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 1)
                        Text("Sign Out")
                            .foregroundColor(.red)
                            .padding()
                        
                    }
                }
                .padding(.top, 30)
            }
            .padding()
            Button(action: { isPresented = false }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.gray)
                    .padding(16)
            }
        }
    }
}

#Preview {
    ProfileView(isPresented: .constant(true))
}
