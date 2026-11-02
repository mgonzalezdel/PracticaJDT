# Práctica de Bases de Datos de Grafos: Juego de Tronos (Neo4j)

Resumen del trabajo realizado en una base de datos de Neo4j para resolver la práctica de Big Data Aplicado sobre el universo de Juego de Tronos, y explicación sencilla de se han preparado los datos, los pequeños cambios que se han tenido que hacer para que todo funcione y qué ejercicios se han podido resolver.

---

## 1. ¿Cómo hemos importado los datos?
* **Descarga local:** En lugar de leer los archivos directamente desde internet, se descargan todos los archivos CSV oficiales a una carpeta local llamada `import`.
* **Rutas locales (`file:///`):** Se actualiza los scripts de carga para que Neo4j lea los datos directamente de esa carpeta local.

---

## 2. Cambios en los scripts del profesor
Durante el proceso, se han tenido que adaptar los scripts originales (`JuegoTronos02` y `JuegoTronos03`) con dos objetivos principales:
1. **Apuntar a los archivos locales:** Cambiar las direcciones de internet por la ruta local de nuestros CSV descargados.
2. **Ajustar nombres de relaciones y propiedades:** Por ejemplo, en el script original las apariciones en episodios se guardaban como `APPEARS_IN` en lugar de `APPEARS_IN`, y algunos números de episodio usaban nombres ligeramente distintos. Adaptar esto permitió que los datos conectasen correctamente en el grafo.

---

## 3. ¿Por qué algunos ejercicios no se pueden hacer?
Al revisar en detalle los archivos CSV, se descubre que **faltan datos en origen** para ciertos apartados de la práctica. Como una base de datos de grafos solo puede conectar lo que existe, los ejercicios que pedían información sobre géneros de personajes, muertes exactas (`KILLED`), ubicaciones de las casas o matrimonios no se pueden calcular. 

En los scripts de entrega se dejan estos ejercicios marcados e indicados claramente para explicar que no hay información suficiente en los archivos base para resolverlos.

---

## 4. ¿Cómo visualizamos los resultados?
Para que la experiencia en el navegador de Neo4j sea lo más cómoda posible y no se sature la pantalla con listas gigantes de texto, las consultas de dividen en dos tipos:
* **En forma de Grafo (`RETURN p`):** Para los ejercicios de parentescos, familias o caminos cortos (como buscar sobrinos o líneas de sangre), se devuelve la ruta completa para ver el dibujo de las conexiones de forma visual.
* **En forma de Tabla:** Para los ejercicios que piden hacer cálculos (como contar cuántos participantes hay o buscar un Top 5), se utilizan tablas limpias y ordenadas para que los resultados se entiendan a la primera.