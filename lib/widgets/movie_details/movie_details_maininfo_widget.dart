import 'package:flutter/material.dart';
import 'package:themoviedb/elements/CustomPaint.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPostersWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummaryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        SizedBox(height: 20),
        _PeopleWidget(),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400));
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Overview',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600));
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

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: RadialPercentWidget(
                      child: Text('72'),
                      percent: 0.72,
                      fillColor: Color.fromARGB(255, 10, 23, 25),
                      lineColor: Color.fromARGB(255, 37, 203, 103),
                      freeColor: Color.fromARGB(255, 25, 54, 31),
                      lineWidht: 3),
                ),
                SizedBox(width: 10),
                Text('User Score'),
              ],
            )),
        Container(width: 1, height: 15, color: Colors.grey),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.play_arrow),
                Text('Play Trailer'),
              ],
            )),
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
        child: Text('R, 04/29/21 1h 49m (US) Action, Adventure, Thriller, War',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);
    final jobNameStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobNameStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobNameStyle),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobNameStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobNameStyle),
              ],
            )
          ],
        ),
      ],
    );
  }
}
