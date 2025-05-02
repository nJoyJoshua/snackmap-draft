//
//  NotificationViewModel.swift
//  SnackMapEntwurf
//
//  Created by Leonie Granz on 29.04.25.
//

import Foundation

class SupplierNotificationViewModel: ObservableObject {
    @Published var notifications: [SupplierNotification] = []
    
    func fetchNotifications() {
        notifications = [
            SupplierNotification(sender: "Grillimbiss", message: "Neue Würste vom Grillimbiss sind verfügbar"),
            SupplierNotification(sender: "Saftladen", message: "Der neue ACE Saft ist super lecker. Außerdem ist die Tralalero tralala wieder verfügbar und die Elite super chips sind auch wieder drin"),
            
        ]
    }
    
    func sendNotification() {
        
    }
    
    
}
