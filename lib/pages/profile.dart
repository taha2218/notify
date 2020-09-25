import 'package:flutter/material.dart';
import 'package:notification/widgets/channel.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context)
      ),
    );
        
  }


  Widget _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.indigo,
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            icon: Icon(Icons.edit,color: Colors.white,), 
            onPressed: (){},
          ),
        )
      ],
      centerTitle: true,
      title: Text(
        "Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context){
    return Container(
      color: Colors.indigo,
      height: double.infinity,
      width: double.infinity,
      child: _buildStack(context),
    );
  }

  Widget _buildStack(BuildContext context){
    return Stack(
      children: <Widget>[
        _buildColumnProfile(context),
        _buildAvatar(context),
      ],
    );
  }

  Widget _buildColumnProfile(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildProfileInfo(context),
      ],
    );
  }

  Widget _buildProfileInfo(BuildContext context){

    double height = MediaQuery.of(context).size.height/1.3;
    double imageHeight = MediaQuery.of(context).size.width/3;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(46),
          topRight: Radius.circular(46),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            offset: Offset(0, -4)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: imageHeight/2,
            width: double.infinity,
            color: Colors.transparent,
          ),
          _buildUserInfo(context),
          _buildUserBio(context),
          _buildChannelsList(context),    
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context){
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical:10, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Black Widow',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '8806646846 - TECOB201',
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 18
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserBio(BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Center(
        child: Text(
          "Lorem Ipsum dolor sit drax why is that but n amet. This is ceholder. Do not focus on the language. You free an would be an ann familiar with this if you have donfsefwfe the web rub developemnt previously. But it isfwef fewffw olalalal okay enough with rubbish llaal",
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            height: 1.35
          ),
        ),
      ),
    );
  }

  Widget _buildChannelsList(BuildContext context){
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Subscriptions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "8",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ChannelWidget(),
                      ChannelWidget(),
                      ChannelWidget(),
                      ChannelWidget(),
                      ChannelWidget(),
                      ChannelWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context){

    double _imageHeight = MediaQuery.of(context).size.width/2.9;
    double _imageWidth = MediaQuery.of(context).size.width/2.9;
    double _leftOffset = MediaQuery.of(context).size.width/2 - (_imageWidth)/2; 
    double _bottomOffset = MediaQuery.of(context).size.height/1.3 - (_imageHeight)/2; 

    return Positioned(
      bottom: _bottomOffset,
      left: _leftOffset,
      child: Container(
        height: _imageHeight,
        width: _imageWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/avatars/avatar.jpg'),fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.55),
              offset: Offset(0, -4),
              blurRadius: 4
            ),
          ]
        ),
      ),
    );
  }



}

