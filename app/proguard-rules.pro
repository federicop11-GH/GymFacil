# Mantener la interfaz JavaScript usada por la web (window.AndroidApp)
-keepclassmembers class com.gymfacil.app.MainActivity$AppBridge {
    @android.webkit.JavascriptInterface <methods>;
}
