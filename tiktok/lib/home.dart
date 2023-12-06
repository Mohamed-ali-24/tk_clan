import 'package:flutter/material.dart';

class Comment {
  String username;
  String text;

  Comment(this.username, this.text);
}

class TikTokClone extends StatefulWidget {
  @override
  _TikTokCloneState createState() => _TikTokCloneState();
}

class _TikTokCloneState extends State<TikTokClone>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;
  TextEditingController _commentController = TextEditingController();
  List<Comment> comments = [
    Comment('ahmed mohamed', 'adkaatay 🤣😂😎'),
    Comment('moha77', 'var kan anaa aqaan 🤷‍♂️😂'),
    Comment('niicle xade', 'see waaye xalka 😎😁'),
  ]; // List to store comments

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showCommentBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 300, // Set the height as per your requirement
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          // You can use a user's profile picture here
                           backgroundImage: NetworkImage('https://www.just.edu.so/assets/images/black.png'),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comments[index].username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(comments[index].text),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.favorite,color: Colors.red,),
                            Text("12"),
                            SizedBox(width: 4),
                            // Display the number of likes
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                   
                                // Handle the reply button press
                                // You can open another bottom sheet for replies
                              },
                                 
                              child: Icon(Icons.thumb_down),
                                
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[800],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Add a comment...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            
                            // Handle the send button press
                            String commentText = _commentController.text;
                            Comment newComment =
                                Comment('moha77', commentText);
                            setState(() {
                              comments.add(newComment);
                              _commentController.clear();
                            });
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor:Colors.black,
        
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.live_tv, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                'TikTok',
                style: TextStyle(
                  color: Color.fromARGB(255, 227, 225, 225),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: TabBar(
               
                controller: _tabController,
                indicator: null,
                tabs: [
                  Tab(
                    text: 'following',
                  ),
                  Tab(
                    text: 'For you',
                  ),
                ],
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.black,
            child: Center(
                child:  Container(
                  height: 250,
                  width: 200,
                  color: Colors.green,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Text('waxaa halkaa ugu mahad celinayaa goatka macalimiinta jamacada ustaad ahmed keep going ustaad '),
                )
              // child: Text(
              //   'wax yar sug sxb! 😂',
              //   style: TextStyle(color: Colors.white),
              // ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Center(
              child: Text(
                'network error!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'friends',
          ),
          BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Icon(Icons.add, color: const Color.fromARGB(255, 255, 255, 255)), // Black icon color
      ),
      label: '',
    ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_rounded),
            label: 'inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('asset/ahmed.jpg'),
                radius: 30,
              )
            ],
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 50.0,
                ),
                padding: EdgeInsets.all(0.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 0),
              Text(
                '10k',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {
                  // Show the comment bottom sheet
                  _showCommentBottomSheet();
                },
                elevation: 0.0,
                child: Icon(
                  Icons.comment,
                  color: Colors.white,
                  size: 50.0,
                ),
                padding: EdgeInsets.all(1.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 0),
              Text(
                '343',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                child: Icon(
                  Icons.bookmark,
                  color: Colors.yellow,
                  size: 50.0,
                ),
                padding: EdgeInsets.all(0.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 0),
              Text(
                '156',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 50.0,
                ),
                padding: EdgeInsets.all(0.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 0),
              Text(
                '13',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 36),
        ],
      ),
    );
  }
}

void main() {
  runApp(TikTokClone());
}
