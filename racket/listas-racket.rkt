#lang racket

; Mostrar cada elemento de una lista
(define (mostrarLista L)
  (if (not (empty? L) )
      (begin
       ( display (first L))
       (newline) ; Agregar un salto de línea
       (mostrarLista (rest L))
      )
      (display "")
  )  
)

(define (contarElto L Elto)
  (if (not (empty? L) )
     (if (equal? (first L) Elto)
       (+ 1 (contarElto (rest L) Elto))
       (contarElto (rest L) Elto)
     )
     0	
  )
)

; (contarElto '(1 2 3 4 1 1) 1)

(define (leer-numeros)
  (let loop ((numeros '())
             (continuar #t))
    (display "Ingresa un número (o -1 para detenerse): ")
    (flush-output)
    (let ((numero (read)))
      (if (= numero -1)
          (reverse numeros) ; Devuelve la lista de números ingresados
          (loop (cons numero numeros) #t)))))

; (leer-numeros)

(define (llenarLista)
  (let
      (
       (elto (read))
      )
      (if (not (equal? elto -1))
          (append (list elto) (llenarLista))
          '()
       )
   )
)

; (llenarLista)
