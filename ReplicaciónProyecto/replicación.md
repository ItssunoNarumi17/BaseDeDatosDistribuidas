# *Replicación de BD*
_______________________________

📌 Replicación de una base de datos en MySQL 8.0

**Instruccion**. Para este ejercicio se realizo una creación de una base de datos, de la cual se realizo este ejercicio.
Se obtuvo informacion del [*Sitio Oficial de MySQL*](https://dev.mysql.com/doc/refman/8.0/en/replication-configuration.html) 
para la construción de la replicación.

La informacion para la *BD* se obtuvo mediante una explicación/plática que se tuvo con
el docente simulando un caso real de una consulta para la realización de un *SGDB* donde tomó el rol de un cliente explicando su caso, mientras que nosotros eramos el experto obteniendo información mediante preguntaspara poder interpretar lo que el necesita.

![Representación Visual la Idea del Cliente](Ejemplo.png)

Se siguió esta representación para poder realizar todo lo pertinente para la práctica.



# *Replicación*
_______________________________
1. Una vez analizado e interpretados los *datos*, procedemos a listar los datos para poder realizar un *modelo ER*

   **Modelo ER o MER**
   
   ```mermaid
   erDiagram
    Equipo {
        int id_equipo PK
        string nombre_equipo
        int id_coach FK
        int id_cocoach FK
        int id_suplente FK
    }

    Concursante {
        int id_concursante PK
        string nombre
        string a_paterno
        string a_materno
        string correo
        date fecha_inicio_estudios
        date fecha_fin_estudios
        int edad
        int id_equipo FK
    }

    Coach {
        int id_coach PK
        string nombre
        string a_paterno
        string a_materno
        string correo
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
        string teoria
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
   ```
