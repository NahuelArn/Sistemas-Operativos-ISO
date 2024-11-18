# tp3

---

### 1. ¿Qué es el Shell Scripting?

**Shell Scripting** es un conjunto de comandos de sistema operativo que se agrupan en un archivo de texto para ser ejecutados en un intérprete de comandos (shell). Los scripts pueden automatizar tareas repetitivas y facilitar la administración del sistema.

**Tipos de tareas**:

- Automatización de tareas del sistema (copia de seguridad, limpieza de archivos).
- Instalación y configuración de software.
- Manipulación de archivos y directorios.
- Ejecución de comandos en secuencia.

**Compilación**: No, los scripts de Shell no necesitan ser compilados. Se ejecutan directamente en el intérprete de comandos. Esto permite una rápida edición y ejecución.

---

### 2. Comandos `echo` y `read`

- **`echo`**: Se utiliza para mostrar mensajes o el contenido de variables en la terminal.
    
    ```bash
    echo "Hola, mundo"
    ```
    
- **`read`**: Permite leer la entrada del usuario desde la terminal y almacenarla en una variable.
    
    ```bash
    read variable
    ```
    

### (a) ¿Cómo se indican los comentarios dentro de un script?

Los comentarios se indican con el símbolo `#`. Todo lo que siga a este símbolo en la línea será ignorado por el intérprete.

```jsx
#comentario

: << 'fin_comentario'
Esto es un comentario general
asdada
asdasda
fin_comentario
```

### (b) ¿Cómo se declaran y se hace referencia a variables dentro de un script?

Las variables se declaran simplemente asignando un valor sin espacios alrededor del `=`:

```bash
variable="valor"
```

Para hacer referencia a la variable, se utiliza el símbolo `$`:

```bash
echo $variable
```

### 3. Crear el script `mostrar.sh`

Aquí tienes el contenido del script corregido:

```jsx
sarasa 
```

### (a) Asignar permisos

Para hacer que el archivo sea ejecutable:

```bash
chmod +x mostrar.sh  #da permisos de ejecucion
chmod -x mostrar.sh #quita permisos de ejecucion
```

### (b) Ejecutar el archivo

Ejecuta el script con:

```bash
#estar en la misma carpeta/directorio
./nombreArchivo.sh
```

### (c) ¿Qué resultado visualiza?

```jsx
sarasa
```

### (d) Sustitución de comandos

