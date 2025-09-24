/*
 ASSIGNMENT: LAB1
 
 GROUP #1
 
 PARTNERS: IAN MACKENZIE, ALEKS LUBCZYNSKI
 SEPTEMBER 23, 2025
 */


import SwiftUI
struct ContentView: View {
    
    // images
    let dogNames: [String] = [
        "Airedale Terrier",
        "American Foxhound",
        "Dutch Shepherd",
        "Havanese",
        "Leonberger",
        "Mudi",
        "Norwegian Lundehund",
        "Pharaoh Hound",
        "Scottish Terrier",
        "Tosa"
    ]
    
    // decriptions of images at same index
    let dogDescriptions: [String] = [
        "The Airedale stands among the world's most versatile dog breeds and has distinguished himself as hunter, athlete, and companion.",
        "American Foxhounds are good-natured, low-maintenance hounds who get on well with kids, dogs, even cats, but come with special considerations for prospective owners.",
        "The Dutch Shepherd is a lively, athletic, alert and intelligent breed, and has retained its herding instinct for which it was originally developed.",
        "Havanese, the only dog breed native to Cuba, are vivacious and sociable companions and are especially popular with American city dwellers.",
        "The Leonberger is a lush-coated giant of German origin. They have a gentle nature and serene patience and they relish the companionship of the whole family.",
        "The Mudi is an extremely versatile, intelligent, alert, agile, all-purpose Hungarian farm dog. The breed is a loyal protector of property and family members without being overly aggressive.",
        "From Norway’s rocky island of Vaeroy, the uniquely constructed Norwegian Lundehund is the only dog breed created for the job of puffin hunting. With puffins now a protected species, today’s Lundehund is a friendly, athletic companion.",
        "The Pharaoh Hound, ancient Blushing Dog of Malta, is an elegant but rugged sprinting hound bred to course small game over punishing terrain. Quick and tenacious on scent, these friendly, affectionate hounds settle down nicely at home.",
        "A solidly compact dog of vivid personality, the Scottish Terrier is an independent, confident companion of high spirits. Scotties have a dignified, almost-human character.",
        "The Tosa's temperament is marked by patience, composure, boldness and courage. He is normally a tranquil, quiet, and obedient dog, with a calm but vigilant demeanor."
    ]
    
    // making the dictionary from the arrays
    var dogDict: [String: String] {
        Dictionary(uniqueKeysWithValues: zip(dogNames, dogDescriptions))
    } // You wrote your thing wrong lmao capitalize the N yo
    
    // Selected dog using state
    @State private var selectedDog: String? = nil
    
    // columns
    private var rows: [[String]] {
        var r: [[String]] = []
        var i = 0
        while i < dogNames.count {
            let end = min(i+2, dogNames.count)
            r.append(Array(dogNames[i..<end]))
            i += 2
        }
        return r
    }
    
    var body: some View {
        // put the grid thingy here
    }
}

// Use this for the image cards i added some style to it
struct DogCard: View {
    let name: String
    let isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(name)
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .frame(maxWidth: .infinity)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(isSelected ? Color.accentColor : Color.black.opacity(0.08),
                                lineWidth: isSelected ? 3 : 1)
                )
                .shadow(radius: 3, y: 2)
            
            Text(name)
                .font(.caption).bold()
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .background(Color.black.opacity(0.35), in: Capsule())
                .padding(8)
        }
        .frame(maxWidth: .infinity)
        .contentShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .accessibilityLabel(Text(name))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("Lab1 Preview")
    }
}
