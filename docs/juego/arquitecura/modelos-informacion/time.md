---
id: Time
title: Time
sidebar_position: 6
---

## Descripcion

`Time` representa el tiempo para realizar exposiciones.

## Definicion de la clase

```csharp
namespace Modes.Normal
{
    public class Time
    {
        public string idTime; //Id de la carta, con el numero del concepto y el tipo de concepto EJ : GF_1_1_PUENTE
        public TypeConcept typeCard;
        public float time;

        public Time (string idTime, TypeConcept typeCard, float time){
            this.idTime = idTime;
            this.typeCard = typeCard;
            this.time = time;
        }

        public Time()
        {
        }

    }
}
```

## Descripcion de atributos

```csharp
public string idTime; 
```

**`idTime`**: Identificador de tiempo unico para cada exposicion


```csharp
public TypeConcept typeCard;
```

**`typeCard`**: Tipo de carta definido por `enum`

```csharp
public float time;
```

**`time`**: Almacena el tiempo registrado en segundos.