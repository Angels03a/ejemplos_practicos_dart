// ADAPTER — Implementación en Dart
// Ejemplo: Reproductor de música con formatos distintos


// 1. INTERFAZ DEL CLIENTE
abstract class ReproductorMusica {
  void reproducir(String archivo);
  void pausar();
  void detener();
}

// 2. CLASE CLIENTE (ya funciona bien)
class ReproductorMP3 implements ReproductorMusica {
  @override
  void reproducir(String archivo) {
    print('MP3 Player: Reproduciendo $archivo');
  }

  @override
  void pausar() {
    print('MP3 Player: Pausado');
  }

  @override
  void detener() {
    print('MP3 Player: Detenido');
  }
}

// ------------------------------------------------------------
// 3. SERVICIO INCOMPATIBLE (clase de terceros / heredada)
class ReproductorAvanzado {
  void reproducirArchivo(String rutaArchivo, String formato) {
    print('Reproductor Avanzado: Cargando $rutaArchivo en formato $formato');
    print('[Decodificando audio de alta calidad...]');
    print('Reproduciendo...');
  }

  void configurarCalidad(int bitrate) {
    print('Reproductor Avanzado: Calidad configurada a $bitrate kbps');
  }

  void pararReproduccion() {
    print('Reproductor Avanzado: Reproducción detenida (método diferente)');
  }

  void suspenderReproduccion() {
    print('Reproductor Avanzado: Suspendido (método diferente)');
  }
}

// 4. ADAPTADOR
//    Implementa la interfaz que el cliente espera
//    Traduce las llamadas al Servicio incompatible
class AdaptadorReproductor implements ReproductorMusica {
  // Referencia al servicio con interfaz incompatible (COMPOSICIÓN)
  final ReproductorAvanzado _servicio;

  AdaptadorReproductor(this._servicio);

  @override
  void reproducir(String archivo) {
    String formato = _detectarFormato(archivo);
    _servicio.configurarCalidad(320);    
    _servicio.reproducirArchivo(archivo, formato);
  }

  @override
  void pausar() {
    _servicio.suspenderReproduccion();
  }

  @override
  void detener() {
    _servicio.pararReproduccion();    
  }

  // Método privado auxiliar del adaptador
  String _detectarFormato(String archivo) {
    if (archivo.endsWith('.flac')) return 'FLAC';
    if (archivo.endsWith('.wav'))  return 'WAV';
    if (archivo.endsWith('.ogg'))  return 'OGG';
    return 'MP3';
  }
}

// ------------------------------------------------------------
// 5. CLIENTE — SistemaDeAudio
//    Solo conoce la interfaz ReproductorMusica
class SistemaDeAudio {
  void usarReproductor(ReproductorMusica reproductor, String archivo) {
    print('--- Sistema de Audio ---');
    reproductor.reproducir(archivo);
    reproductor.pausar();
    reproductor.detener();
    print('');
  }
}

// 6.main
void main() {
  print('-------------ADAPTER — Demo ----------');

  final sistema = SistemaDeAudio();

  // Caso 1: Usando ReproductorMP3
  print('[ Reproductor MP3 — Compatible directo ]');
  final mp3 = ReproductorMP3();
  sistema.usarReproductor(mp3, 'cancion.mp3');

  // Caso 2: Usando ReproductorAvanzado a través del Adaptador
  print('[ Reproductor Avanzado — A través del Adaptador ]');
  final avanzado   = ReproductorAvanzado();
  final adaptador  = AdaptadorReproductor(avanzado);
  sistema.usarReproductor(adaptador, 'cancion_hifi.flac');
}