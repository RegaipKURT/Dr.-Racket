;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname march1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;neighborhood map
;list of edges
(define myMap (list (list 1 2)
      (list 1 3)
      (list 1 4)
      (list 2 3)
      (list 3 4)
      )
  )
; any solution with (node color) order
(define mySolution (list (list 1 3)
                         (list 2 2)
                         (list 3 2)
                         (list 4 1)
                         ))


;write a function to get the color of given node from the given solution


(define (getColor aNode aSolution)( if(empty? aSolution)
                                      null
                                      (if(= aNode (first (first aSolution)))
                                         (first (rest (first aSolution)))
                                         (getColor aNode (rest aSolution)))))

(getColor 1 mySolution) ;will return 1
(getColor 4 mySolution) ;will return 1
(getColor 3 mySolution) ;will return 2

(define (getNeig aNode aMap)( if(empty? aMap)
                                null
                                (if (= (first (first aMap)) aNode)
                                    (cons (first (rest (first aMap)))
                                          (getNeig aNode (rest aMap)))
                                    (if (= aNode (first (rest (first aMap))))
                                        (cons (first (first aMap))
                                              (getNeig aNode (rest aMap)))
                                        (getNeig aNode (rest aMap))))))

(getNeig 4 myMap)

;(check aNode aMap aSolution)
; c = (getColor aNode aSolution)
; l = (getNeigh aNode aMap)
; get color of all members of l, one by one and check if it is equal to c
; if any color eqauls c than return #false
; if none equals c than return #true

(define (checkHelper aNode lNeigh aSolution)(if (empty? lNeigh) #true
                                                (if (= (getColor aNode aSolution)
                                                       (getColor (first lNeigh) aSolution))
                                                    #false
                                                    (checkHelper aNode (rest lNeigh) aSolution))))

                                                    
(define (check aNode aMap aSolution)(checkHelper aNode (getNeig aNode aMap) aSolution))

(check 2 myMap mySolution)
;list of nodes
(define lnodes (list 1 2 3 4))
(define (csp aSolution aMap lN)(if (empty? lN) #true
                                         (and (check (first lN) aMap aSolution)
                                                     (csp aSolution aMap (rest lN)))))
(csp mySolution myMap lnodes)
