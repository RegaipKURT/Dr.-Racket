;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname giris) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

#! lang racket
#! Student Advanced dilini seçmediğiniz takdirde kodların ileri kısımlarında hata verecektir.

(define code "Kod: ") #! define değişken tanımlamaya yarar
(define name "PARS")
(define ilk (string-append code name)) #! append ile iki string birbirine eklendi
ilk
(define dizgi1 "Merhaba Dünya")
(string-length dizgi1) #! dizgi uzunluğu

(define x 3)
(define y 4)
(define top (+ (* x x) (* y y)) )
(define z (sqrt top))
z #! dik üçgenin hipotenüsünü hesaplama

(string-append dizgi1 ": "(number->string(string-length dizgi1))" karakter" ) #! string number dönüştürme işelmi uyguladık

(define a #true)
(define b #false)
(define d (or a b))
(define v (and a b))

#! if kullanımına örnekler
(if (= 1 1) (print "1 1'e Eşittir") (print "Eşit değil"))
(if
(= x y)
(print "koşullar eşit")
 (if
  (< x y)
  (print "x y'den küçüktür")
  (print "y küçüktür")
  )
 )

#! cond fonksiyonu da tıpkı if gibidir. Koşullarla çalışır.
(cond [(< z x) (print "x z'den büyüktür.")]
      [(< y z) (print "z y'den büyüktür.")]
      [(> x y) (print "x y'den büyüktür.")]
)

#! fonksiyon tanımlama işlemi
(define (topla sayi1 sayi2) (+ sayi1 sayi2))
(define (carp carp1 carp2) (* carp1 carp2))
(carp 4 3)
(topla 5 9)
(define (uygula fonksiyon a b) (fonksiyon a b)) #! LISP dilinin avantajlarından biri. Fonksiyona fonksiyon tanımlanabilir.
(uygula - 8 3)
(uygula / 10 9)

#! faktöryel fonksiyonu tanımlayalım
(define (fact n) ( if (= n 0) 1
                     (* n (fact ( - n 1)))))
(fact 6) #! 6 için faktöriyel fonksiyonunu çalıştırdık.

#! liste oluşturma
(define liste (list 1 2 3 4 "merhaba"))
liste
(first liste) #! listenin ilk elemanını döndürür
(rest liste) #! lsitenin ilk elemanı dışındakileri yazdırır
(append (list "kelime" "a" liste)) #! append iki listeyi birleştirir
(cons "regaip" liste) #! direk eleman eklemek için cons kullanılır

#! bir liste fonksiyonu yazalım.
#! iki listenin elemanlarını toplansın yeni bir liste oluştursun.
(define (toplamliste l1 l2) (cond [(empty? l1) l2] #! bir liste biterse diğerini döndürecek aynen
                                  [(empty? l2) l1] #! önce l1 bitmişse üstteki tersiyse bu çalışacak
                                  [else (cons (+ (car l1) (car l2))
                                        (toplamliste (cdr l1) (cdr l2)))]
                             )
)
(define l1 (list 1 7 895 43 32 2))
(define l2 (list 4 56 7 9 4 85 43 12 45 67 43))
(toplamliste l1 l2) #! üstteki iki listenin elemanlarını toplayıp uzun listenin kalan elemanlarını ayne alıp bir liste oluşturacak

#! şimdi binary tree olarak ağaçlı liste yapısı oluşturalım. Yapay zeka için burası önemlidir.
#! LISP dilinde ağaç yapısı (node left right) şeklinde listeyle gösterilir. sağ ve soldakilerde kendi içinde aynı şekilde bölünür
#! Bir örnek vererek anlatmaya çalışalım, daha iyi anlaşılsın.
(list 1 '() '()) #! burada ağacın üstünde bir var ve sağ ve sol altı boş. Bu yüzden sağ ve soldaki listeler boş.
(define a1 (list 40 (list 41 '() '()) (list 42 '() '()))) #! burada 1 in altında 2 ve 3 var ve onların altı boş.
(define (kök agac) (first agac)) #! lsitenin kök elemanını bulan fonksiyon.
a1
(kök a1)(print "verilen listenin kök elemanıdır.")

#! şimdi ağacın elemanlarını toplayan bir fonksiyon yazalım.
(define (agactopla agac) (if (empty? agac)
                             0
                             ( + (first agac)
                                 (agactopla (car (cdr agac)))
                                 (agactopla (car (cdr (cdr agac))))
                              )
                          )
)
(print "Ağacın elemanları toplamı:")
(agactopla a1) #! fonksiyonumuzu çalıştıralım ve sonucu yazdıralım.
