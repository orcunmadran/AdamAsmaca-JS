import SwiftUI

struct ContentView: View {
    @State private var words: [String] = [
        "kütüphane",
        "koleksiyon",
        "veri tabanı",
        "açık erişim",
        "otomasyon",
        "issn",
        "isbn",
        "açık ders malzemeleri"
    ]

    @State private var selectedWord: String = ""
    @State private var revealedChars: [String] = []
    @State private var inputLetter: String = ""
    @State private var guessedLetters: Set<String> = []

    // Turkish keyboard letters (lowercase)
    private let trLetters: [[String]] = [
        ["a","b","c","ç","d","e","f","g","ğ"],
        ["h","ı","i","j","k","l","m","n"],
        ["o","ö","p","r","s","ş","t"],
        ["u","ü","v","y","z"]
    ]

    var body: some View {
        VStack(spacing: 16) {
            Text("___ Adam Asmaca ___")
                .font(.largeTitle)
                .bold()

            // In original HTML the selected word is shown explicitly
            HStack {
                Text("Seçilen Kelime:")
                    .font(.headline)
                Text(selectedWord)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }

            Text(displayedWord)
                .font(.title2)
                .monospaced()
                .padding(.vertical, 8)
                .accessibilityLabel("Tahminler: \(displayedWord)")

            HStack(spacing: 8) {
                TextField("Harf girin", text: $inputLetter)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: 180)
                    .onSubmit { submitTypedLetter() }
                Button("Harfi Sorgula") { submitTypedLetter() }
                    .buttonStyle(.borderedProminent)
                    .disabled(inputLetter.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }

            VStack(spacing: 10) {
                ForEach(0..<trLetters.count, id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(trLetters[row], id: \.self) { letter in
                            Button(action: { processGuess(letter) }) {
                                Text(letter)
                                    .frame(width: 34, height: 34)
                            }
                            .buttonStyle(.bordered)
                            .disabled(guessedLetters.contains(letter))
                        }
                    }
                }
            }
            .padding(.top, 8)

            HStack(spacing: 12) {
                Button("Yeni Oyun") { startNewGame() }
                Button("Sıfırla") { resetProgressKeepingWord() }
                    .tint(.orange)
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
        .onAppear { startNewGame() }
    }

    private var displayedWord: String {
        revealedChars.joined(separator: " ")
    }

    private func submitTypedLetter() {
        let trimmed = inputLetter.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let firstChar = trimmed.first else { return }
        let letter = String(firstChar).lowercased(with: Locale(identifier: "tr_TR"))
        inputLetter = ""
        processGuess(letter)
    }

    private func startNewGame() {
        if words.isEmpty {
            words = [
                "kütüphane","koleksiyon","veri tabanı","açık erişim",
                "otomasyon","issn","isbn","açık ders malzemeleri"
            ]
        }
        selectedWord = words.randomElement() ?? "kütüphane"
        resetProgressKeepingWord()
    }

    private func resetProgressKeepingWord() {
        let chars = Array(selectedWord)
        revealedChars = chars.map { ch in
            if ch == " " { return "-" }
            return "_"
        }
        guessedLetters.removeAll()
    }

    private func processGuess(_ rawLetter: String) {
        let letter = rawLetter.lowercased(with: Locale(identifier: "tr_TR"))
        guard !letter.isEmpty else { return }
        guessedLetters.insert(letter)

        let wordChars = Array(selectedWord.lowercased(with: Locale(identifier: "tr_TR")))
        for (index, wch) in wordChars.enumerated() {
            if String(wch) == letter {
                let originalChar = String(Array(selectedWord)[index])
                revealedChars[index] = originalChar
            }
        }
    }
}

#Preview {
    ContentView()
}