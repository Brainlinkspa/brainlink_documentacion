---
    sidebar_position: 2
---

# GameEventBus

La clase `GameEventBus` es una implementación genérica de un sistema de bus de eventos, diseñado para gestionar la suscripción, publicación y desuscripción de eventos dentro de un juego. Se utiliza para desacoplar componentes del juego, permitiendo que diferentes partes del código se comuniquen de manera eficiente sin depender directamente unas de otras.

Esto se consigue gracias al uso de `<T>` en la clase `GameEventBus<T>` lo que hace que la clase sea genérica y permita manejar eventos de cualquier tipo de datos. En lugar de crear versiones separadas del bus de eventos para cada tipo de evento, `T` actúa como un marcador de posición para el tipo de datos que se usará, ofreciendo flexibilidad y reusabilidad. Esto garantiza que la clase pueda ser utilizada con diferentes tipos de eventos mientras mantiene la seguridad de tipos y reduce la duplicación de código.

---

## Funciones y metodos

### 

### 

---

## Ejemplos

A continuación se proporcionaran ejemplos de uso referente a otras clases similares.

### Uso de instanciados singulares
```
//Clase singleton
public class ModalManager
{
    public void OpenModal(Type typeInstanceReference){

    }
}

//Clase externa (Por ejemplo un UI)
GameEventBus<ModalManager>.Instance.OpenModal(typeof(GiveScoreUI));
```
