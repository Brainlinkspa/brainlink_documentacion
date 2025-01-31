---
id: Score
title: Score
sidebar_position: 7
---

## Descripcion

`Score` representa un puntaje.

## Definicion de la clase

```csharp
namespace Modes.Normal
{
    public class Score
    {

        public string idScore; //Id de la carta, con el numero del concepto y el tipo de concepto EJ : GF_1_1_PUENTE
        public TypeScore typeCard;
        public int score;

        public Score(string idScore, TypeScore typeCard, int score)
        {
            this.idScore = idScore;
            this.typeCard = typeCard;
            this.score = score;
        }

    }
}
```

```csharp
public string idScore;
```

**`idScore`**:  Identificador unico de la puntuacion.


```csharp
public TypeScore typeCard;
```

**`typeCard`**: Tipo de carta a la que pertenece la puntuacion

```csharp
public int score;
```

**`score`**: Representa la cantidad de puntos obtenidos.