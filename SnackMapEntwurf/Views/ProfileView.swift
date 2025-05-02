//
//  ProfileView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var notificationViewModel: SupplierNotificationViewModel
    @EnvironmentObject var sheetRouter: SheetRouter
    
    var body: some View {
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
            
            VStack(alignment: .leading) {
                Text("Benachrichtigungen (2)")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                ForEach(notificationViewModel.notifications) { notification in
                    notificationView(notification: notification)
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 30)
            
            
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
        .onAppear {
            notificationViewModel.fetchNotifications()
        }
    }
}

extension ProfileView {
    private func notificationView(notification: SupplierNotification) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .frame(height: 70)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.sender)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(notification.message)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(SupplierNotificationViewModel())
}
