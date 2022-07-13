import 'package:flutter/material.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPostersWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
          child: _SummaryWidget(),
        ),
      ],
    );
  }
}

class _TopPostersWidget extends StatelessWidget {
  const _TopPostersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage('images/backgroundmovie.jpg')),
        Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: Image(image: AssetImage('images/placemovie.jpg'))),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        maxLines: 3,
        text: TextSpan(children: [
          TextSpan(
              text: 'Tom Clance Without Remorse',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              )),
          TextSpan(
              text: ' (2021)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ]));
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('R, 04/29/21 (US) Action, Adventure, Thriller, War',
        textAlign: TextAlign.center,
        maxLines: 3,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400));
  }
}
