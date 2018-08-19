;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ucsearch) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define myGraph
(list (list 1 2 1)
      (list 1 3 3)
      (list 2 3 1)
      (list 3 2 2)
      (list 2 4 2)
      (list 3 5 1)
      (list 2 6 1)
      (list 5 7 1)
  )
  )
(define h ;heuristcs of the nodes
(list (list 1 4)
      (list 2 2)
      (list 3 2)
      (list 4 1)
      (list 5 0)
      )
  )

(define (find-heur anode alist) (if (empty? alist)
                                    alist
                                    (if (= anode (first (first alist)))
                                        (first (rest (first alist)))
                                        (find-heur anode (rest alist)))))

(find-heur 3 h)

(cons 2 (list 1 2 3))
(append (list 1 2 3) (list 2 3 4))
; find all the alternatives with their weights
(define (find-alt anode agraph) 
  (if (empty? agraph)
      agraph
      (if (= anode (first (first agraph)))
          (cons (rest (first agraph)) (find-alt anode (rest agraph)))
          (find-alt anode (rest agraph))
      )
      )
  )
(find-alt 1 myGraph)
; get 2 lists and compare second members of lists and return smallest
; cadr
(define (find-smaller list1 list2)(if
                                   (empty? list2)
                                   list1
                                   (
                                      if ( > (first(rest list1)); second member of list1
                                          (first(rest list2)))
                                      list2
                                      list1
                                   )
  ))
(find-smaller (list 2 11) (list 3 3))

;a function to find the cheapest alternative for the
;given node from the given list
(define (cheapest-alt alist)(if (empty? alist)
                                      alist
                                      (find-smaller (first alist)
                                                    (cheapest-alt (rest alist)))
  ))
(cheapest-alt (find-alt 6 myGraph))

;uniform cost search
(define (ucs alist start end ) (if (empty? alist)
                                   alist
                                   (if (= end start)
                                       (list end)
                                  (cons start
                                        (if (empty? (cheapest-alt (find-alt start alist)))
                                            null
                                        (ucs alist (first (cheapest-alt (find-alt start alist))) end)
                                        )

                                   )
  )))
(ucs myGraph 1 5)