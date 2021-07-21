import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardComponent extends StatelessWidget {
  final String? date;
  final String? day;
  final String? description;
  final String? degree;
  final String? min;
  final String? max;
  final String? img;

  const CardComponent({
    Key? key,
    this.date,
    this.day,
    this.description,
    this.degree,
    this.min,
    this.max,
    this.img,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${this.date} (${this.day})'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: SvgPicture.network(this.img!),
                    ),
                    Text(this.description!),
                    Text('${this.degree!} \u2103'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('min: ${this.min!} \u2103'),
                        Text('max: ${this.max!} \u2103'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
