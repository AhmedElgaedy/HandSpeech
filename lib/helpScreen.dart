import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hand_speech/home.dart';
import 'package:timeline_tile/timeline_tile.dart';

class FAQScreen extends StatefulWidget {
  @override
  FAQScreenState createState() => FAQScreenState();
}

class FAQScreenState extends State<FAQScreen> {
  List<Step> _steps;

  @override
  void initState() {
    _steps = _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFaaaed6),
            Color.fromRGBO(64, 72, 153, 1),
          ],
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: const Color(0xFFaaaed6).withOpacity(0.2),
        ),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(64, 72, 153, 1),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
              title: Text('FAQ'),
              centerTitle: true,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[_TimelineSteps(steps: _steps)],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Step> _generateData() {
    return <Step>[
      const Step(
          title:
              'What is the correct term to use when addressing a Deaf person?',
          message:
              'The terms are, "deaf" or a "Deaf person" or "Hard of hearing", and none other, and the prognoses is "loss of hearing" and only when, a person who previously was able to hear, has lost that ability. Babies born without the ability to hear is "Deaf". The term "hearing impaired" is experienced as an insult and should be avoided at all cost.'),
      const Step(
        title: 'Is sign language universal?',
        message:
            'Sign Language is NOT universal, different countries have their own sign languages.',
      ),
      const Step(
        title: 'What is American Sign Language?',
        message:
            'ASL (American Sign Language) is an expression of a series of standardized signals including recognizable hand movements, facial expressions and body postures to communicate, uniformly preserved in written text for references and monotropism as a complete and complex language created by, and for Deaf people in Canada and the United States of America.',
      ),
      const Step(
        title: 'Is ASL a form of gesturing?',
        message:
            'No, Deaf people will gesture if they are trying to emphasize something or communicate without sign, gesturing and ASL are NOT the same. If they were, we wouldn’t have this App!',
      ),
      const Step(
        title: 'Does ASL have grammar?',
        message:
            'Yes , you can see a simplified explaination in our apps menu! ',
      ),
      const Step(
        title: 'Can all Deaf people read lips?',
        message:
            'No, not all hearing people can either! Reading lips is not something specifically that Deaf people can do, it is something that Deaf people HAVE done and sometimes need to do in order to exist and participate in a conversation where signing is not an option. Most people can not read lips, it is also virtually impossible to read lips accurately 100%. Try it!',
      ),
      const Step(
        title: 'Can Deaf people read?',
        message:
            'Yes, Deaf people can read and write. English is a second language for most Deaf people making them bilingual in both ASL and English. Deaf education emphasizes early language acquisition and literacy.',
      ),
    ];
  }
}

class _TimelineSteps extends StatelessWidget {
  const _TimelineSteps({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isOdd)
            return const TimelineDivider(
              color: Color(0xFFaaaed6),
              thickness: 5,
              begin: 0.1,
              end: 0.9,
            );

          final int itemIndex = index ~/ 2;
          final Step step = steps[itemIndex];

          final bool isLeftAlign = itemIndex.isEven;

          final child = _TimelineStepsChild(
            title: step.title,
            subtitle: step.message,
            isLeftAlign: isLeftAlign,
          );

          final isFirst = itemIndex == 0;
          final isLast = itemIndex == steps.length - 1;
          double indicatorY;
          if (isFirst) {
            indicatorY = 0.2;
          } else if (isLast) {
            indicatorY = 0.8;
          } else {
            indicatorY = 0.5;
          }

          return TimelineTile(
            alignment: TimelineAlign.manual,
            endChild: isLeftAlign ? child : null,
            startChild: isLeftAlign ? null : child,
            lineXY: isLeftAlign ? 0.1 : 0.9,
            isFirst: isFirst,
            isLast: isLast,
            indicatorStyle: IndicatorStyle(
              width: 40,
              height: 40,
              indicatorXY: indicatorY,
              indicator: _TimelineStepIndicator(step: '${step.step}'),
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFaaaed6),
              thickness: 5,
            ),
          );
        },
        childCount: max(0, steps.length * 2 - 1),
      ),
    );
  }
}

class _TimelineStepIndicator extends StatelessWidget {
  const _TimelineStepIndicator({Key key, this.step}) : super(key: key);

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFaaaed6),
      ),
    );
  }
}

class _TimelineStepsChild extends StatelessWidget {
  const _TimelineStepsChild({
    Key key,
    this.title,
    this.subtitle,
    this.isLeftAlign,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isLeftAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isLeftAlign
          ? const EdgeInsets.only(right: 32, top: 16, bottom: 16, left: 10)
          : const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment:
            isLeftAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}

class Step {
  const Step({
    this.step,
    this.title,
    this.message,
  });

  final int step;
  final String title;
  final String message;
}
