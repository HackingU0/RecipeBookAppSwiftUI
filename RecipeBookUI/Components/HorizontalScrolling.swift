import SwiftUI

struct HorizontalScrolling: View {
    @ObservedObject var recipeManager: RecipeManager
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(recipeManager.recipes.shuffled()) { recipe in
                    RecipeCard(recipe: recipe)
                }
                .padding(.horizontal)
            }
        }
    }
}
