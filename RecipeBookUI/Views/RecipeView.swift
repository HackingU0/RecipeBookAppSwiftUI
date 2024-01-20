import SwiftUI

struct RecipeView: View {
    @ObservedObject var recipeManager: RecipeManager
    @State var selectedRecipe: Recipe? = nil
    var body: some View {
        NavigationView {
            ScrollView {
                HorizontalScrolling(recipeManager: recipeManager)
                    .padding(.vertical)
                    .refreshable{
                        print("Refresh")
                    }
                
                VStack {
                    ForEach(recipeManager.recipes) { recipe in
                        RecipeCard(recipe: recipe)
                            .onTapGesture {
                                selectedRecipe = recipe
                            }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .background(.ultraThickMaterial)
                .fullScreenCover(item: $selectedRecipe) { recipe in
                    RecipeDetailView(recipe: recipe)
                        .preferredColorScheme(.dark)

                }
            }.onAppear()
            .background(.ultraThinMaterial)
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipeManager: RecipeManager())
            .preferredColorScheme(.dark)
    }
}
