;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname class_trees) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

(define myTree (list 20 (list 10 (list 13 '() '())
               (list 4 '() '())
               )
      (list 8 '() '())
      )
  )

(define (root atree) ( first atree))
(define (left atree) (first (rest atree)))
(define (right atree) ( first (rest (rest atree))))

(define (count atree)(if (empty? atree)
                         0
                         (+ 1 (count (left atree))
                            (count (right atree)))))

(count myTree)

(define (level atree anode)(if(empty? atree)
                              0
                              (if (= (root atree) anode)
                                  1
                                  (+  (if (or (> (level (left atree) anode) 0)
                                              (> (level (right atree) anode) 0)) 1 0)
                                   (if (> (level (left atree) anode) 0) (level (left atree) anode) 0)
                                  (if (> (level (right atree) anode) 0) (level (right atree) anode) 0))
                                  )))
                                   

(level myTree 13)
