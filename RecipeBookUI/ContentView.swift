import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecipeView(recipeManager: RecipeManager())
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            NewRecipeView()
                .tabItem {
                    Label("Add Recipe", systemImage: "plus")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "questionmark.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeManager()) // Assuming RecipeManager is needed
    }
}
