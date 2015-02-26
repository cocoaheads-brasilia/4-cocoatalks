// Playground - noun: a place where people can play

import UIKit

let constanteCidade = "Brasília"
var variavelEvento = "4º CocoaTalks"

variavelEvento += " " + constanteCidade
//‼️constanteCidade = "Belo Horizonte"

let implicitInteger = 26
let implicitDouble = 26.0
let explicitDouble : Double = 26

//let dateLabel = "Hoje é dia " + implicitInteger + "!"
//let dateLabel = "Hoje é dia " + String(implicitInteger) + "!"
//let dateLabel = "Hoje é dia \(implicitInteger)!"

let gruposCocoaHeads = ["Brasília",
    "Porto Alegre",
    "Fortaleza",
    "Campinas",
    "São Paulo"]

let eventosHoje : [String : (Int,String)] = ["Brasília" : (19, "Auditório-CDT"),
    "São Paulo" : (19, "Microsoft Brasil"),
    "Campinas" : (19, "Ci&T Campinas"),
    "Porto Alegre" : (19, "Faculdade de Tecnologia Senac - RS")]

for i in 0..<gruposCocoaHeads.count {
    var grupo = gruposCocoaHeads[i]
    if let (horario, local) = eventosHoje[grupo] {
        println("O CocoaHeads \(grupo) tem evento hoje às \(horario)h em \(local)")
    } else {
        println("O CocoaHeads \(grupo) não tem evento hoje. 😒")
    }
}

for grupo in gruposCocoaHeads {
    if let (horario, local) = eventosHoje[grupo] {
        println("O CocoaHeads \(grupo) tem evento hoje às \(horario)h em \(local)")
    } else {
        println("O CocoaHeads \(grupo) não tem evento hoje. 😒")
    }
}

for grupo in gruposCocoaHeads {
    if let (horario, local) = eventosHoje[grupo] {
        println("O CocoaHeads \(grupo) tem evento hoje às \(horario)h em \(local)")
    } else {
        println("O CocoaHeads \(grupo) não tem evento hoje. 😒")
    }
    switch grupo {
    case "Brasília":
        println("O CocoaHeads Brasília é o melhor!")
        break;
    default:
        println("meh..")
    }
}

for i in 0 ..< 100 {}
for var i = 0; i < 100; i++ {}

var i = 0
while i < 100 { i++ }

i = 0
do { i++ } while (i < 100)

var usuarioObrigatorio = "Daniel"
var usuarioOpcional : String? = usuarioObrigatorio

if let nome = usuarioOpcional {
    println("Boa noite, \(nome)!")
} else {
    println("Boa noite!")
}

usuarioOpcional = nil
//usuarioObrigatorio = nil
var valorObrigatorio : String
//println("\(valorObrigatorio)")

usuarioOpcional = "Daniel"
println("\(usuarioOpcional)")
// Optional("Daniel")
println("\(usuarioOpcional!)")
// Daniel

var USUARIOOPCIONAL = usuarioOpcional?.uppercaseString    //String?
var USUARIOOBRIGATORIO = usuarioOpcional!.uppercaseString //String

//func calculaMedia(a :Double, b :Double) -> Double {
//    return (a+b)/2.0
//}
//
//calculaMedia(20, 30) // 25.0

func calculaMedia(valores :Double...) -> Double {
    var media = 0.0
    for valor in valores {
        media += valor
    }
    return media/Double(valores.count)
}

calculaMedia(20, 30, 40) // 30.0

func soma(#este: Int, #comEste: Int) -> Int {
    return este+comEste
}

soma(este: 20, comEste: 30) // 50

func somaEste(primeiro: Double, comEste segundo: Double) -> Double {
    return primeiro+segundo
}

somaEste(20.0, comEste: 30.0) // 50

func incrementa(valor: Int, incremento: Int) -> Int {
    var valorParaAdicionar = 0
    func fazModuloIncremento() {
        valorParaAdicionar = abs(incremento)
    }
    fazModuloIncremento()
    return valor+valorParaAdicionar
}

incrementa(10, 20)

func ehPalindromo(valor: String) -> Bool {
    return (Array(valor) == reverse(valor))
}

func temNumeroDeLetrasPar(valor: String) -> Bool {
    return (countElements(valor)%2 == 0)
}

