import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        barBackgroundColor: CupertinoColors.systemBackground,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      home: LoginPage(),
    );
  }
}

// ================= LOGIN =================

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    CupertinoIcons.person_crop_circle_fill,
                    color: CupertinoColors.activeBlue,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Inicia sesión para continuar',
                    style: TextStyle(
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CupertinoTextField(
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.person),
                    ),
                    placeholder: 'Usuario',
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: CupertinoColors.tertiarySystemFill,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    obscureText: true,
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.lock),
                    ),
                    placeholder: 'Contraseña',
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: CupertinoColors.tertiarySystemFill,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton.filled(
                      borderRadius: BorderRadius.circular(10),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= MENU =================

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget botonMenu(
    BuildContext context,
    String titulo,
    IconData icono,
    Color color,
    Widget pagina,
  ) {
    return CupertinoListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icono, color: CupertinoColors.white, size: 20),
      ),
      title: Text(
        titulo,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.chevron_right,
        color: CupertinoColors.tertiaryLabel,
        size: 18,
      ),
      onTap: () {
        if (titulo == 'Salir') {
          Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => pagina),
            (route) => false,
          );
        } else {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => pagina),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Menú Principal'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                botonMenu(
                  context,
                  'Registrar',
                  CupertinoIcons.person_add_solid,
                  CupertinoColors.activeBlue,
                  const RegisterPage(),
                ),
                botonMenu(
                  context,
                  'Listado',
                  CupertinoIcons.list_bullet,
                  CupertinoColors.systemTeal,
                  const ListadoPage(),
                ),
                botonMenu(
                  context,
                  'Perfil',
                  CupertinoIcons.person_crop_circle,
                  CupertinoColors.systemOrange,
                  const ProfilePage(),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                botonMenu(
                  context,
                  'Salir',
                  CupertinoIcons.square_arrow_right,
                  CupertinoColors.systemRed,
                  const LoginPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================= REGISTER =================

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  Widget cajaTexto(String texto, IconData icono) {
    return CupertinoFormRow(
      prefix: Icon(icono, color: CupertinoColors.secondaryLabel),
      child: CupertinoTextField(
        placeholder: texto,
        decoration: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Registrar Persona'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            CupertinoListSection.insetGrouped(
              header: const Text('DATOS PERSONALES'),
              children: [
                cajaTexto('Nombre', CupertinoIcons.person),
                cajaTexto('Apellido', CupertinoIcons.person_2),
                cajaTexto('Fecha Nacimiento', CupertinoIcons.calendar),
                cajaTexto('Correo', CupertinoIcons.mail_solid),
                cajaTexto('Teléfono', CupertinoIcons.phone),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CupertinoButton.filled(
                borderRadius: BorderRadius.circular(10),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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

// ================= LISTADO =================

class ListadoPage extends StatelessWidget {
  const ListadoPage({super.key});

  Widget tarjetaPersona(String nombre, String correo) {
    return CupertinoListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: CupertinoColors.activeBlue,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          CupertinoIcons.person_fill,
          color: CupertinoColors.white,
          size: 22,
        ),
      ),
      title: Text(
        nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(correo),
      trailing: const Icon(
        CupertinoIcons.chevron_right,
        color: CupertinoColors.tertiaryLabel,
        size: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Listado Personas'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                tarjetaPersona('Juan Pérez', 'juan@gmail.com'),
                tarjetaPersona('María López', 'maria@gmail.com'),
                tarjetaPersona('Carlos Ramos', 'carlos@gmail.com'),
                tarjetaPersona('Ana Torres', 'ana@gmail.com'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================= PROFILE =================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget itemPerfil(String titulo, String valor, IconData icono) {
    return CupertinoListTile(
      leading: Icon(icono, color: CupertinoColors.activeBlue),
      title: Text(titulo),
      additionalInfo: Text(
        valor,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Perfil'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Column(
              children: [
                const Icon(
                  CupertinoIcons.person_crop_circle_fill,
                  color: CupertinoColors.systemOrange,
                  size: 120,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Juan Pérez',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CupertinoListSection.insetGrouped(
              header: const Text('INFORMACIÓN'),
              children: [
                itemPerfil('Nombre', 'Juan', CupertinoIcons.person),
                itemPerfil('Apellido', 'Pérez', CupertinoIcons.person_2),
                itemPerfil(
                  'Fecha Nacimiento',
                  '10/05/2000',
                  CupertinoIcons.calendar,
                ),
                itemPerfil('Correo', 'juan@gmail.com', CupertinoIcons.mail_solid),
                itemPerfil('Teléfono', '999999999', CupertinoIcons.phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
