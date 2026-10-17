import SwiftData
import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            BrainstormsListView()
        }
        .modelContainer(for: Brainstorm.self)
    }
}
