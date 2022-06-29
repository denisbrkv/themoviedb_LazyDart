import 'dart:ui';

import 'package:flutter/material.dart';

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
        children: [
          _FormWidget(),
          SizedBox(height: 15),
          Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
            style: textStyle,
          ),
          SizedBox(height: 20),
          Text(
              'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
              style: textStyle),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Text('Имя пользователя', style: textStyle),
        SizedBox(height: 5),
        TextField(
          decoration: textFieldDecoration,
        ),
        SizedBox(height: 15),
        Text('Пароль', style: textStyle),
        SizedBox(height: 5),
        TextField(
          decoration: textFieldDecoration,
        ),
        SizedBox(height: 25),
        Row(
          children: [
            TextButton(
              child: Text('Войти'),
              onPressed: () {},
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
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(colotTextField),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
