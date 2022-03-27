import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus/helper/componanets.dart';
import 'package:school_bus/model/school_user.dart';
import 'package:school_bus/screen/chat/chatscreen.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_state.dart';

import 'cubit/chatscreen_cubit.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    chatBuilder(context, SocialCubit.get(context).users[index]),
                separatorBuilder: (context, index) => Divider(),
                itemCount: SocialCubit.get(context).users.length),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget chatBuilder(context, SocialUserModel model) => InkWell(
      onTap: () {
        navigateTo(
            context,
            ChatDetailsScreen(
              model: model,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('${model.image}'),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1.4),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                IconButton(
                  iconSize: 22.0,
                  icon: Icon(Icons.arrow_back_ios_rounded),
                )
              ],
            ), //handelling my avatar
            SizedBox(
              height: 8.0,
            )
          ],
        ),
      ),
    );
