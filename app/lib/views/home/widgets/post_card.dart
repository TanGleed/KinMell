import 'package:flutter/material.dart';

Color _favIconColor = Colors.black;

class PostCard extends StatefulWidget {
  final String profile_img, product_img, username, description, price;
  const PostCard({
    Key? key,
    required this.profile_img,
    required this.product_img,
    required this.username,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent, //Color.fromARGB(255, 44, 28, 70),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  //User image from the database goes here
                  child: Image.asset(widget.profile_img),

                  backgroundColor: Colors.transparent,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                )),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            'Delete',

                            //To delete the post put the function here
                          ]
                              .map(
                                (e) => InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text(e),
                                    )),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                )
              ],
            ),
          ),
          // Image section, the uploaded image

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.asset(
                widget.product_img, // Picture of the product goes here
                fit: BoxFit.cover,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
          ),

          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_outlined),
                color: _favIconColor,
                onPressed: () {
                  setState(() {
                    if (_favIconColor == Colors.black) {
                      _favIconColor = Colors.red;
                    } else {
                      _favIconColor = Colors.black;
                    }
                  });
                },
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_outlined,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined),
                      onPressed: () {},
                    ),
                    Text(widget.price), // Price of the goods goes here
                  ],
                ),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
                text: TextSpan(
              // Description of the product
              text: widget.description,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Colors.black,
              ),
            )),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: Text(
              '23/08/2022',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ]));
  }
}
