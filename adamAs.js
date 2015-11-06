/* Adam Asmaca  */
/* 6 Kasım 2015 */

var kelimeler = new Array('Kütüphane', 'Koleksiyon', 'Veri Tabanı', 'Açık Erişim', 'Otomasyon', 'ISSN', 'ISBN', 'Açık Ders Malzemeleri');
var kelimeSayisi = kelimeler.length;
var girilenHarf = 'ü';
var secilenKelimeNo = Math.floor(Math.random() * kelimeSayisi);
var secilenKelime = kelimeler[secilenKelimeNo];
document.write('Seçilen Kelime: '+ secilenKelime +'<br>');
var harfSayisi = secilenKelime.length;
document.write('Harf Sayısı: '+ harfSayisi +'<br>');

var harfTutucu = new Array(harfSayisi);

for(var j=0; j<harfSayisi; j++){
        harfTutucu[j] = ' _ ';
        harfTutucu[secilenKelime.indexOf(' ',j)] = ' - ';
}

document.write(harfTutucu);

function harfKontrol(){
    for(var i=0; i<harfSayisi; i++){
        var bulunanHarfNo = secilenKelime.indexOf(girilenHarf,i);
        harfTutucu[bulunanHarfNo] = girilenHarf;
    }
}
harfKontrol();
document.write('<br>' + harfTutucu);