# iOS (SwiftUI) Port: Adam Asmaca

Bu klasör, depo içindeki web tabanlı Adam Asmaca oyununun iOS (SwiftUI) sürümünü içerir.

## Gereksinimler
- Xcode 15+
- (Önerilir) XcodeGen (`brew install xcodegen`)

## Projeyi Oluşturma
1. Terminalde bu klasöre gidin:
   ```bash
   cd ios/AdamAsmaca
   ```
2. Xcode projesini üretin:
   ```bash
   xcodegen
   ```
   Bu adım `AdamAsmaca.xcodeproj` oluşturur.

3. Xcode ile açın ve çalıştırın:
   ```bash
   open AdamAsmaca.xcodeproj
   ```

> Not: Uygulama SwiftUI ile yazılmıştır ve orijinal oyunun işlevini kopyalar. Türkçe karakter desteği vardır. Menüde "Yeni Oyun" ve "Sıfırla" butonları bulunur, ekrandaki klavyeden harf seçebilir veya metin alanına bir harf yazıp Enter’a basabilirsiniz.

## Paket Kimliği ve Geliştirici Hesabı
- `project.yml` içinde `PRODUCT_BUNDLE_IDENTIFIER` `com.example.AdamAsmaca` olarak ayarlıdır. Gerektiğinde kendi alan adınıza göre değiştirin.
- `DEVELOPMENT_TEAM` boş bırakılmıştır; kendi takım kimliğinizi Xcode proje ayarlarından girin.

## İkonlar
- Varsayılan olarak boş bir AppIcon tanımı vardır. Kendi ikonlarınızı `Resources/Assets.xcassets` içine ekleyebilirsiniz.