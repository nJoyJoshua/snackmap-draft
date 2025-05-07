//
//  ProfileView.swift
//  SnackMapEntwurf
//
//  Created by Merry on 26.04.25.
//

import SwiftUI

// MARK: - ProfileView

struct ProfileView: View {
    
    @EnvironmentObject private var notificationViewModel: SupplierNotificationViewModel
    @EnvironmentObject private var sheetRouter: SheetRouter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ProfileHeaderView()
                NotificationsSection(notifications: notificationViewModel.notifications)
                SignOutButton(action: signOut)
            }
            .padding()
        }
        .onAppear {
            notificationViewModel.fetchNotifications()
        }
    }
    
    // MARK: - Actions
    
    private func signOut() {
        // your sign-out logic here
        print("Signed out")
    }
}

// MARK: - ProfileHeaderView

private struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 8) {
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
        .frame(maxWidth: .infinity)
    }
}

// MARK: - NotificationsSection

private struct NotificationsSection: View {
    
    let notifications: [SupplierNotification]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Benachrichtigungen (\(notifications.count))")
                .font(.headline)
                .foregroundStyle(.secondary)
            
            ForEach(notifications) { notification in
                NotificationRow(notification: notification)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - NotificationRow

private struct NotificationRow: View {
    
    let notification: SupplierNotification
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(uiColor: .secondarySystemBackground))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                .frame(height: 80)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(notification.sender)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(notification.message)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - SignOutButton

private struct SignOutButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 1)
                Text("Sign Out")
                    .foregroundColor(.red)
                    .padding()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Preview

#Preview {
    ProfileView()
        .environmentObject(SupplierNotificationViewModel())
        .environmentObject(SheetRouter())
}
