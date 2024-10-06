import 'package:flutter/material.dart';

// Константы для цветов и размеров
const Color primaryColor = Color(0xFFC84B31);
const Color secondaryColor = Color(0xFFECDBBA);
const Color textColor = Color(0xFF56423D);
const Color backgroundColor = Color(0xFF191919);
const Color accentColor = Color(0xFFC84B31);

const double defaultPadding = 16.0;
const double defaultRadius = 10.0;
const double defaultTextSize = 14.0;

class Authorization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  String? _gender;
  String? _country;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _groupNumberController = TextEditingController(); // Добавлен контроллер для поля "Номер группы"

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Логика входа
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Вход выполнен!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final cardWidth = isSmallScreen ? screenWidth : screenWidth * 0.6;
    final fontSize = isSmallScreen ? 24.0 : 32.0;

    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Center(
        child: SingleChildScrollView(
          child: Card(
            color: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Container(
              width: cardWidth,
              padding: const EdgeInsets.all(defaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'MANgo100',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    isSmallScreen ? _buildSingleColumnLayout() : _buildDoubleColumnLayout(),
                    const SizedBox(height: 24),
                    _buildGroupNumberField(), // Добавлено поле "Номер группы"
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                        const Text(
                          'Прочитал и согласен с правилами',
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: isSmallScreen ? double.infinity : 200,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: secondaryColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                        ),
                        child: const Text('Войти'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: isSmallScreen ? double.infinity : 200,
                      child: OutlinedButton(
                        onPressed: () {
                          // Логика регистрации
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          side: const BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                        ),
                        child: const Text(
                          'Регистрация',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Логика восстановления пароля
                      },
                      child: const Text(
                        'Восстановить пароль',
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSingleColumnLayout() {
    return Column(
      children: [
        _buildInputField('ФИО', _fullNameController, hintText: 'Иванов Иван Иванович'),
        const SizedBox(height: 24),
        _buildGenderAndAgeSelection(),
        const SizedBox(height: 24),
        _buildCountrySelection(),
        const SizedBox(height: 24),
        _buildInputField('Почта', _emailController, hintText: 'example@example.com'),
        const SizedBox(height: 24),
        _buildInputField('Пароль', _passwordController, obscureText: true, hintText: 'Минимум 8 символов'),
        const SizedBox(height: 24),
        _buildInputField('Повторите пароль', _confirmPasswordController, obscureText: true, hintText: 'Повторите пароль'),
      ],
    );
  }

  Widget _buildDoubleColumnLayout() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField('ФИО', _fullNameController, hintText: 'Иванов Иван Иванович'),
              const SizedBox(height: 24),
              _buildGenderAndAgeSelection(),
              const SizedBox(height: 24),
              _buildCountrySelection(),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField('Почта', _emailController, hintText: 'example@example.com'),
              const SizedBox(height: 24),
              _buildInputField('Пароль', _passwordController, obscureText: true, hintText: 'Минимум 8 символов'),
              const SizedBox(height: 24),
              _buildInputField('Повторите пароль', _confirmPasswordController, obscureText: true, hintText: 'Повторите пароль'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {bool obscureText = false, String? hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: textColor,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: const BorderSide(color: textColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: const BorderSide(color: textColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: const BorderSide(color: primaryColor),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          style: const TextStyle(
            color: textColor,
            fontSize: defaultTextSize,
            fontFamily: 'Tektur',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Пожалуйста, введите $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildGenderAndAgeSelection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Пол',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Radio<String>(
                    value: 'М',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    activeColor: primaryColor,
                  ),
                  const Text(
                    'М',
                    style: TextStyle(color: textColor),
                  ),
                  Radio<String>(
                    value: 'Ж',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    activeColor: primaryColor,
                  ),
                  const Text(
                    'Ж',
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildInputField('Возраст', _ageController, hintText: 'Ваш возраст'),
        ),
      ],
    );
  }

  Widget _buildCountrySelection() {
    const List<String> countries = [
      'Россия', 'Украина', 'Беларусь', 'Казахстан', 'Другая'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Страна',
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: _country,
          onChanged: (String? newValue) {
            setState(() {
              _country = newValue;
            });
          },
          items: countries.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: const BorderSide(color: textColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: const BorderSide(color: textColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: const BorderSide(color: primaryColor),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          style: const TextStyle(
            color: textColor,
            fontSize: defaultTextSize,
            fontFamily: 'Tektur',
          ),
          icon: const Icon(Icons.arrow_drop_down, color: textColor),
        ),
      ],
    );
  }

  Widget _buildGroupNumberField() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _buildInputField('Номер группы', _groupNumberController, hintText: 'Введите номер группы'),
      ),
    );
  }
}