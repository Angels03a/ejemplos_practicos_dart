// FACTORY METHOD 
// Ejemplo: Sistema de logística con tipos de transporte

// 1. PRODUCT (Interfaz/Clase Abstracta)
//Solo conoce que tiene un método

abstract class Transporte {
  void entregar(String destino);
}


// 2. CONCRETE PRODUCTS
//Emplean e
class Camion implements Transporte {
  @override
  void entregar(String destino) {
    print('Camion: Entregando por carretera a $destino');
  }
}

class Barco implements Transporte {
  @override
  void entregar(String destino) {
    print('Barco: Navegando hacia el puerto de $destino');
  }
}

class Avion implements Transporte {
  @override
  void entregar(String destino) {
    print('Avion: Enviando por flete aereo a $destino');
  }
}


// 3. CREATOR (Clase Abstracta con el Método Fábrica)

abstract class Logistica {
  // El MÉTODO FÁBRICA — abstracto, las subclases lo implementan
  Transporte crearTransporte();

  // Lógica de negocio que USA el producto (sin saber cuál es)
  void planificarEntrega(String destino) {
    // Llama al método fábrica para obtener el transporte
    Transporte transporte = crearTransporte();

    print('Planificando entrega a $destino');
    transporte.entregar(destino);
    print('Entrega planificada exitosamente\n');
  }
}


// 4. CONCRETE CREATORS

class LogisticaTerrestre extends Logistica {
  @override
  Transporte crearTransporte() {
    return Camion(); // Crea un Camión
  }
}

class LogisticaMaritima extends Logistica {
  @override
  Transporte crearTransporte() {
    return Barco(); // Crea un Barco
  }
}

class LogisticaAerea extends Logistica {
  @override
  Transporte crearTransporte() {
    return Avion();
  }
}


// main()
void main() {
  print('FACTORY METHOD');


  // El cliente trabaja con Creator, no con ConcreteProduct
  Logistica logistica;

  logistica = LogisticaTerrestre();
  logistica.planificarEntrega('Guadalajara');

  // Usamos logística marítima
  logistica = LogisticaMaritima();
  logistica.planificarEntrega('Veracruz');

  logistica = LogisticaAerea();
  logistica.planificarEntrega('Ciudad de México');
}