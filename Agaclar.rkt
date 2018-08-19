;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Agaclar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#! Anlaşılır olması için her listenin parantezini girdili bir şekilde yaptık, siz iç içe tanımlayabilirsiniz bir fark yok.
#! lang racket
(define MyTree (list 53
                     (list 23
                           (list 11 '() '())
                      )
                     (list 17

                           (list 100 '() '())
                      )
                )
)

#! fonksiyonumuzu yazalım en büyük değeri bulmak için.
(define (node agac) (car agac)) ;car: başı cdr: kalanı listenin
(define (sol agac) (car (cdr agac)))
(define (sag agac) (car (cdr (cdr agac)))) #! bir cdr yi silince çalışıyor!!!
(define (eb2 a b) (if (> a b) a b))
(define (eb3 a b c) (eb2 (eb2 a b) (eb2 a c)))

(define (enbuyuk agac) (if (empty? agac)
                           0
                         (eb3
                           (node agac)
                           (enbuyuk (sol agac))
                           (enbuyuk (sag agac))
                         )
                        )
)
(enbuyuk MyTree)