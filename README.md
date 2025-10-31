# 🎧 Millennial Z Soundtracks

### *Proyecto Semana 4 - Ironhack Data Analytics Bootcamp*  
**Autores:** Luis Fernández, Nerea Gómez y Andrés Moral  
**Curso:** Data Analytics | Ironhack Madrid  

---

## 📌 Descripción del proyecto

**Millennial Z Soundtracks** es un proyecto de análisis musical que combina datos, emociones y creatividad para entender las tendencias musicales entre los años **2000 y 2020**.  
A partir de datos de **Spotify**, el objetivo fue estudiar la evolución de los artistas, géneros y características musicales más populares durante estas dos décadas, y crear playlists personalizadas para distintos momentos del día según las emociones y energía que transmiten las canciones.

> 🎙️ *“Porque la radio del futuro no se basa solo en gustos, se basa en datos y emociones.”*

---

## 🎯 Objetivos

- Recoger y limpiar datos de Spotify entre 2000 y 2020.  
- Analizar los **artistas** y **canciones** más destacados del periodo.  
- Evaluar la **diversidad de géneros** y su frecuencia de aparición.  
- Estudiar métricas clave como:
  - **Energy:** nivel de intensidad de la canción.
  - **Valence:** grado de positividad o felicidad.
  - **Tempo:** ritmo o velocidad de la canción.
- Crear **playlists temáticas** según las franjas del día:
  - **Mañana ☀️** – Energía alta.
  - **Tarde 💥** – Ritmo rápido y valence alto.
  - **Noche 🌌** – Energía baja para relajarse.

---

## 🗂️ Estructura del repositorio

```
📦 Millennial-Z-Soundtracks
│
├── 📁 data/                  # CSV originales descargados desde Spotify
├── 📁 vscode-vsc/            # CSV tras limpieza y preprocesamiento (listos para SQL)
├── 📁 sql-csv/               # CSV exportados desde SQL tras consultas
│
├── 📄 Creacion_Tablas.sql    # Script SQL para creación de tablas y relaciones
├── 📄 Analisis.sql           # Consultas SQL para análisis y creación de vistas
├── 📄 graficas.ipynb         # Notebook con visualizaciones y conclusiones
├── 📄 Millennial Z Soundtracks (Presentacion).pptx  # Presentación final
└── 📄 README.md              # Este archivo
```

---

## 🧩 Base de datos y modelado

Se utilizó **MySQL** como sistema de gestión de base de datos.  
La base de datos se llamó `spotify` y contiene las siguientes tablas principales:

- **artist** → información de los artistas.  
- **songs** → información general de las canciones (nombre, año, popularidad…).  
- **genres** → clasificación de géneros musicales.  
- **caracteristics** → características numéricas de las canciones (energy, valence, tempo…).

Relaciones implementadas en `Creacion_Tablas.sql`:

```sql
ALTER TABLE songs
ADD FOREIGN KEY (artist_id) REFERENCES artist (artist_id) ON DELETE CASCADE;

ALTER TABLE songs
ADD FOREIGN KEY (genre_id) REFERENCES genres (genre_id) ON DELETE CASCADE;

ALTER TABLE songs
ADD FOREIGN KEY (caracteristicas_id) REFERENCES caracteristics (caracteristicas_id) ON DELETE CASCADE;
```

---

## 📊 Visualizaciones y conclusiones

Archivo: **`graficas.ipynb`**  

### Principales hallazgos:
- **Artistas más presentes:** predominan los grandes nombres del pop y hip hop.  
- **Géneros dominantes:** el **pop** y el **hip hop** lideran las tendencias de las dos décadas.  
- **Tendencias de energía:** la mayoría de canciones tienen energía **media-alta**, ideales para playlists motivacionales.  
- **Relación entre valence y tempo:** las canciones con mayor tempo tienden a tener un valence más alto (más alegres).  

---

## 📻 Programación de playlists (97.5 FM)

| Franja | Criterios SQL | Descripción |
|--------|----------------|-------------|
| **Mañana ☀️** | `energy > 0.7` | Canciones energéticas y positivas para empezar el día. |
| **Tarde 💥** | `tempo > 120 AND valence > 0.6` | Música rápida y alegre para mantenerse activo. |
| **Noche 🌌** | `energy < 0.4 AND valence < 0.5` | Canciones suaves y relajantes para finalizar la jornada. |

---

## 💡 Conclusión

Millennial Z Soundtracks demuestra cómo el análisis de datos puede transformar la música en una experiencia personalizada.  
A través de la exploración de **20 años de tendencias musicales**, hemos diseñado una programación basada en **datos, energía y emociones**, capaz de acompañar a cada oyente durante todo el día.

> 📻 *"Porque los datos también suenan."*

---

## 🧠 Herramientas utilizadas

- **Python** (Pandas, Matplotlib, Seaborn)  
- **MySQL**  
- **Excel / CSV**  
- **Visual Studio Code**  
- **PowerPoint**  

---

## 📸 Presentación

El resumen visual del proyecto se encuentra en el archivo:  
🎞️ `Millennial Z Soundtracks (Presentacion).pptx`

---

## 🏁 Autores

👤 **Luis Fernández** — Análisis de datos y visualizaciones  
👤 **Nerea Gómez** — Storytelling y diseño de presentación  
👤 **Andrés Moral** — Modelado SQL y análisis musical  

---

> *Ironhack Madrid - Data Analytics Bootcamp 2025*
