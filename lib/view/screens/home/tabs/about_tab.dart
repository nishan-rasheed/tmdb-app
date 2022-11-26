import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('StoryLine'),
            SizedBox(height: 10,),
            Text('hbhj hd hj d hws n jkjw s jwns jkwkjnsjk wsjknsknwk jwsnjnwskjwn wjsjknwskjwn wjnsjkwnkjn wjswkjnjn wjnsjwnwjn wjswjnkwjn jwsjkwnsjkwn wjwjsn ws wj sjkw sjw s sj wsj wks '),
            SizedBox(height: 10,),
            Text('Runtime : 4.54 hour'),
          ],
        ),
      ),
    );
  }
}