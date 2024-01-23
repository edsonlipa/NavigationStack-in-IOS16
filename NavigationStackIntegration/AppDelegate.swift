//
//  AppDelegate.swift
//  NavigationCoordinator
//
//  Created by Edson Lipa on 1/23/24.
//

import UIKit
import UserNotifications
import Combine

struct NotificationDestination {
    var itemID: String?
    var body: String?
    var Text: String?
    var itemType: Int?
}

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    static var navigateToNotificationDestination = CurrentValueSubject<NotificationDestination?, Never>(nil)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Request notification permissions
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                self.scheduleLocalNotification()
            } else if let error = error {
                print("Notification Permission Error: \(error.localizedDescription)")
            }
        }
        return true
    }

    func scheduleLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Don't forget to check the new updates."
        content.sound = UNNotificationSound.default
        content.threadIdentifier = "hl34dc9k"

        // Trigger in 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // Create the request
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger)

        // Add the request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - UNUserNotificationCenterDelegate Methods
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let content = response.notification.request.content

        AppDelegate.navigateToNotificationDestination.send(NotificationDestination(itemID: content.threadIdentifier))
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound]) 
        // Display the notification as a banner and play a sound
    }
}

