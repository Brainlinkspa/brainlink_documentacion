---
id: Concept
title: Concept
sidebar_position: 5
---

## Descripcion

`Concept` representa un concepto dentro del juego.

## Definicion de la clase

```csharp
namespace Modes.Normal
{
    public class Concept
    {
        public string idConcept;
        public string name;

        public TypeConcept typeConcept = TypeConcept.CONCEPT;

        public Concept(string idConcept, string name, TypeConcept typeConcept)
        {
            this.idConcept = idConcept;
            this.name = name;
            this.typeConcept = typeConcept;
        }
    }
}
```

## Descripcion de atributos

```csharp
public string idConcept; 
```

**`idConcept`**: Es el id unico de un concepto, adicionalmente posee el tipo de concepto (Bridge = 0, Concept = 1)

```csharp
public string name; 
```

**`name`**: Nombre del concepto.

```csharp
public TypeConcept typeConcept = TypeConcept.CONCEPT; 
```

**`typeConcept`**: Enumeracion tipo `enum` que tienen los distintos conceptos: (Bridge = 0, Concept = 1)  