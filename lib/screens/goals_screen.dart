import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class AllGoals extends StatefulWidget {
  AllGoals({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AllGoalsState createState() => new _AllGoalsState();
}

class _AllGoalsState extends State<AllGoals> {
  int _counter = 0;
  var mTextMessageController = new TextEditingController();
  IO.Socket socketIO;
  IO.Socket socketIO02;

  @override
  void initState() {
    super.initState();
  }

  _connectSocket01() {
    //update your domain before using
    /*socketIO = new SocketIO("http://127.0.0.1:3000", "/chat",
        query: "userId=21031", socketStatusCallback: _socketStatus);*/

    print('눌렸니?');


    socketIO = IO.io('http://15.164.96.238:5000/goal');
    socketIO.connect();

    socketIO.on('status', (data) => print(data));
    socketIO.on('comment', (data) => print(data));
  }

  _connectSocket02() {
    String jsonData =
        '{"user_id": 2, "goal_id": 11, "comment": "hello clapme!"}';

    socketIO.emit('comment', jsonData);
//    socketIO02 = SocketIOManager().createSocketIO("http://127.0.0.1:3000", "/map", query: "userId=21031", socketStatusCallback: _socketStatus02);
//
//    //call init socket before doing anything
//    socketIO02.init();
//
//    //subscribe event
//    socketIO02.subscribe("socket_info", _onSocketInfo02);
//
//    //connect socket
//    socketIO02.connect();
  }

  _onSocketInfo(dynamic data) {
    print("Socket info: " + data);
  }

  _socketStatus(dynamic data) {
    print("Socket status: " + data);
  }

  _onSocketInfo02(dynamic data) {
    print("Socket 02 info: " + data);
  }

  _socketStatus02(dynamic data) {
    print("Socket 02 status: " + data);
  }

  _subscribes() {
    if (socketIO != null) {
      socketIO.emit('joined', '{"name": "ganadara", "goal_id": 11}');
//      socketIO.subscribe("comment", _onReceiveChatMessage);
    }
  }

  _unSubscribes() {
    if (socketIO != null) {
//      socketIO.subscribe("status", _onReceiveChatMessage);
//      socketIO.unSubscribe("chat_direct", _onReceiveChatMessage);
    }
  }

  _reconnectSocket() {
    if (socketIO == null) {
      _connectSocket01();
    } else {
      socketIO.connect();
    }
  }

  _disconnectSocket() {
    if (socketIO != null) {
      socketIO.disconnect();
    }
  }

  _destroySocket() {
    if (socketIO != null) {
//      SocketIOManager().destroySocket(socketIO);
    }
  }

  void _sendChatMessage(String msg) async {
    if (socketIO != null) {
      String jsonData =
          '{"user_id": 2, "goal_id": 11, "comment": "hello clapme!"}';
//      String jsonData =
//          '{"message":{"type":"Text","content": ${(msg != null && msg.isNotEmpty) ? '"${msg}"' : '"HELLO CLAPME :))"'},"owner":"589f10b9bbcd694aa570988d","avatar":"img/avatar-default.png"},"sender":{"userId":"589f10b9bbcd694aa570988d","first":"Ha","last":"Test 2","location":{"lat":10.792273999999999,"long":106.6430356,"accuracy":38,"regionId":null,"vendor":"gps","verticalAccuracy":null},"name":"Ha Test 2"},"receivers":["587e1147744c6260e2d3a4af"],"conversationId":"589f116612aa254aa4fef79f","name":null,"isAnonymous":null}';
//      socketIO.sendMessage("comment", jsonData, _onReceiveChatMessage);
    }
  }

  void socketInfo(dynamic message) {
    print("Socket Info: " + message);
  }

  void _onReceiveChatMessage(dynamic message) {
    print("Message from UFO: " + message);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed(
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _showToast() {
    _sendChatMessage(mTextMessageController.text);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the AllGoals object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child:
              const Text('CONNECT  SOCKET 01', style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _connectSocket01();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            new RaisedButton(
              child:
              const Text('CONNECT SOCKET 02', style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _connectSocket02();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            new RaisedButton(
              child: const Text('SEND MESSAGE', style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _showToast();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            new RaisedButton(
              child: const Text('SUBSCRIBES',
                  style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _subscribes();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            new RaisedButton(
              child: const Text('UNSUBSCRIBES',
                  style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _unSubscribes();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            new RaisedButton(
              child: const Text('RECONNECT',
                  style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _reconnectSocket();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            new RaisedButton(
              child: const Text('DISCONNECT',
                  style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _disconnectSocket();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            new RaisedButton(
              child:
              const Text('DESTROY', style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _destroySocket();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



//import 'package:flutter/material.dart';
//import 'package:scoped_model/scoped_model.dart';
//
//import './comment_screen.dart';
//import '../models/s_goal_model.dart';
//import '../models/s_thread_model.dart';
//
//class AllGoals extends StatefulWidget {
//  @override
//  _AllGoalsState createState() => _AllGoalsState();
//}
//
//class _AllGoalsState extends State<AllGoals> {
//  @override
//  void initState() {
//    super.initState();
//    ScopedModel.of<ThreadModel>(context, rebuildOnChange: false).init();
//  }
//
//  void friendClicked(Goal friend) {
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (BuildContext context) {
//          return Comment(friend);
//        },
//      ),
//    );
//  }
//
//  Widget buildAllChatList() {
//    return ScopedModelDescendant<ThreadModel>(
//      builder: (context, child, model) {
//        return ListView.builder(
//          itemCount: model.friendList.length,
//          itemBuilder: (BuildContext context, int index) {
//            Goal friend = model.friendList[index];
//            return ListTile(
//              title: Text(friend.title),
//              onTap: () => friendClicked(friend),
//            );
//          },
//        );
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('All Goals'),
//      ),
//      body: buildAllChatList(),
//    );
//  }
//}