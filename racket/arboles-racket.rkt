#lang racket
; '(  (() 17 ())  34  (() 73 ())  )

(define (imprimir-arbol-inorder arbol)
  (if (null? arbol)
      '()
      (begin
        (imprimir-arbol-inorder (first arbol))   ; Procesa el subárbol izquierdo
        (display (second arbol))                ; Imprime el nodo actual
        (display " ")
        (imprimir-arbol-inorder (third arbol))  ; Procesa el subárbol derecho
      )
  )
)

; (imprimir-arbol-inorder  '(  (() 17 ())  34  (() 73 ())  ))

(define (imprimir-arbol-inorder-descendente arbol)
  (if (null? arbol)
      void
      (begin
        (imprimir-arbol-inorder-descendente (third arbol))  ; Procesa el subárbol derecho
        (display (second arbol))                            ; Imprime el nodo actual
        (display " ")
        (imprimir-arbol-inorder-descendente (first arbol))  ; Procesa el subárbol izquierdo
      )
  )
)

; (imprimir-arbol-inorder-descendente  '(  (() 17 ())  34  (() 73 ())  ))

(define (buscar-en-arbol arbol dato)
  (if (not (null? arbol))
      (if (< dato (second arbol))
          (buscar-en-arbol (first arbol) dato)
          (if (> dato (second arbol))
              (buscar-en-arbol (third arbol) dato)
              (if (equal? dato (second arbol))
                  (displayln "Dato encontrado")
                  #f  ; En caso de que el dato no sea ni mayor ni menor, devolvemos un valor por defecto
              )
          )
      )
      (display "Dato no encontrado!")
  )
)

; (buscar-en-arbol  '(  (() 17 ())  34  (() 73 ())  ) 73)
; (buscar-en-arbol  '(  (() 17 ())  34  (() 73 ())  ) 69)

(define (elementos-visitados-arbol arbol dato)
  (define (buscar-aux arbol dato lista)
    (cond
      ((null? arbol)  ; Si el árbol está vacío, el dato no está presente
       (begin
         (display "Dato no encontrado!")
         lista  ; Retornamos la lista de elementos visitados
       )
      )
      ((= dato (second arbol)) ; Si el elemento coincide con el nodo actual, se encontró
       (begin
         (displayln "Dato encontrado")
         (append lista (list (second arbol)))  ; Agregamos el elemento a la lista de elementos visitados
       )
      )
      ((< dato (second arbol))
       (buscar-aux (first arbol) dato (append lista (list (second arbol))))  ; Busca en el subárbol izquierdo
      )
      (else
       (buscar-aux (third arbol) dato (append lista (list (second arbol))))  ; Busca en el subárbol derecho
      )
    )
  )
  (buscar-aux arbol dato '())  ; Llamada inicial con una lista vacía como elementos visitados
)


; (elementos-visitados-arbol '(  (() 17 ())  34  (() 73 ())  ) 73)

(define (crear-ruta arbol dato L)
  (if (not (null? arbol))
      (if (< dato (second arbol))
          (crear-ruta (first arbol) dato (append L (list (second arbol))))
          (if (> dato (second arbol))
              (crear-ruta (third arbol) dato (append L (list (second arbol))))
              (if (equal? dato (second arbol))
                  (append L (list dato))
                  #f  ; En caso de que el dato no sea ni mayor ni menor, devolvemos un valor por defecto
              )
          )
      )
      L
  )
)

; (crear-ruta '(  (() 17 ())  34  (() 73 ())  ) 73 '())


(define (cambiar-sub-arboles arbol)
  (if (not (null? arbol))
      (list (third arbol) (second arbol) (first arbol))
      '()
  )
)

; (cambiar-sub-arboles '(  (() 17 ())  34  (() 73 ())  ))

(define (invertir-sub-arboles-2 arbol dato)
  (if (not (null? arbol))
      (if (< dato (second arbol))
          (list (invertir-sub-arboles-2 (first arbol) dato) (second arbol) (third arbol))
          (if (> dato (second arbol))
              (list (first arbol) (second arbol) (invertir-sub-arboles-2 (third arbol) dato))
              (list (third arbol) (second arbol) (first arbol))
          )
      )
      '()
  )
)

; (invertir-sub-arboles-2 '(  (() 17 ())  34  ((() 60 ()) 73 (() 89 ()))) 73)

(define (invertir-sub-arboles-3 arbol)
  (if (not (null? arbol))
      (list (invertir-sub-arboles-3 (third arbol)) (second arbol) (invertir-sub-arboles-3 (first arbol)))
      '()
  )
)

; (invertir-sub-arboles-3 '(  (() 17 ())  34  ((() 60 ()) 73 (() 89 ()))))
