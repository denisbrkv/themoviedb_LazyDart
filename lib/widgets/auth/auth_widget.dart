import 'package:flutter/material.dart';
import '../../Theme/app_button_style.dart';
import '../main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Войти в свою учётную запись',
        )),
        body: ListView(
          children: [
            _HeaderWidget(),
          ],
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FormWidget(),
          SizedBox(height: 15),
          Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой.',
            style: textStyle,
          ),
          SizedBox(height: 10),
          TextButton(
            child: Text('Регистрация'),
            onPressed: () {},
            style: AppButtonStyle.linkbutton,
          ),
          SizedBox(height: 10),
          Text(
              'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
              style: textStyle),
          TextButton(
            child: Text('Верификация аккаунта'),
            onPressed: () {},
            style: AppButtonStyle.linkbutton,
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      // Navigator.of(context).pushNamed('/main_screen');
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('Сброс пароля');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    final colotTextField = const Color(0xFF01B4E4);
    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        if (errorText != null)
          Text(errorText, style: TextStyle(color: Colors.red, fontSize: 16)),
        SizedBox(height: 15),
        Text('Имя пользователя', style: textStyle),
        SizedBox(height: 5),
        TextField(
          decoration: textFieldDecoration,
          controller: _loginTextController,
        ),
        SizedBox(height: 15),
        Text('Пароль', style: textStyle),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
        ),
        SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              child: Text('Войти'),
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colotTextField),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
              ),
            ),
            SizedBox(width: 25),
            TextButton(
              child: Text('Сбросить пароль'),
              onPressed: _resetPassword,
              style: AppButtonStyle.linkbutton,
            ),
          ],
        ),
      ],
    );
  }
}
