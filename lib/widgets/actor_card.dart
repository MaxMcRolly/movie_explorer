import 'package:movie_explorer/imports.dart';

class ActorCard extends StatefulWidget {
  ActorCard({
    super.key,
    required this.actor,
  });
  Actor actor;
  @override
  State<ActorCard> createState() => _ActorCardState();
}

class _ActorCardState extends State<ActorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 270,
      width: 132,
      decoration: BoxDecoration(
        color: Color(0xff454547),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: CachedImage(
                    url: widget.actor.image!,
                    width: 116,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Text(
                  widget.actor.name!,
                  // maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              if (widget.actor.character!.isNotEmpty)
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 3, right: 3),
                child: Text("as ${widget.actor.character!}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
