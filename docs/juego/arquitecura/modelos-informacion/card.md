---
id: Card
title: Card
sidebar_position: 1
---

## Descripcion

`Card` "carta" es un objeto representado en el sistema, su diseño permite almacenar codigo de identificacion ademas de un conjunto de tres conceptos relacionados a la `Card` "carta".

Esta clase es serializable, lo que permite el almacenamiento y transferencia de datos en formato JSON dentro del objeto. 

## Definicion de la clase

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Models
{
    [System.Serializable]
    public class Card
    {
        public string cardCode;
        public string[] concepts = new string[3];

        public Card(string cardCode, string[] concepts)
        {
            this.cardCode = cardCode;
            this.concepts = concepts;
        }

        public Card()
        {
        }
    }
}
```

## Descripcion de atributos

```csharp
public string cardCode; // (string): Identificador unico de la carta.
```

**`cardCode`**: Identificador unico de la carta.

```csharp
public string[] concepts = new string[3]; // Arreglo de tres conceptos que almacena una carta.
```

**`concepts`**: Arreglo de tres conceptos que almacena una carta.