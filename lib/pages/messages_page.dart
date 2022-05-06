// Import
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:bubble/constants/constants.dart';
import 'package:bubble/models/models.dart';
import 'package:bubble/utils/utils.dart';
import 'package:bubble/widgets/widgets.dart';

// Messages page class
class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  Widget _delegate(BuildContext context, int index) {
    final faker = Faker();
    final date = BubbleDateUtils.generateRandomDate();
    return _MessageCard(
      data: MessageData(
        senderName: faker.person.name(),
        message: faker.lorem.sentence(),
        date: date,
        dateMessage: Jiffy(date).fromNow(),
        avatarUrl: BubbleImageUtils.generateRandomImage(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: _Stories()),
        SliverList(delegate: SliverChildBuilderDelegate(_delegate)),
      ],
    );
  }
}

// Stories class
class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0),
              child: Text(
                'Stories',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: colorTextFaded,
                )
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final faker = Faker();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 60,
                      child: _StoryCard(
                        data: StoryData(
                          name: faker.person.name(),
                          url: BubbleImageUtils.generateRandomImage(),
                        ),
                      )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Story card class
class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final StoryData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: data.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              data.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Message card class
class _MessageCard extends StatelessWidget {
  const _MessageCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MessageData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.2,
              color: colorTextFaded,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Avatar.medium(url: data.avatarUrl),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        data.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          wordSpacing: 1.5,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        data.message,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: colorTextFaded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      data.dateMessage.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        letterSpacing: -0.2,
                        color: colorTextFaded,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorTint,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 10,
                            color: colorTextLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
