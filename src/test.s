; Notkun: (fibo i f1 f2 n)
; Fyrir:  i og n eru heiltölur, 0 <= i <= n
;         f1 er i-ta Fibonacci talan, f2 er
;         (i+1)-ta Fibonacci talan.
; Gildi:  n-ta Fibonacci talan
(define (fibo i f1 f2 n)
  (if (== i n)
      f1
      (fibo (+ i 1) f2 (+ f1 f2) n)
  )
)

; Notkun: (main)
; Fyrir:  Ekkert
; Eftir:  Búið er að reikna og skrifa fibo(1000)
(define (main)
  (writeln (++ "fibo(1000) = "
               (fibo 0 0 (bigInteger 1) 1000)
           )
  )
)

; Notkun: (main)
; Fyrir:  Ekkert
; Eftir:  Búið er að keyra for-test
(define (main)
    (for ([i (in-range 10)])
        (displayln i)
    )
)

; Notkun: (main)
; Fyrir:  Ekkert
; Eftir:  Búið er að keyra while-test
(define (main)
    (let ([i 0])
        (while (< i 10)
            (displayln i)
            (set! i (+ i 1))
        )
    )
)

