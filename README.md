# GymFácil — App Android de rutinas de gimnasio

App en español con rutinas para **hombre** y **mujer** (principiante, intermedio y avanzado). Cada ejercicio trae **video en español**, **series**, **repeticiones**, **descanso**, pasos de técnica, errores comunes y un consejo.

## Qué incluye

- 6 rutinas (3 para hombre, 3 para mujer) con 2 a 4 días cada una.
- 35 ejercicios con video de YouTube en español, que se ve dentro de la app.
- **Modo entrenamiento**: marcás cada serie y el **descanso se cronometra solo** (sonido + vibración al terminar, +15 s / −15 s / saltar).
- Ejercicios por tiempo (plancha) con cuenta regresiva.
- Registro del **peso usado** por ejercicio (se recuerda para la próxima vez).
- Historial, semana actual y consejos de progresión.
- La pantalla se mantiene encendida mientras entrenás. El botón **atrás** de Android navega dentro de la app.

## Opción A — Compilar el APK con Android Studio

1. Instalá [Android Studio](https://developer.android.com/studio) (versión Ladybug 2024.2 o más nueva).
2. **File › Open** y elegí la carpeta `GymFacil`. Esperá a que termine el "Gradle sync" (descarga lo necesario la primera vez).
3. Para probar: conectá tu celular con la *Depuración USB* activada y tocá **Run ▶**.
4. Para generar el instalador: **Build › Build App Bundle(s) / APK(s) › Build APK(s)**.
   El archivo queda en `app/build/outputs/apk/debug/app-debug.apk`. Copialo al celular e instalalo (hay que permitir "instalar apps de origen desconocido").

## Opción B — Compilar sin instalar nada (GitHub)

1. Subí la carpeta a un repositorio de GitHub.
2. El flujo `.github/workflows/build-apk.yml` compila solo en cada *push*.
3. En la pestaña **Actions** › última ejecución › **Artifacts** › descargá `GymFacil-apk`.

## Cómo modificar rutinas o ejercicios

Todo el contenido está en `app/src/main/assets/www/index.html`, al comienzo del `<script>`:

- `EX` = ejercicios. `v` es el ID del video de YouTube (lo que va después de `watch?v=`).
- `ROUTINES` = rutinas. Cada ejercicio de un día es `["id_ejercicio", series, "repeticiones", descanso_en_segundos]`.
  Ejemplo: `["sentadilla", 4, "8-10", 120]`. Para ejercicios por tiempo usá `"30 s"`.

Después de editar, volvé a compilar.

## Detalles técnicos

- Kotlin, `minSdk 26` (Android 8.0+), `targetSdk 35`.
- La interfaz se sirve con `WebViewAssetLoader` desde `https://appassets.androidplatform.net`, así los videos de YouTube pueden embeberse dentro de la app. Si un video no carga embebido, el enlace "Abrir en YouTube" lo abre en la app de YouTube.
- Puente nativo `window.AndroidApp`: `keepScreenOn(boolean)` y `vibrate(ms)`.
- Requiere Internet solo para ver los videos; rutinas, cronómetro e historial funcionan sin conexión.
- Para publicar en Google Play: cambiá `applicationId`, configurá tu firma de release y generá un **App Bundle (.aab)**.

> Los videos pertenecen a sus autores en YouTube; la app solo los enlaza. Consultá a un profesional antes de empezar un plan de entrenamiento.
