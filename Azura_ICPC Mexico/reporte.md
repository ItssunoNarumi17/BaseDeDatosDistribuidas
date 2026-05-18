# *Base de Datos Distribuida en Azure - Capa de Software con Python*
_______________________________

📌 **Objetivo.** Implementar una base de datos distribuida en la nube utilizando **Azure Database for MySQL** y desarrollar una capa de software en **Python** con interfaz gráfica que gestione de forma inteligente las operaciones de lectura y escritura, simulando una arquitectura Maestro-Esclavo mediante usuarios con diferentes privilegios.

La información para la *BD* se obtuvo mediante una explicación/plática que se tuvo con el docente simulando un caso real de una consulta para la realización de un *SGBD* donde tomó el rol de un cliente explicando su caso, mientras que nosotros eramos el experto obteniendo información mediante preguntas para poder interpretar lo que él necesita.

![Representación Visual de la Idea del Cliente](Ejemplo.png)

Se siguió esta representación para poder realizar todo lo pertinente para la práctica, adaptándola a una arquitectura distribuida en la nube.

_______________________________

# *Modelo Entidad-Relación (MER)*

Una vez analizado e interpretados los *datos*, procedemos a listar los datos para poder realizar un *modelo ER*.

```mermaid
erDiagram
    Equipo {
        int id_equipo PK
        string nombre_equipo
    }

    Concursante {
        int id_concursante PK
        string nombre
        string a_paterno
        string a_materno
        string correo
        date fecha_inicio_estudios
        date fecha_fin_estudios
        enum rol
        int id_equipo FK
    }

    Coach {
        int id_coach PK
        string nombre
        string a_paterno
        string a_materno
        string correo
        enum rol
        int id_equipo FK
    }

    Competencia {
        int id_competencia PK
        string tipo
        date fecha
    }

    Problema {
        int id_problema PK
        string nombre
        string descripcion
        int id_competencia FK
    }

    Ranking {
        int id_rank PK
        int posicion
        int puntaje_fecha
        int id_equipo FK
        int id_competencia FK
    }

    Equipo ||--o{ Concursante : "tiene"
    Equipo ||--o{ Coach : "dirigido por"
    Equipo ||--o{ Ranking : "participa en"
    Competencia ||--o{ Problema : "incluye"
    Competencia ||--o{ Ranking : "genera"