func filtraComFuncao(valores: [String], filtro: (String -> Bool)) -> [String] {
    var resultado = [String]()
    for valor in valores {
        if (filtro(valor)) {
            resultado.append(valor)
        }
    }
    return resultado
}

var palavras = ["salta o atlas",
    "arara",
    "acasacedeopardaloiratoesiofaleairavelaradosserrotes" +
    "etorressodaralevariaelafoiseotarioladrapoedecasaca",
    "adrogadodoteetododagorda",
    "arroz e zorra",
    "Este não é um palíndromo"]

var palindromos = filtraComFuncao(palavras, ehPalindromo)

func escolheFiltro(num : Int) -> ((String) -> Bool) {
    switch num {
    case 1:
        return temNumeroDeLetrasPar
    default:
        return ehPalindromo
    }
}

var numeros = [Int](1...10)
var multiplicado = numeros.map({ (numero: Int) -> Int in
    return 10*numero
})

multiplicado = numeros.map({ numero in 10*numero })

multiplicado = numeros.map({ 10*$0 })

multiplicado = numeros.map { 10*$0 }


class FormaGeometrica {
    
    var numeroDeLados = 0
    
    var nome : String
    
    var description : String {
        get {
            return "A figura geométrica \(nome) tem \(numeroDeLados) lados."
        }
    }
    
    init(nome : String) {
        self.nome = nome
    }
    
    convenience init(nome : String, numeroDeLados: Int) {
        self.init(nome: nome)
        self.numeroDeLados = numeroDeLados
    }
    
}

var quadrado = FormaGeometrica(nome: "Meu primeiro quadrado", numeroDeLados: 4)
println("\(quadrado.description)")

protocol Descritivel {
    func description() -> String
}

enum Rank : Int, Descritivel {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func description() -> String {
        switch self {
        case .Ace:
            return "Ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
}

enum Naipe : String, Descritivel {
    case Copas = "♥️"
    case Espadas = "♠️"
    case Ouro = "♦️"
    case Paus = "♣️"
    
    func description() -> String {
        return self.rawValue
    }
}

struct Carta : Descritivel {
    var rank : Rank
    var naipe : Naipe
    
    func description() -> String {
        return rank.description() + naipe.description()
    }
}

var carta = Carta(rank: .Ace, naipe: .Espadas)
println(carta.description())
//Ace♠️

extension String {
    func cpfFormatted() -> String {
        return self.substringToIndex(advance(self.startIndex, 3)) + "." +
        self.substringWithRange(Range<String.Index>(start: advance(self.startIndex, 3),
            end: advance(self.startIndex, 6))) + "." +
        self.substringWithRange(Range<String.Index>(start: advance(self.startIndex, 6),
            end: advance(self.startIndex, 9))) + "-" +
        self.substringWithRange(Range<String.Index>(start: advance(self.startIndex, 9),
            end: advance(self.startIndex, 11)))
    }
}

"12345678901".cpfFormatted()

//let letrasComAcento = Array("áéíóúâêîôûçã")
//let letrasSemAcento = Array("aeiouaeiouca")
//
//func retiraAcentosEWhitespaceEmCaixaBaixa(valor : String) -> String {
//    var resultado = valor.lowercaseString
//        .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//    return String(Array(resultado).map({
//        (char : Character) -> Character in
//        if let pos = find(letrasComAcento, char) {
//            return letrasSemAcento[pos]
//        }
//        return char
//    }))
//}
//
//palavras.map(retiraAcentosEWhitespaceEmCaixaBaixa)


//func sortArray<T: Comparable>(input : [T]) -> [T] {
//    var output = [T]()
//    return output
//}


//var teste = "String de teste das funções legais!!!"

//Tira a primeira ocorrência
//func -(a :String, b :String) -> String {
//    if let range = a.rangeOfString(b,
//        options: NSStringCompareOptions.LiteralSearch,
//        range: nil,
//        locale: nil) {
//        return a.substringToIndex(range.startIndex)
//            + a.substringFromIndex(range.endIndex)
//    }
//    return a
//}

//Tira todas as ocorrências
//func -(a :String, b :String) -> String {
//    if let range = a.rangeOfString(b,
//        options: NSStringCompareOptions.LiteralSearch,
//        range: nil,
//        locale: nil) {
//            return a.substringToIndex(range.startIndex)
//                + (a.substringFromIndex(range.endIndex) - b)
//    }
//    return a
//}

//var resultado = teste
