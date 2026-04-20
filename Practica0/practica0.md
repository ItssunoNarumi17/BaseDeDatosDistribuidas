# Práctica 0 – Biblioteca
## Las 12 Reglas de las Bases de Datos Distribuidas (C. J. Date)

- **Asignatura:** Bases de Datos Distribuidas
- **Alumno:** Vladimir Islas Batalla
- **No. Cuenta:** 425289
- **Fecha:** 05 de marzo del 2026

---

## Desarrollo: Las 12 Reglas de Date

A continuación se describen cada una de las reglas, organizadas en una tabla de resumen y luego con una explicación ampliada.

### Tabla resumen

| #  | Regla                          | Descripción breve |
|----|--------------------------------|-------------------|
| 1  | Autonomía local                | Operación de nodos de manera independiente. |
| 2  | No dependencia de un sitio central | No existe un nodo del cual dependa todo el sistema. |
| 3  | Operación continua             | El sistema funciona sin interrupciones planificadas. |
| 4  | Independencia de ubicación     | El usuario ignora la localización física de los datos. |
| 5  | Independencia de fragmentación | El usuario trabaja con tablas completas, aunque sean fragmentos. |
| 6  | Independencia de réplica       | La existencia de copias de datos es invisible para el usuario. |
| 7  | Procesamiento de consultas distribuidas | El sistema optimiza consultas que involucran varios sitios. |
| 8  | Manejo de transacciones distribuidas | Se garantizan las propiedades ACID en operaciones multisitio. |
| 9  | Independencia del hardware     | Puede ejecutarse sobre diferentes plataformas de hardware. |
| 10 | Independencia del sistema operativo | Puede ejecutarse sobre diferentes sistemas operativos. |
| 11 | Independencia de la red        | Puede funcionar con distintos protocolos y topologías. |
| 12 | Independencia del SGBD         | Capacidad de interoperar con otros gestores de bases de datos (heterogeneidad). |

---

### 2.1. Autonomía local

Cada nodo de la red administra de manera independiente sus propios datos. Las consultas y actualizaciones se realizan únicamente en el sitio donde residen, sin intervención de otros nodos.

### 2.2. No dependencia de un sitio central

El sistema no debe basarse en un servidor único para funciones críticas como el diccionario de datos, la concurrencia o la recuperación. Todos los nodos comparten responsabilidades, evitando cuellos de botella y puntos únicos de fallo.

### 2.3. Operación continua

Las tareas de mantenimiento (incorporar o retirar nodos, fragmentar tablas, actualizar software) deben ejecutarse sin detener el servicio. El sistema debe estar disponible de forma permanente.

### 2.4. Independencia de ubicación

El usuario consulta los datos sin necesidad de conocer su localización física. El sistema distribuye y localiza la información de manera transparente.

### 2.5. Independencia de fragmentación

Aunque una tabla pueda dividirse en fragmentos horizontales o verticales y almacenarse en distintos sitios, el usuario la percibe como una sola entidad. El sistema reconstruye los datos automáticamente.

### 2.6. Independencia de réplica

Si existen varias copias de un mismo dato en diferentes nodos, el sistema gestiona las actualizaciones y consultas de forma automática, garantizando coherencia y disponibilidad sin que el usuario note la multiplicidad.

### 2.7. Procesamiento de consultas distribuidas

Cuando una consulta involucra datos de varios nodos, el sistema la optimiza considerando costos de comunicación, capacidad de cada sitio y estrategias de combinación, buscando reducir tiempos de respuesta y tráfico en la red.

### 2.8. Manejo de transacciones distribuidas

Las transacciones que afectan múltiples nodos deben mantener las propiedades ACID de manera global. Para ello se emplean protocolos como el two-phase commit, que aseguran confirmación o cancelación coordinada en todos los sitios.

### 2.9. Independencia del hardware

El sistema debe funcionar en equipos de distintos fabricantes y arquitecturas sin necesidad de modificar las aplicaciones.

### 2.10. Independencia del sistema operativo

Los nodos pueden ejecutar diferentes sistemas operativos (Windows, Linux, macOS) y aun así mantener comunicación y coherencia dentro del sistema distribuido.

### 2.11. Independencia de la red

El sistema debe adaptarse a diversos protocolos y topologías de red (TCP/IP, LAN, WAN, etc.), permitiendo la interacción entre nodos sin importar la infraestructura.

### 2.12. Independencia del SGBD (heterogeneidad)

Un sistema distribuido puede integrar nodos con gestores de bases de datos distintos (Oracle, MySQL, PostgreSQL). El SGBDD actúa como middleware, unificando el acceso y garantizando la consistencia entre plataformas heterogéneas.

---

## Referencias

- Date, C. J. (2001). *Introducción a los sistemas de bases de datos* (7ª ed.). Pearson Educación. (Capítulo 20: Bases de datos distribuidas).

---

## Evidencia 

![Imagen 1](Practica0_1.jpng)

![Imagen 2](Practica0_2.jpng)

