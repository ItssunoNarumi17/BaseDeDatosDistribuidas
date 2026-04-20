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

   **Modelo ER (MER)**
   
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

2. Una vez teniendo el modelo así, podemos empezar a modelar la *BD* de manera más comoda, entendiendo las relaciones que pueden tener cada una de las entidades en la base de datos.

_______________________________
Nota. Para comodida visual, se trabajo en la versión 8.0 de MySQL Workbench, aclarando algunos puntos:
  -Todo se trabajara mediante sentencias SQL de MySQL (se adjuntaran al reporte).
  -Las creaciones y conexión de las bases de datos son de la forma antes mencionada.
Para esto, también es importante mencionar que se tuvo que tener un poco de conocimiento básico de *Redes* para poder configurar algunas IP`s, ya que la conexión para la *Replicación* se hará mediante un host como Red.
_______________________________

3. Con el modelo, procedemos a nuestro *MySQL*, en el cual por instancia local tendremos que ingresar la contraseña que se configuro al momento de la instalación.

4. Una vez dentro, procedemos a crear nuestra *base de datos*.
   ```sql
   mysql> CREATE DATABASE ICPC_Mexico;
   ```
   
5. Usamos la *base de datos* ya creada.
   ```sql
   mysql> USE ICPC_Mexico;
   ```

6. Ya en la *base de datos*, ingresamos las sentencias *SQL* para crear las tablas.
   ```sql
       mysql>
             CREATE TABLE Equipo (
             id_equipo	   	INT 	       NOT NULL AUTO_INCREMENT,
             nombre_equipo 	VARCHAR(100) NOT NULL,
             id_coach 		  INT 	       NOT NULL,
             id_cocoach 		INT          NOT NULL,
             id_suplente 	  INT          NOT NULL,
             PRIMARY KEY		(id_equipo)
              );

            CREATE TABLE Concursante (
            id_concursante		      INT 	       NOT NULL AUTO_INCREMENT,
            nombre			            VARCHAR(100) NOT NULL,
            a_paterno		           	VARCHAR(100) NOT NULL,
            a_materno			          VARCHAR(100)     NULL,
            correo 			            VARCHAR(100) NOT NULL,
            fecha_inicio_estudios 	DATE 	     NOT NULL,
            fecha_fin_estudios 		  DATE 	     NOT NULL,
            edad 		              	INT 	     NOT NULL,
            id_equipo	 		          INT 	     NOT NULL,
            PRIMARY KEY(id_concursante),
            FOREIGN KEY(id_equipo) REFERENCES Equipo(id_equipo)
            );


            CREATE TABLE Coach (
            id_coach		  INT 	       NOT NULL AUTO_INCREMENT,
            nombre		    VARCHAR(100) NOT NULL,
            a_paterno		  VARCHAR(100) NOT NULL,
            a_materno	   	VARCHAR(100) 	   NULL,
            correo 		    VARCHAR(100) NOT NULL,
            id_equipo	 	  INT 	       NOT NULL,
            PRIMARY KEY(id_coach),
            FOREIGN KEY(id_equipo) REFERENCES Equipo(id_equipo)
            );


            CREATE TABLE Competencia (
            id_competencia 	    INT 	      NOT NULL AUTO_INCREMENT,
            tipo 		            VARCHAR(50) NOT NULL,
            fecha 		          DATE   	    NOT NULL,
            PRIMARY KEY(id_competencia)
            );


            CREATE TABLE Problema (
            id_problema 	      INT         NOT NULL AUTO_INCREMENT,
            nombre 		          CHAR(1),
            descripcion 	      TEXT        NOT NULL,
            id_competencia 	    INT         NOT NULL,
            PRIMARY KEY(id_problema),
            FOREIGN KEY(id_competencia) REFERENCES Competencia(id_competencia)
            );


            CREATE TABLE Ranking (
            id_rank 			    INT NOT NULL AUTO_INCREMENT,
            posicion 			    INT NOT NULL,
            puntaje_fecha 		INT NOT NULL,
            id_equipo	 	    	INT NOT NULL,
            id_competencia 		INT NOT NULL,
            PRIMARY KEY(id_rank),
            FOREIGN KEY(id_equipo) REFERENCES Equipo(id_equipo)
            FOREIGN KEY(id_competencia) REFERENCES Competencia(id_competencia)
            );

   ```

   

