---
    sidebar_position: 1
---

# Arquitectura

El proyecto está estructurado bajo un sistema centralizado, el cual utiliza como patrón estructural principal el **Event Bus** para facilitar la comunicación entre diferentes componentes y módulos dentro del sistema. Esta arquitectura promueve el desacoplamiento entre las distintas partes del sistema, lo que mejora la escalabilidad y el mantenimiento a largo plazo.

Igualmente, el sistema está dividido en diferentes subsistemas, cada uno de los cuales cumple un rol fundamental en el funcionamiento general. Estos subsistemas interactúan a través del **Event Bus** gracias a la clase principal, permitiendo que los eventos sean emitidos y recibidos de manera eficiente entre ellos. 

(INSERTAR FOTO DE DIAGRAMA)

---




