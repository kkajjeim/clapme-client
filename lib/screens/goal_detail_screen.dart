import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clapme_client/models/goal_model.dart';
import 'package:clapme_client/models/user_model.dart';
import 'package:clapme_client/models/comment_model.dart';
import 'package:clapme_client/models/reaction_model.dart';
import 'package:clapme_client/services/dummy_datas.dart';

class GoalDetail extends StatefulWidget {
  const GoalDetail({Key key}) : super(key: key);

  @override
  _GoalDetailState createState() => _GoalDetailState();
}

class _GoalDetailState extends State<GoalDetail> {
  Goal goal = dummyGoal;
  List<User> participants = dummyUsers;
  List<Comment> comments = dummyComents;

  /* 
  구조에 대한 피드백: 함수 단위로 view 구성하고 있음,
  padding: 일괄 패딩을 적용할 수 없을지,
  모두 절대 수치로 처리한것
  */

  // --------- 상단 목표 정보

  Widget _buildIntervalTag(
      String text, Color backgroundColor, Color fontColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
          decoration: BoxDecoration(color: backgroundColor),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
          )),
    );
  }

  Widget _buildParticipantsBadge(String name) {
    return Container(
      width: 35,
      height: 35,
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        shadows: [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Center(
          child: Text(
            name.substring(0, 1),
            style: TextStyle(
                fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildParticipantList(List<User> participants) {
    Widget firstBadge = _buildParticipantsBadge(participants[0].username);
    // 2개 이상부터는 겹치게 표현
    List<Widget> additionalBadges = List.generate(
        participants.sublist(1).length,
        (i) => new Positioned(
            left: (i + 1) * 25.0,
            child: _buildParticipantsBadge(participants[i + 1].username)));
    return Stack(children: [firstBadge, ...additionalBadges]);
  }

  // --------- 하단 댓글 스레드

  Map<String, int> countByType(List<Reaction> reactions) {
    // 코멘트별 reaction 데이터를 가지고 각 리액션 별 개수 계산하는 함수
    // {'fire': 3, 'smile': 4, 'heart': 1, 'clap': 100} 형태로 리턴
    Map<String, int> counted = {};

    reactions.forEach((reaction) {
      counted[reaction.type] =
          counted[reaction.type] != null ? counted[reaction.type] + 1 : 1;
    });

    return counted;
  }

  List<Widget> _buildReactionList(Map<String, int> countsByType) {
    // countsByType = {'fire': 3, 'smile': 4, 'heart': 1, 'clap': 100}
    List<Widget> lists = [];
    countsByType.forEach((key, value) {
      lists.add(_buildReaction(key, value));
    });
    return lists;
  }

  Widget _buildReaction(String type, int count) {
    String imageUrl = getImageUrlByType(type);

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(-2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl, width: 25, height: 25),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(count.toString(),
                    style: TextStyle(fontWeight: FontWeight.w800)),
              )
            ],
          )),
    );
  }

  Widget _buildComment(Comment comment) {
    const basicInnerPadding = 10.0;
    Map<String, int> countsByType = countByType(comment.reactions);

    return Padding(
      padding: const EdgeInsets.all(basicInnerPadding),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: basicInnerPadding),
              child: Row(
                children: <Widget>[
                  _buildParticipantsBadge(comment.userName),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: basicInnerPadding, right: basicInnerPadding),
                    child: Text(comment.userName,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 17,
                            fontWeight: FontWeight.w800)),
                  ),
                  Text(
                      DateFormat('yyyy-MM-dd')
                          .format(comment.timestamp)
                          .toString(),
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13.0, top: 10.0, bottom: 8.0, right: 8.0),
              child: Text(comment.content,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w300)),
            ),
            Padding(
              padding: const EdgeInsets.all(basicInnerPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _buildReactionList(countsByType),
              ),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    const basicPadding = 33.0;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // 상단 이미지
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset('assets/goalimg.png'),
                    ),
                  ),
                  // 정보 - 인터벌
                  Padding(
                    padding: const EdgeInsets.only(left: basicPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildIntervalTag(
                            this.goal.interval, Colors.grey, Colors.white),
                        _buildIntervalTag(this.goal.times.toString() + '회',
                            Colors.white, Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: basicPadding),
                    child: Text(this.goal.title,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: basicPadding),
                    child: Text(this.goal.description,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300)),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: basicPadding),
                    child: Text(this.participants.length.toString() + '명 참여중',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: basicPadding),
                    child: Container(
                        width: 500,
                        child: _buildParticipantList(this.participants)),
                  ),
                  SizedBox(height: 2000),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.20,
            minChildSize: 0.20,
            builder: (BuildContext context, ScrollController scrollController) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30.0)),
                      color: Colors.grey[200]),
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: this.comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildComment(this.comments[index]);
                      }),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
