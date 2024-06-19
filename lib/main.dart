import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Introduce',
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/hobbies': (context) => HobbyPage(),
        '/goals': (context) => GoalPage(),
        '/summary': (context) => SummaryPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('about'),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: Row(
          children: [
            NavigationRail(
              backgroundColor: Colors.blue,
              selectedIndex: 0,
              onDestinationSelected: (int index) {
                if (index == 0) {
                  Navigator.pushNamed(context, '/');
                } else if (index == 1) {
                  Navigator.pushNamed(context, '/hobbies');
                } else if (index == 2) {
                  Navigator.pushNamed(context, '/goals');
                } else if (index == 3) {
                  Navigator.pushNamed(context, '/summary');
                }
              },
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.school),
                  label: Text('전공'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.sports_esports),
                  label: Text('취미'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star),
                  label: Text('목표'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.summarize),
                  label: Text('정리'),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CircleAvatar(
                    backgroundImage: AssetImage('myprofileimage.jpg'),
                    radius: 80.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '성민석',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _buildInfoBox('생년월일: 1999.05.05'),
                  _buildInfoBox('alstjr971@naver.com'),
                  _buildInfoBox('010-4069-8376'),
                  _buildInfoBox('기술 스택'),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSkillIcon('spring.png'),
                      _buildSkillIcon('java.png'),
                      _buildSkillIcon('python.png'),
                      _buildSkillIcon('c.png'),
                      _buildSkillIcon('springboot.png'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '사이버보안 전공',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      CircleAvatar(
                        backgroundImage: AssetImage('security2.jpg'),
                        radius: 50.0,
                        backgroundColor: Colors.amber[400],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '컴퓨터 시스템 보안 및 네트워크 보안에\n특화된 전공',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'ESTJ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      CircleAvatar(
                        backgroundImage: AssetImage('mbti.png'),
                        radius: 50.0,
                        backgroundColor: Colors.amber[400],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '리더십과 조직 관리에 강점을 가진 성격 유형',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildSkillIcon(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 25.0,
      ),
    );
  }
}

class HobbyPage extends StatelessWidget {
  final List<Map<String, String>> hobbies = [
    {
      'image': 'assets/favorite_coffee.png',
      'title': '카페 탐방',
      'description': '커피 맛집 찾으러 다니기'
    },
    {
      'image': 'assets/favorite_ott.jpg',
      'title': 'Netflix',
      'description': '침대에 누워서 넷플릭스..'
    },
    {
      'image': 'assets/elecguitar.png',
      'title': '기타 치기',
      'description': '일렉기타 연습 중!'
    },
    {
      'image': 'puppy3.jpg',
      'title': '산책',
      'description': '강아지와 간단한 조깅!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('취미 생활'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: hobbies.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            hobbies[index]['image']!,
                            width: 340.0,  // Increase the width
                            height: 340.0,  // Increase the height
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          hobbies[index]['title']!,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            hobbies[index]['description']!,
                            style: TextStyle(fontSize: 14.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '커피를 좋아하고, 여가 생활을 여러 개 가지려고 노력하고 있어요.\n한 일에 몰두하다가 슬럼프가 오면 헤어나오기 쉽지 않더라구요.\n 그럴 때 취미를 가지면 빠르게 돌아올 수 있어요',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 10.0),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class GoalPage extends StatelessWidget {
  final List<Map<String, String>> goals = [
    {
      'image': 'spring.png',
      'title': '백엔드 역량 강화',
      'description': 'Spring 프레임워크 완벽히 마스터하기'
    },
    {
      'image': 'teamproject.jpg',
      'title': 'Team Project',
      'description': '방학동안 팀프로젝트 공모전 준비'
    },
    {
      'image': 'baekjoon.png',
      'title': '코딩테스트 준비',
      'description': '백준 알고리즘 문제풀이 루틴'
    },
    {
      'image': 'frontend.png',
      'title': '프론트엔드',
      'description': '백엔드에 필요한 기초적인 프론트엔드는 숙달하기'
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('여름방학 목표'),
        backgroundColor: Color.fromARGB(255, 236, 235, 235),
      ),
      backgroundColor: Color.fromARGB(255, 106, 19, 246),
      body: Center(
        child: Container(
          height: 400.0, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: goals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      goals[index]['image']!,
                      width: 300.0, // Adjust the width as needed
                      height: 300.0, // Adjust the height as needed
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      goals[index]['title']!,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      goals[index]['description']!,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('진로'),
      ),
      body: Container(
        color: Colors.orange[100],
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '백엔드 개발자',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CircleAvatar(
  radius: 100.0, 
  backgroundColor: Colors.transparent, // 배경 투명화
  backgroundImage: AssetImage('codebackground.jpg'),
),

                  SizedBox(height: 20.0),
                  Text(
                    '희망 직군',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _buildInfoBox('서버 관련 직종'),
                  _buildInfoBox('토스 서버 관리자'),
                  _buildInfoBox('게임회사 서버 관리'),
                  _buildInfoBox('은행 보안 관련 IT 직군'),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSkillIcon('server.png'),
                      _buildSkillIcon('toss.jpg'),
                      _buildSkillIcon('game.png'),
                      _buildSkillIcon('bank.jpg'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '백엔드 개발자가 되려고 어떠한 노력을 하고 있고, 다양한 경험이 필요하다 생각했는데 오픈소스 수업을 듣고 여러 가지 기술을 알게 되었다 등등',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildSkillIcon(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 25.0,
      ),
    );
  }
}
