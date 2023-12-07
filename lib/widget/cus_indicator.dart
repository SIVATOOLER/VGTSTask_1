import 'package:flutter/material.dart';

class CusIndicator extends StatefulWidget {
  const CusIndicator({super.key,required this.index,required this.length,});
  final int index;
  final int length;

  @override
  State<CusIndicator> createState() => _CusIndicatorState();
}

class _CusIndicatorState extends State<CusIndicator> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics:const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemCount: widget.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Container(
                decoration: BoxDecoration(
                  color:index==widget.index?Theme.of(context).primaryColor: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12)
                ),

                width: 20,

              ),
            );
          }),
    );
  }
}
