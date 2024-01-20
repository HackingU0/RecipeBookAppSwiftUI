//TO LAKEVIEW ACADEMY FOREVER

import SwiftUI

@main
struct RecipeBookUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(RecipeManager())
                .preferredColorScheme(.dark)
        }
    }
}


struct RecipeBookUIApp_Preview : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeManager())
            .preferredColorScheme(.dark)
    }
}
