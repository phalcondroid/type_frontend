# Tyba flutter test

Este proyecto describe la arquitectura, librerias y estructura en general que se usó para desarrollar la prueba.

https://user-images.githubusercontent.com/13957703/177288906-2a8097ec-bf81-40b4-a49d-f1aba760bde1.mp4

# Secciones

### Login

![Simulator Screen Shot - iPhone 13 - 2022-07-05 at 04 11 11](https://user-images.githubusercontent.com/13957703/177293916-8d22a43e-6730-4f11-8c68-8e9b3db45691.png)

### Registro

![Simulator Screen Shot - iPhone 13 - 2022-07-05 at 04 11 20](https://user-images.githubusercontent.com/13957703/177293962-070678a5-7dbe-4286-8ed0-ffba40675653.png)

### Lista de restaurantes por ciudad

![Simulator Screen Shot - iPhone 13 - 2022-07-05 at 04 12 00](https://user-images.githubusercontent.com/13957703/177294013-1a4f14e2-6132-41c5-a2d1-93f76ceb5082.png)

# Arquitectura

Se utilizo `clean architecture` para orginizar la estructura y arquitectura de la aplicación.

<img width="315" alt="Screen Shot 2022-07-05 at 3 54 30 AM" src="https://user-images.githubusercontent.com/13957703/177290157-16e4b090-1f10-42f9-ac03-41f1072979f8.png">

### Organización de componentes

El `core` son componentes y archivos comunes entre dominios de la aplicación.

<img width="322" alt="Screen Shot 2022-07-05 at 3 51 47 AM" src="https://user-images.githubusercontent.com/13957703/177289594-1a327896-fd65-420d-9f5e-0103c927e86c.png">

### Presentación

<img width="270" alt="Screen Shot 2022-07-05 at 3 56 49 AM" src="https://user-images.githubusercontent.com/13957703/177290617-c2aab6fb-e376-4992-9f0e-9e3665bd9596.png">

La capa de presentación contiene:

- bloc: Framework utilizado para el manejo de estado de las vistas y UI.
- pages: Vistas.
- widgets Widgets/Componentes reutilizables entre vistas utilizado en este modulo.

### Dominio

La capa de dominio se encarga del dominio de negocio, validaciones, funcionalidades, la lógica de negocio de la aplicación. Un ejemplo común es la validación de los campos de un formulario.

<img width="285" alt="Screen Shot 2022-07-05 at 3 57 54 AM" src="https://user-images.githubusercontent.com/13957703/177290854-6783c5ab-cee9-4bea-854c-ba4160dbc62f.png">

### Capa de datos

La capa de datos se encarga de proporcionar datos de cualquier tipo a los dominios de negocio, esta capa maneja y controla el flujo de datos en general, no se encarga de manipularlos, solo de ser un gestor de datos. 

<img width="289" alt="Screen Shot 2022-07-05 at 4 00 12 AM" src="https://user-images.githubusercontent.com/13957703/177291317-2968fbc9-42b6-4c6f-925e-00cf85730376.png">

### Injección de dependencias

La inyeccion de dependencias del proyecto se implementó con `getIt` e `injectable`, librerias usadas como framework DI.

#### Inyección
<img width="534" alt="Screen Shot 2022-07-05 at 4 05 59 AM" src="https://user-images.githubusercontent.com/13957703/177292568-6a4e6999-cfa1-4fb8-a4b0-9c5aeb99d27a.png">

#### Utilización
<img width="470" alt="Screen Shot 2022-07-05 at 4 05 41 AM" src="https://user-images.githubusercontent.com/13957703/177292503-75ce7245-75c3-4e15-b710-275984b3f307.png">

### Localization

La aplicación tiene soporte para inglés y español actualmente gracias a la implementación de la localización de lenguaje.

<img width="674" alt="Screen Shot 2022-07-05 at 4 07 28 AM" src="https://user-images.githubusercontent.com/13957703/177292844-8afde82a-56c6-42f0-80c9-300cc75f933c.png">

### Validación de formulatios con formz

Email, Password, Celular y texto.

<img width="675" alt="Screen Shot 2022-07-05 at 4 14 34 AM" src="https://user-images.githubusercontent.com/13957703/177294287-837ec0ff-0110-4e22-81ec-e84037d80758.png">

### Utilización de firebase/cloud firestore como base de datos.

Se utilizo esta base de datos como proveedor/backend de datos para el login y el registro de usuarios. 

<img width="1042" alt="Screen Shot 2022-07-05 at 4 15 29 AM" src="https://user-images.githubusercontent.com/13957703/177294495-a934c4fe-a1e5-4346-87ad-1f4cad848d94.png">

### Uso de google places

Se utilizó google places para la obtencion de restaurantes cercanos por ciudad.

https://user-images.githubusercontent.com/13957703/177295404-65146516-a11e-46f7-9a13-917cd83b512e.mp4


<img width="838" alt="Screen Shot 2022-07-05 at 4 17 33 AM" src="https://user-images.githubusercontent.com/13957703/177294839-dbfbead8-fba2-4ae9-b273-184bcf092bcc.png">


### Otras librerías usadas.

```
  http:
  intl:
  injectable:
  get_it: 
  bloc: ^8.0.3
  hive: ^2.2.3
  formz: ^0.4.1
  dartz: ^0.10.1
  path_provider:
  equatable: ^2.0.3
  http_auth: ^1.0.1
  flutter_bloc: ^8.0.1
  cupertino_icons: ^1.0.5
  device_info_plus: ^4.0.0
  google_maps_flutter: ^2.1.8
  cached_network_image: ^3.2.1
  flutter_google_places: ^0.3.0
  cloud_firestore: ^3.2.1
  firebase_core :
  google_geocoding: ^0.2.0
  google_place: ^0.4.7
```

### Testing

Dependiendo de si se usan metodologías como TDD donde el dominio de la aplicación comienza siendo los test.












