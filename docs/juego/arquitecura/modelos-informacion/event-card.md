---
id: Event-card
title: Event-card
---


## Descripcion

`EventCard` es una carta de evento, esta carta posee un identificador unico, un tipo de evento y su descripcion.

## Definicion de la clase

```csharp
using System.Collections.Generic;
using Enums;

namespace Models
{
    [System.Serializable]
    public class EventCard
    {
        //Variables
        public string idEventCard;
        public TypeEventCard typeEventCard; //Enumeración para tipo de carta
        public string description;

        //Constructores
        public EventCard(string idEventCard, TypeEventCard typeEventCard, string description)
        {
            this.idEventCard = idEventCard;
            this.typeEventCard = typeEventCard;
            this.description = description;
        } 

        public EventCard()
        {

        }
    }
}
```

## Descripcion de atributos

```csharp
public string idEventCard; //Almacena id unico para cada carta de evento.
```

**`idEventCard`**: Almacena id unico para cada carta de evento.

```csharp
public TypeEventCard typeEventCard; //Indica el tipo de carta de evento.
```

**`typeEventCard`**: Indica el tipo de carta de evento.

```csharp
public string description;  //Contiene la descripcion textual del efecto de la carta de evento.
```

**`description`**: Contiene la descripcion textual del efecto de la carta de evento