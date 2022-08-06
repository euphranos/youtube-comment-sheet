import 'package:flutter/material.dart';

class Sheet extends StatefulWidget {
  Sheet({Key? key}) : super(key: key);

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    ScrollController myScrollController = ScrollController();
    _scrollListener() {}

    @override
    void initState() {
      myScrollController = ScrollController();
      myScrollController.addListener(_scrollListener);
      super.initState();
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      maxChildSize: 1,
      snap: true,
      expand: false,
      snapSizes: const [
        0.55,
        1,
      ],
      builder: (context, scrollController) => Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
            child: customAppBar(context, scrollController),
            preferredSize: Size.fromHeight(100)),
        body: Container(
          color: Color(0xff181818),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  filter("All", Colors.white, Colors.black),
                  const SizedBox(
                    width: 15,
                  ),
                  filter("News", Colors.grey.withOpacity(0.2), Colors.white),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.pink,
                        child: Text(
                          "R",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Add a comment...",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 20)),
                      ))
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 1,
                height: 30,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  controller: myScrollController,
                  itemCount: 10,
                  itemBuilder: ((context, index) => comment())),
            ],
          ),
        ),
      ),
    );
  }
}

buildBottomSheet(context) => showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) => Sheet(),
    );
Widget customAppBar(BuildContext context, scrollController) {
  return SingleChildScrollView(
    controller: scrollController,
    child: Container(
      decoration: const BoxDecoration(
        color: Color(0xff181818),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Comments",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white.withOpacity(0.5),
            thickness: 1,
            height: 20,
          ),
        ],
      ),
    ),
  );
}

Widget comment() {
  String comment =
      "You make my knowledge great again 😂😂😂😂.Very good contentment,you helps me a lot of times Thank you";
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/profileAvatar.jpg'),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          "Abomayang",
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: [
            Text(
              comment,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, height: 1.5),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.thumb_up_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                const Icon(
                  Icons.thumb_down_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(
                  width: 50,
                ),
                const Icon(
                  Icons.chat,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
      trailing: const Icon(
        Icons.more_vert_rounded,
        color: Colors.white,
      ),
    ),
  );
}

Widget filter(String text, Color color, Color color2) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: color2,
        fontSize: 21,
      ),
    ),
  );
}
