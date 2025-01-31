---
id: Player
title: Player
sidebar_position: 4
---

## Descripcion

`Player` representa al jugador en el contexto del juego.

## Definicion de la clase

```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Models {
    [System.Serializable]
    public class Player 
    {
        public string idPlayer;
        public string name;



        //CONSTRUCTORES
        public Player(string idPlayer, string name)
        {
            this.idPlayer = idPlayer;
            this.name = name;
        }

        public Player()
        {

        }


    }

}
```

## Descripcion de atributos

```csharp
public string idPlayer; //Almacena el id unico de cada jugador.
```

**`idPlayer`**: Almacena el id unico de cada jugador.

```csharp
public string name; //Almacena el nombre del jugador.
```

**`name`**: Almacena el nombre del jugador.