Las backquotes (```)  o su equivalente `$()` permiten ejecutar un comando y reemplazarlo por su salida.

### **(e) Modificaciones al script**

```jsx
sarasa
```

### 4. Parametrización

**Acceso a parámetros**: Los parámetros enviados al script se acceden mediante `$1`, `$2`, etc., donde cada número representa un argumento posicional.

- **`$#`**: Número de argumentos pasados al script.
- **`$*`**: Todos los argumentos como una sola cadena.
- **`$?`**: Código de salida del último comando ejecutado (0 significa éxito).
- **`$HOME`**: Ruta del directorio personal del usuario.

### 5. Comando `exit`

La funcionalidad del comando `exit` es salir de un script o de la terminal. Puede recibir un número como parámetro, que se utiliza como código de salida:

- **`exit 0`**: Indica que el script finalizó correctamente.
- **`exit 1`** o cualquier otro número: Indica un error o una finalización no exitosa.

Esto permite a otros programas o scripts saber si se ejecutó correctamente.

### 6. Comando `expr`

El comando `expr` se utiliza para evaluar expresiones aritméticas, de cadenas y lógicas. Aquí están los tipos de operaciones que se pueden realizar:

- **Operaciones aritméticas**:
    - `+` (suma)
    - `-` (resta)
    - `*` (multiplicación)
    - `/` (división)
    - `%` (módulo)

Ejemplo:

```bash
expr 5 + 3  # Resultado: 8
```

- **Operaciones de comparación**:
    - `=` (igual)
    - `!=` (diferente)
    - `<` (menor)
    - `>` (mayor)
    - `<=` (menor o igual)
    - `>=` (mayor o igual)

Ejemplo:

```bash
expr 5 \> 3  # Resultado: 1 (true) sino devuelve 0, si es falsa
```

### 7. Comando `test` y corchetes

El comando `test` evalúa expresiones y devuelve un valor de retorno de verdadero o falso. Las expresiones que se pueden usar incluyen:

- **Evaluación de archivos**:
    - `e` : verdadero si el archivo existe.
    - `f` : verdadero si es un archivo regular.
    - `d` : verdadero si es un directorio.
    - `r` : verdadero si es legible.
    - `w` : verdadero si es escribible.
    - `x` : verdadero si es ejecutable.

Ejemplo:

```bash
if [ -d "$2" ]; then
test -f myfile.txt  # Devuelve true si myfile.txt existe y es un archivo regular
```

- **Evaluación de cadenas**:
    - `=` : verdadero si las cadenas son iguales.
    - `!=` : verdadero si las cadenas son diferentes.
    - `z` : verdadero si la cadena está vacía.
    - `n` : verdadero si la cadena no está vacía.

Ejemplo:

```bash
test "$str1" = "$str2"  # Devuelve true si str1 es igual a str2
```

- **Evaluación numérica**:
    - `eq` : igual.
    - `ne` : diferente.
    - `lt` : menor que.
    - `le` : menor o igual que.
    - `gt` : mayor que.
    - `ge` : mayor o igual que.

### Ejemplo de operadores de comparación:

- **`gt`**: greater than (mayor que)
- **`lt`**: less than (menor que)
- **`ge`**: greater or equal (mayor o igual que)
- **`le`**: less or equal (menor o igual que)
- **`eq`**: equal (igual que)
- **`ne`**: not equal (diferente de)

Ejemplo:

```bash
test 5 -lt 10  # Devuelve true
```

### Resumen:

- Para **cadenas**:
    - Igual: `[[ "$var1" == "$var2" ]]` o `[[ "$var1" = "$var2" ]]`.
    - Distinto: `[[ "$var1" != "$var2" ]]`.
- Para **números**:
    - Igual: `[[ $var1 -eq $var2 ]]`.
    - Distinto: `[[ $var1 -ne $var2 ]]`.

### HERRAMIENTAS

```bash
rmdir nombreCarpeta #elimina un directorio/carpeta
rm nombreARchivo #elimina el archivo
pushd $1 #pushea la ruta actual a la pila y me posiciona en una nueva ruta que le especifico en el argumento
popd #me posiciona en la ruta que estaba pusheada en la pila
```

### 8. Estructuras de control

### `if`

```bash
if [ condición ]; then
    # Comandos si la condición es verdadera
elif [ otra_condición ]; then
    # Comandos si la otra condición es verdadera
else
    # Comandos si ninguna condición es verdadera
fi
```

### `case`

```bash
case variable in
    patrón1)
        # Comandos para patrón1
        ;;
    patrón2)
        # Comandos para patrón2
        ;;
    *)
        # Comandos para cualquier otro patrón
        ;;
esac
```

### `while`

```bash
while [ condición ]; do
    # Comandos a ejecutar mientras la condición sea verdadera
done
```

### `for`

```bash
for variable in lista; do
    # Comandos a ejecutar para cada elemento en la lista
done

for i in {1..10}; do
```

### `select`

```bash
select variable in lista; do
    # Comandos a ejecutar para el elemento seleccionado
done
```

Ejemplardo

EL SELECT SE SELECCIONA CON EL NUMERO, NO CON EL NOMBRE!

```bash
#!/bin/bash

echo "Selecciona una opción:"

select opcion in "Ver archivos" "Mostrar fecha" "Salir";
do
    case $opcion in
        "Ver archivos")
            echo "Mostrando archivos del directorio actual:"
            ls
            ;;
        "Mostrar fecha")
            echo "La fecha y hora actuales son:"
            date
            ;;
        "Salir")
            echo "Saliendo del script..."
            break
            ;;
        *)
            echo "Opción no válida. Inténtalo de nuevo."
            ;;
    esac
done

```

### 9. Sentencias `break` y `continue`

- **`break`**: Se utiliza para salir de un bucle antes de que termine su ejecución. Puede recibir un número como parámetro que especifica cuántos niveles de bucle debe romper (por defecto, 1).

```bash
while true; do
    if [ condición ]; then
        break  # Sale del bucle
    fi
done
```

- **`continue`**: Se utiliza para omitir el resto del código en la iteración actual del bucle y continuar con la siguiente iteración. También puede recibir un número como parámetro que especifica cuántos niveles de bucle debe continuar (por defecto, 1).

```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        continue  # Omite el resto del código y pasa a la siguiente iteración
    fi
    echo $i
done
```

### 10. Tipos de variables y arreglos

### Tipos de variables en Bash:

Bash no es un lenguaje fuertemente tipado, lo que significa que no necesitas declarar el tipo de una variable al definirla. Simplemente puedes asignar un valor y Bash inferirá el tipo.

**Tipos comunes de variables:**

- **Variables escalares**: Son las variables más simples. Pueden contener cadenas, números, etc.
    
    ```bash
    nombre="Manuel"
    edad=30
    ```
    
- **Arreglos**: Bash permite definir arreglos, que son colecciones de valores. Los índices de los arreglos empiezan en 0.
    
    ```bash
    frutas=("manzana" "naranja" "plátano")
    ```
    

### Definición y acceso a arreglos:

- Para acceder a un elemento de un arreglo:
    
    ```bash
    echo ${frutas[1]}  # Imprime "naranja"
    ```
    
- Para recorrer un arreglo:
    
    ```bash
    for fruta in "${frutas[@]}"; do
      echo $fruta
    done
    ```
    

### 11. Definición de funciones

### Definición de funciones:

Sí, puedes definir funciones dentro de un script en Bash. La sintaxis es la siguiente:

```bash
nombre_funcion() {
  # Cuerpo de la función
  echo "Hola desde la función"
}
```

### Llamar a una función:

Simplemente escribe el nombre de la función:

```bash
nombre_funcion
```

Pasaje de parámetros:

Puedes pasar parámetros a las funciones, y dentro de la función, puedes acceder a ellos usando `$1`, `$2`, etc., para los argumentos posicionales. También puedes usar `$@` para acceder a todos los argumentos.

**Ejemplo de función con parámetros:**

```bash
saludar() "Hola, $1!"  # $1 es el primer argumento
}

saludar "Pepe"  # Llama a la función con el argumento "Nahuel"

```

### Resumen de parámetros:

- `$1`, `$2`, ...: Primer, segundo, etc. argumento.
- `$@`: Todos los argumentos.
- `$#`: Número de argumentos pasados.

El comando `cut` en Unix/Linux es utilizado para extraer secciones de cada línea de un archivo o entrada estándar, basado en posiciones, delimitadores o campos.

### Principales parámetros de `cut`:

1. **`f`**: Especifica los campos que se quieren extraer.
    - Se usa junto con el parámetro `d` (delimitador).
    - Ejemplo: `cut -f1,3 -d, archivo.txt`
        - Extrae los campos 1 y 3 del archivo `archivo.txt`, usando la coma como delimitador.
2. **`d`**: Especifica el delimitador de campos.
    - Por defecto, el delimitador es el tabulador (`\t`), pero puedes especificar otro.
    - Ejemplo: `cut -f2 -d: archivo.txt`
        - Extrae el segundo campo de un archivo donde los campos están separados por `:`.
3. **`c`**: Extrae una o más columnas basadas en la posición de los caracteres.
    - Ejemplo: `cut -c1-5 archivo.txt`
        - Extrae los primeros 5 caracteres de cada línea del archivo `archivo.txt`.
4. **`-complement`**: Selecciona todos los campos/caracteres excepto los especificados.
    - Ejemplo: `cut -f2 --complement -d, archivo.txt`
        - Extrae todos los campos excepto el segundo en un archivo delimitado por comas.
5. **`b`**: Extrae un rango específico de bytes de cada línea.
    - Ejemplo: `cut -b1-10 archivo.txt`
        - Extrae los primeros 10 bytes de cada línea del archivo.
6. **`s`**: Omite líneas que no contienen el delimitador especificado.
    - Ejemplo: `cut -f2 -d: -s archivo.txt`
        - No procesará las líneas que no contengan el delimitador `:`.

### Ejemplos prácticos:

1. **Extraer un campo específico de un archivo delimitado por comas**:
    
    ```bash
    cut -f1 -d, archivo.csv
    ```
    
    Esto extrae el primer campo de cada línea de `archivo.csv`, donde los campos están separados por comas.
    
2. **Extraer un rango de caracteres de un archivo**:
    
    ```bash
    cut -c5-10 archivo.txt
    ```
    
    Esto extrae los caracteres de la posición 5 a la 10 de cada línea de `archivo.txt`.
    
3. **Extraer los primeros 3 bytes de un archivo**:
    
    ```bash
    cut -b1-3 archivo.txt
    ```
    
    Esto extrae los primeros 3 bytes de cada línea.
    
4. **Combinar con otros comandos**:
    - Para combinar con `echo` y procesar la salida:Esto extrae el segundo campo de la cadena delimitada por comas.
        
        ```bash
        echo "uno,dos,tres" | cut -d, -f2
        dos
        ```
        

### Ejemplo con salida estándar (pipeline):

```bash
ps aux | cut -c1-10
```

Esto muestra los primeros 10 caracteres de la salida del comando `ps aux`.

### Resumen:

El comando `cut` es útil para procesar y extraer partes específicas de líneas en archivos o la salida de otros comandos, basado en campos, delimitadores o posiciones de caracteres/bytes.

El operador `>` en Bash (y en muchos otros shells) se utiliza para redirigir la **salida estándar** (stdout) de un comando a un archivo. Esto significa que, en lugar de mostrar el resultado en la pantalla, el contenido se guarda en el archivo especificado.

### Ejemplos:

1. **Sobrescribir un archivo:**
    
    ```bash
    echo "Hola, Mundo" > archivo.txt
    ```
    
    - Este comando escribe "Hola, Mundo" en el archivo `archivo.txt`.
    - Si el archivo `archivo.txt` ya existe, su contenido será **sobrescrito** (reemplazado) por el nuevo contenido.
    - Si el archivo no existe, se creará uno nuevo.
2. **Redirigir la salida de un comando a un archivo:**
    
    ```bash
    ls > listado.txt
    ```
    
    - Este comando ejecuta `ls` (que lista archivos y carpetas) y guarda la salida en un archivo llamado `listado.txt`.
    - Nuevamente, si `listado.txt` ya existía, será sobrescrito.
3. **Agregar contenido a un archivo (usando `>>`):**
    
    Si no quieres sobrescribir el archivo, sino **agregar** contenido al final del archivo, puedes usar `>>` en lugar de `>`:
    
    ```bash
    echo "Nueva línea" >> archivo.txt
    ```
    
    - Esto agregará "Nueva línea" al final de `archivo.txt` sin borrar lo que ya contiene.

### Resumen:

- `>`: Sobrescribe el archivo (si existe) o lo crea (si no existe) y guarda la salida del comando en él.
- `>>`: Agrega la salida del comando al final del archivo, sin borrar el contenido existente.

## CUT

---

```bash
usuarios=$(cut -d: -f1 /etc/passwd)
```

### Desglose:

1. **`cut`**:
    - Es un comando de Unix que permite "cortar" partes de líneas en un archivo o en la entrada estándar. Se usa comúnmente para seleccionar campos o columnas de un archivo.
2. **`d:`**:
    - El parámetro `d:` especifica el delimitador. En este caso, `:` (dos puntos) es el delimitador de los campos. En el archivo `/etc/passwd`, los campos de cada línea están separados por dos puntos (`:`).
3. **`f1`**:
    - El parámetro `f1` indica que se seleccionará el primer campo de cada línea del archivo. El archivo `/etc/passwd` tiene información de los usuarios del sistema, y el primer campo es el nombre de usuario.
4. **`/etc/passwd`**:
    - Es un archivo del sistema que contiene información básica sobre los usuarios registrados en el sistema. Cada línea del archivo representa un usuario y contiene varios campos separados por `:`. El primer campo es el nombre de usuario, el segundo campo la contraseña (encriptada o un indicador de dónde está), el tercero es el UID (User ID), entre otros.
5. **`usuarios=$(...)`**:
    - La expresión `$(...)` ejecuta el comando que está dentro de los paréntesis y almacena el resultado en una variable. En este caso, la variable `usuarios` contendrá todos los nombres de usuarios del sistema que están definidos en el archivo `/etc/passwd`.

### Resultado:

Después de ejecutar esta línea, la variable `usuarios` contendrá una lista con los nombres de todos los usuarios del sistema, extraídos del archivo `/etc/passwd`.

Por ejemplo, si el archivo `/etc/passwd` tiene el siguiente contenido (simplificado):

```ruby
root:x:0:0:root:/root:/bin/bash
nahuel:x:1000:1000:Nahuel,,,:/home/nahuel:/bin/bash
user:x:1001:1001:User,,,:/home/user:/bin/bash

```

El comando `cut -d: -f1 /etc/passwd` devolverá:

```sql
root
nahuel
user
```

### Ayudin RESUMEN DEL RESUMEN

---

- `>`: Sobrescribe el archivo (si existe) o lo crea (si no existe) y guarda la salida del comando en él.
- `>>`: Agrega la salida del comando al final del archivo, sin borrar el contenido existente.

```bash
cat nombreArchivo.txt #imprime el contenido
rm nombreArchivo.txt #borra el archiv
rmdir nombreDirectorio #borra el directorio/carpeta
```

Who: te dice los usuarios que estan conectados

whoami: el usuario que esta ejecutando el 

### Resumen sobre el uso de `[ ]`, `[[ ]]` y cuándo no usarlos en Bash

En Bash, los diferentes tipos de comparaciones y evaluaciones pueden realizarse usando:

- **Comandos** (sin `[ ]` ni `[[ ]]`)
- **Corchetes simples `[ ]`** (para expresiones simples)
- **Corchetes dobles `[[ ]]`** (para expresiones más complejas, con mejoras en comparación de cadenas y soporte de expresiones regulares)

### 1. **Sin `[ ]` ni `[[ ]]` (Comandos)**

Cuando el `if` evalúa el **estado de salida** de un comando, no se necesitan `[ ]` ni `[[ ]]`. Un comando tiene éxito si su estado de salida es 0 (éxito) y falla si es distinto de 0.

### Ejemplo:

```bash
if grep -q "palabra" archivo.txt; then
    echo "Se encontró la palabra"
else
    echo "No se encontró la palabra"
fi
```

En este caso, `grep -q` retorna 0 si encuentra la palabra, y 1 si no la encuentra. No es necesario usar `[ ]` ni `[[ ]]`.

### 2. **Corchetes simples `[ ]`**

Usa `[ ]` (también llamado `test`) para **comparaciones simples** de cadenas, números, archivos y expresiones lógicas. Debes asegurarte de dejar **espacios** entre los elementos (los operadores y sus operandos).

### Ejemplos:

- **Comparación de cadenas**:
    
    ```bash
    if [ "$var1" = "valor" ]; then
        echo "Las cadenas son iguales"
    fi
    ```
    
    Nota: En Bash, `=` es el operador para comparar cadenas.
    
- **Comparación de números**:
    
    ```bash
    if [ "$num1" -eq "$num2" ]; then
        echo "Los números son iguales"
    fi
    ```
    
    Nota: Los operadores para números son diferentes a los de cadenas, como `-eq`, `-lt`, `-gt`.
    
- **Verificación de existencia de archivos**:
    
    ```bash
    if [ -f "archivo.txt" ]; then
        echo "El archivo existe"
    fi
    ```
    
- **Expresiones lógicas** (combinando varias condiciones):
    
    ```bash
    if [ "$num1" -gt 10 ] && [ "$num2" -lt 20 ]; then
        echo "Ambas condiciones son verdaderas"
    fi
    ```
    

### 3. **Corchetes dobles `[[ ]]`**

`[[ ]]` es una mejora sobre `[ ]`, con soporte para:

- Comparaciones de cadenas más avanzadas.
- Uso de operadores lógicos más directos (`&&` y `||`).
- Soporte de **expresiones regulares** y **comodines**.
- Es más seguro en comparación de cadenas, ya que no requiere comillas en variables vacías (no da errores como en `[ ]`).

### Ejemplos:

- **Comparación de cadenas** (más segura que `[ ]`):
    
    ```bash
    if [[ "$var1" == "valor" ]]; then
        echo "Las cadenas son iguales"
    fi
    ```
    
    Nota: Se puede usar `==` para comparar cadenas (aunque `=` también funciona).
    
- **Expresiones regulares**:
    
    ```bash
    if [[ "$var1" =~ ^[a-zA-Z]+$ ]]; then
        echo "La cadena contiene solo letras"
    fi
    ```
    
    Nota: `[[ ]]` permite el uso de `=~` para expresiones regulares.
    
- **Uso de operadores lógicos**:
    
    ```bash
    if [[ "$num1" -gt 10 && "$num2" -lt 20 ]]; then
        echo "Ambas condiciones son verdaderas"
    fi
    ```
    
    Nota: Aquí puedes usar `&&` y `||` directamente, lo cual es más legible que en `[ ]`, donde debes escribir `-a` y `-o`.
    
- **Comparación de archivos** (funciona igual que en `[ ]`):
    
    ```bash
    if [[ -f "archivo.txt" ]]; then
        echo "El archivo existe"
    fi
    ```
    

### Resumen de operadores:

### En `[ ]`:

- **Cadenas**: `=` o `!=`
    
    ```bash
    [ "$var1" = "cadena" ]
    ```
    
- **Números**:
    - `eq` (igual), `ne` (diferente), `gt` (mayor), `lt` (menor), `ge` (mayor o igual), `le` (menor o igual)
    
    ```bash
    [ "$num1" -eq 5 ]
    ```
    
- **Archivos**:
    - `f` (archivo regular), `d` (directorio), `e` (existe), `r` (lectura), `w` (escritura), `x` (ejecución)
    
    ```bash
    [ -f "archivo.txt" ]
    ```
    
- **Lógicos**:
    - `a` (AND), `o` (OR), `!` (NOT)
    
    ```bash
    [ "$num1" -gt 10 -a "$num2" -lt 20 ]
    ```
    

### En `[[ ]]`:

- **Cadenas**: `==`, `!=`, `=~` (para expresiones regulares)
    
    ```bash
    [[ "$var1" == "cadena" ]]
    [[ "$var1" =~ ^[a-z]+$ ]]
    ```
    
- **Números**: Igual que en `[ ]` (`eq`, `ne`, etc.)
- **Archivos**: Igual que en `[ ]`
- **Lógicos**: `&&` (AND), `||` (OR), `!` (NOT)
    
    ```bash
    [[ "$num1" -gt 10 && "$num2" -lt 20 ]]
    ```
    

### Conclusión:

- **Sin `[ ]`**: Úsalo cuando evalúas el estado de salida de un comando (ej.: `grep`, `ping`, `who`).
- **Con `[ ]`**: Úsalo para comparaciones simples de cadenas, números, y condiciones lógicas (con operadores como `eq`, `a`).
- **Con `[[ ]]`**: Úsalo para comparaciones más avanzadas de cadenas, expresiones regulares, o cuando necesitas lógica más compleja (y seguridad adicional).

---

### 1. **Propósito**

- **`grep`**:
    - Es una herramienta para buscar texto dentro de archivos. Se utiliza para buscar patrones específicos en el contenido de archivos, usando expresiones regulares.
    - Ejemplo: `grep "texto" archivo.txt` busca todas las líneas en `archivo.txt` que contienen la palabra "texto".
- **`find`**:
    - Se utiliza para buscar archivos y directorios dentro de un sistema de archivos según criterios específicos, como nombre, tipo, tamaño, fecha de modificación, etc.
    - Ejemplo: `find /ruta/del/directorio -name "*.txt"` busca todos los archivos con extensión `.txt` en el directorio especificado.

### 2. **Uso**

- **`grep`**:
    - Generalmente se usa con archivos de texto y puede combinarse con otros comandos usando tuberías (`|`).
    - Permite opciones como `i` (ignorar mayúsculas/minúsculas), `r` (buscar recursivamente), `v` (invertir la búsqueda), entre otras.
- **`find`**:
    - Se usa principalmente para localizar archivos y directorios en el sistema de archivos.
    - Puede ejecutar acciones sobre los archivos encontrados (como eliminar, mover, copiar) usando `exec`.
    - Permite opciones como `type` (especificar el tipo de archivo), `mtime` (modificación del tiempo), `size`, entre otras.

### 3. **Ejemplos de uso**

- **Ejemplo de `grep`**:
    
    ```bash
    grep "error" /var/log/syslo
    ```
    
    Este comando busca la palabra "error" en el archivo de registro `syslog`.
    
- **Ejemplo de `find`**:
    
    ```bash
    find /home/usuario -type f -name "*.jpg"
    ```
    
    Este comando busca todos los archivos con extensión `.jpg` en el directorio `/home/usuario`.
    

### Resumen

- Usa **`grep`** cuando necesites buscar contenido dentro de archivos.
- Usa **`find`** cuando necesites buscar archivos o directorios en el sistema de archivos según diferentes criterios.