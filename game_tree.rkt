;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname game_tree) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define myBoard (list (list 1 1  -1)
                      (list -1 -1 -1)
                      (list -1 0 1)
      ))

(define (myThird alist)(first (rest (rest alist))))

(first (list 1 2 3))
(second (list 1 2 3))
(third (list 1 2 3))

(if (= 1 1 1) 1 -1)

(if (= 1 0 1) 1 -1)

(define (checkRow alist)(if (= (first alist)(second alist)(third alist)) (first alist) 0))
(checkRow (list 1 1 1))
(checkRow (list -1 -1 -1))
(checkRow (list 1 0 1))

(define (inc1 x)(+ 1 x))
(map inc1 (list 1 2 3 4))

(map checkRow myBoard)

(define (transpose aBoard)(list (map first aBoard)
(map second aBoard)
(map third aBoard)))

(transpose myBoard)

(map checkRow (transpose myBoard))

(define (checkDiagon aBoard)(if (= (first (first aBoard))
                                   (second (second aBoard))
                                   (third (third aBoard)))
                                (first (first aBoard))
                                0))

(checkDiagon myBoard)

(define (checkCDiagon aBoard)(if (= (third (first aBoard))
                                    (second (second aBoard))
                                    (first (third aBoard)))
                                 (first (third aBoard))
                                 0))
(checkCDiagon myBoard)

(define (checkWinStates aBoard) (append (map checkRow aBoard)
                                        (map checkRow (transpose aBoard))
                                        (list (checkDiagon aBoard))
                                        (list (checkCDiagon aBoard))))

(checkWinStates myBoard)

(define (winnerFromList alist)(if (empty? alist) 0
                                  (if (not (= (first alist) 0))
                                      (first alist)
                                      (winnerFromList (rest alist)))))

(winnerFromList (checkWinStates myBoard))

(define (checkWinner aBoard)(winnerFromList (checkWinStates aBoard)))

(checkWinner myBoard)
