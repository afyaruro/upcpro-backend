import 'package:flutter/material.dart';
import 'package:upcpro_app/Components/customProgresoSign.dart';
import 'package:upcpro_app/Components/date.dart';
import 'package:upcpro_app/Components/dropDown.dart';
import 'package:upcpro_app/Components/textField.dart';
import 'package:upcpro_app/Models/facultad.dart';
import 'package:upcpro_app/Models/program.dart';
import 'package:upcpro_app/Response/respuestaSign.dart';
import 'package:upcpro_app/Utils/styles.dart';

class Sign3 extends StatefulWidget {
  final String correo;
  const Sign3({super.key, required this.correo});

  @override
  State<Sign3> createState() => _Sign3State();
}

class _Sign3State extends State<Sign3> {
  final TextEditingController controllerNombre = TextEditingController();
  final TextEditingController controllerApellido = TextEditingController();
  final TextEditingController controllerNumeroIdentificacion =
      TextEditingController();
  final TextEditingController controllerNacimiento = TextEditingController();

  Programa selectedPrograma = Programa(
      nombre: "Selecciona un programa", estado: false, id: 0, id_facultad: 0);
  Facultad selectedFacultad =
      Facultad(nombre: "Selecciona una facultad", estado: false, id: 0);
  int selectedFacultadId = 0;

  String selectedIdentificacion = "Tipo de identificación";
  String selectedGenero = "Género";
  List<Facultad> facultadesTodas = [
    Facultad(nombre: "Selecciona una facultad", estado: false, id: 0)
  ];

  List<Programa> programas = [];

  List<Programa> programasVisibles = [
    Programa(
        nombre: "Selecciona un programa", estado: false, id: 0, id_facultad: 0)
  ];

  @override
  void initState() {
    super.initState();
    cargarFacultades();
    cargarProgramas();
  }

  @override
  void dispose() {
    controllerApellido.dispose();
    controllerNombre.dispose();
    controllerNacimiento.dispose();
    controllerNumeroIdentificacion.dispose();
    super.dispose();
  }

  void cargarFacultades() async {
    try {
      List<Facultad> facultadesPeticion = await fetchFacultades();

      setState(() {
        facultadesTodas.addAll(facultadesPeticion);
      });
    } catch (e) {
      print("Error al cargar facultades: $e");
    }
  }

  void cargarProgramas() async {
    try {
      List<Programa> programasPeticion = await fetchProgramas();

      setState(() {
        programas.addAll(programasPeticion);
      });
    } catch (e) {
      print("Error al cargar facultades: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 110, 131, 111),
        title: const Text(
          "Paso 3 de 4",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 145, 156, 135),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProgresoSign(
                      porcentaje: fullWidth(context) * 0.73,
                    ),
                    const SizedBox(height: 20),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "Datos personales",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(221, 255, 255, 255),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Necesitamos que proporciones unos datos adicionales",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildTextField(
                          controller: controllerNombre,
                          hintText: "Nombres",
                          icon: Icons.person),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildTextField(
                          controller: controllerApellido,
                          hintText: "Apellidos",
                          icon: Icons.person_outline),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildDropdown(
                        context: context,
                        hintText: "Tipo de identificación",
                        items: [
                          "Tipo de identificación",
                          "Cédula de ciudadanía",
                          "Tarjeta de Identidad",
                          "Pasaporte"
                        ],
                        selectedItem: selectedIdentificacion,
                        onChanged: (value) {
                          setState(() {
                            selectedIdentificacion = value!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildTextField(
                          controller: controllerNumeroIdentificacion,
                          hintText: "Número de Identificación",
                          icon: Icons.badge),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildDropdown(
                        context: context,
                        hintText: "Género",
                        items: [
                          "Género",
                          "Masculino",
                          "Femenino",
                          "Prefiero no decir"
                        ],
                        selectedItem: selectedGenero,
                        onChanged: (value) {
                          setState(() {
                            selectedGenero = value!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildDateField(
                        controller: controllerNacimiento,
                        context: context,
                        hintText: "Fecha de nacimiento",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Facultad>(
                            dropdownColor: const Color.fromARGB(255, 69, 87, 68)
                                .withOpacity(0.9),
                            value: facultadesTodas.contains(selectedFacultad)
                                ? selectedFacultad
                                : facultadesTodas
                                    .first, // Asegúrate de que el valor sea válido
                            hint: const Text(
                              "Selecciona una facultad",
                              style: TextStyle(color: Colors.white70),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white70,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            onChanged: (value) {
                              selectedFacultad = value!;
                              programasVisibles = [];
                              programasVisibles.add(Programa(
                                  nombre: "Selecciona un programa",
                                  estado: false,
                                  id: 0,
                                  id_facultad: 0));

                              for (var programa in programas) {
                                if (value.id == programa.id_facultad) {
                                  programasVisibles.add(programa);
                                }
                              }

                              selectedPrograma = programasVisibles.first;
                              setState(() {});
                            },
                            items: facultadesTodas.map((item) {
                              return DropdownMenuItem<Facultad>(
                                value: item,
                                child: Text(item.nombre),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton<Programa>(
                          dropdownColor: const Color.fromARGB(255, 69, 87, 68),
                          value: programas.contains(selectedPrograma)
                              ? selectedPrograma
                              : programasVisibles.isNotEmpty
                                  ? programasVisibles.first
                                  : null,
                          hint: const Text(
                            "Selecciona un programa",
                            style: TextStyle(color: Colors.white70),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white70,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedPrograma = value!;
                            });
                          },
                          items: programasVisibles.map((item) {
                            return DropdownMenuItem<Programa>(
                              value: item,
                              child: Text(item.nombre),
                            );
                          }).toList(),
                        )),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () { 

                    RespuestaSign.ValidateData(
                        correo: widget.correo,
                        nombre: controllerNombre.text,
                        apellido: controllerApellido.text,
                        tipoIdentificacion: selectedIdentificacion,
                        identificacion: controllerNumeroIdentificacion.text,
                        genero: selectedGenero,
                        fechacNacimiento: controllerNacimiento.text,
                        programa: selectedPrograma.id,
                        context: context);
                   
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Siguiente",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff689734),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
