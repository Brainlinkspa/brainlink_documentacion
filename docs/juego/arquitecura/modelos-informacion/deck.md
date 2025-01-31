---
id: Deck
title: Deck
sidebar_position: 2
---

## Descripcion

`Deck` representa un mazo que contiene una baraja de [`Card`](./card.md) "cartas" especificas para cada mazo, este objeto almacena su nombre, codigo y sus respectivas [`Card`](./card.md) "cartas".

## Definicion de la clase

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Models
{
    [System.Serializable]
    public class Deck 
    {
        public string deckName;
        public string deckCode;
        public List<Card> cards = new List<Card>();

        public Deck(string deckName, string deckCode, List<Card> cards)
        {
            this.deckName = deckName;
            this.deckCode = deckCode;
            this.cards = cards;
        }

        public Deck()
        {

        }
    }

}
```

## Descripcion de atributos

```csharp
public string deckName; //Almacena el nombre del Deck "mazo/baraja" de cartas.
```

**`deckName`**: Almacena el nombre del `Deck` "mazo/baraja" de cartas.

```csharp
public string deckCode; //Almacena el codigo asociado al Deck "mazo/baraja", lo que permite la identificacion unica de un Deck "mazo/baraja"
```

**`deckCode`**: Almacena el codigo asociado al `Deck` "mazo/baraja", lo que permite la identificacion unica de un `Deck` "mazo/baraja".

```csharp
public string List<Card>; //Es una lista de objetos Card "cartas", que forman parte del Deck "mazo/baraja"
```

**`List<Card>`**: Es una lista de objetos **Card** "cartas", que forman parte del `Deck` "mazo/baraja".