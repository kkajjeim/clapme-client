import 'package:clapme_client/models/goal_model.dart';
import 'package:clapme_client/models/user_model.dart';
import 'package:clapme_client/models/comment_model.dart';
import 'package:clapme_client/models/reaction_model.dart';

Goal dummyGoal = new Goal(
    id: 1,
    title: '조깅하기',
    description: '2020 서울하프마라톤에 나가자',
    image: '',
    interval: '매주',
    times: 1);

List<User> dummyUsers = [
  new User(
      email: 'dolores@email.com',
      password: 'really',
      username: 'Dolores',
      image: 'no',
      status: 'hi'),
  new User(
      email: 'west@email.com',
      password: 'really',
      username: '웨스트',
      image: 'no',
      status: 'hi'),
  new User(
      email: 'world@email.com',
      password: 'really',
      username: '월드',
      image: 'no',
      status: 'hi')
];

List<Comment> dummyComents = [
  new Comment(
      id: 1,
      goalId: 1,
      userId: 1,
      userName: 'Dolores',
      content: '더운거 싫어요',
      timestamp: DateTime(2020),
      reactions: [
        new Reaction(id: 1, userId: 2, userName: '웨스트', type: 'fire'),
        new Reaction(id: 2, userId: 2, userName: '웨스트', type: 'smile'),
        new Reaction(id: 3, userId: 2, userName: '웨스트', type: 'heart'),
        new Reaction(id: 4, userId: 2, userName: '웨스트', type: 'clap'),
        new Reaction(id: 5, userId: 3, userName: '월드', type: 'heart'),
        new Reaction(id: 6, userId: 3, userName: '월드', type: 'clap'),
      ]),
  new Comment(
      id: 2,
      goalId: 1,
      userId: 2,
      userName: '웨스트',
      content: '뛰기 싫어요',
      timestamp: DateTime(2020),
      reactions: [
        new Reaction(id: 1, userId: 2, userName: '웨스트', type: 'fire'),
        new Reaction(id: 1, userId: 3, userName: '월드', type: 'fire'),
      ]),
  new Comment(
      id: 3,
      goalId: 1,
      userId: 3,
      userName: '월드',
      content: '자전거 타고싶어요',
      timestamp: DateTime(2020),
      reactions: [
        new Reaction(id: 1, userId: 2, userName: '웨스트', type: 'fire'),
        new Reaction(id: 2, userId: 2, userName: '웨스트', type: 'smile'),
        new Reaction(id: 3, userId: 2, userName: '웨스트', type: 'heart'),
        new Reaction(id: 4, userId: 2, userName: '웨스트', type: 'clap'),
        new Reaction(id: 5, userId: 3, userName: '월드', type: 'heart'),
      ]),
  new Comment(
      id: 4,
      goalId: 1,
      userId: 1,
      userName: 'Dolores',
      content: '샘플이에요',
      timestamp: DateTime(2020),
      reactions: [
        new Reaction(id: 4, userId: 2, userName: '웨스트', type: 'clap'),
      ]),
  new Comment(
      id: 5,
      goalId: 1,
      userId: 2,
      userName: '웨스트',
      content: '이번 주 발표 안한다!',
      timestamp: DateTime(2020),
      reactions: [
        new Reaction(id: 2, userId: 2, userName: '웨스트', type: 'smile'),
        new Reaction(id: 3, userId: 2, userName: '웨스트', type: 'heart'),
        new Reaction(id: 4, userId: 2, userName: '웨스트', type: 'clap'),
        new Reaction(id: 2, userId: 3, userName: '월드', type: 'smile'),
        new Reaction(id: 3, userId: 3, userName: '월드', type: 'heart'),
        new Reaction(id: 4, userId: 3, userName: '월드', type: 'clap'),
        new Reaction(id: 2, userId: 1, userName: 'Dolores', type: 'smile'),
        new Reaction(id: 3, userId: 1, userName: 'Dolores', type: 'heart'),
        new Reaction(id: 4, userId: 1, userName: 'Dolores', type: 'clap'),
      ]),
  new Comment(
      id: 6,
      goalId: 1,
      userId: 3,
      userName: '월드',
      content: '견과류를 잔뜩 샀어요',
      timestamp: DateTime(2020),
      reactions: [
        new Reaction(id: 6, userId: 3, userName: '월드', type: 'clap'),
      ]),
  new Comment(
      id: 7,
      goalId: 1,
      userId: 3,
      userName: '월드',
      content: '든든해요',
      timestamp: DateTime(2020),
      reactions: [
        new Reaction(id: 2, userId: 2, userName: '웨스트', type: 'smile'),
      ]),
];
