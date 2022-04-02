# Functional Dependency Closure

Menghitung *Closure* untuk *Functional Dependency*.

## Requirements

 - [Haskell](https://www.haskell.org/)
 - [Cabal](https://www.haskell.org/cabal/)

## Build

```
cabal build
```

## Run

```
cabal run
```

## Format Input

Spasi (` `) diabaikan oleh *parser*.

### Atribut

```
Input Atribut              : 
```

Atribut dipisahkan menggunakan koma (`,`). Contoh:

```
Input Atribut              : Mobil, Car, Alif
```

### Functional Dependency

```
Input Functional Dependency: 
```

Berikut merupakan aturan penulisan *Functional Dependency*:
 - *Functional Dependency* dipisahkan dengan titik koma (`;`)
 - Tanda panah menggunakan (`->`)
 - Antar atribut dipisahkan dengan koma (`,`)

Contoh:

```
Input Functional Dependency: nama, kelas -> alamat; alamat -> gedung, provinsi
```

