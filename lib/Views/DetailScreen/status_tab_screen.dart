import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class StatusMatchTab extends StatelessWidget {
  @override
  final List statusMatch;
  const StatusMatchTab({Key? key, required this.statusMatch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("ne ne ne:"+statusMatch.toString());
    return SingleChildScrollView(
      reverse: false,
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          for (var i=0; i< statusMatch[0].length; i++)
            if((statusMatch[1][i].toString() != "No status"))
              if((int.parse(statusMatch[1][i])>0 || int.parse(statusMatch[2][i])>0))
                statusWidget(statusMatch, i),
          //   Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //   child: Row(
          //     children: [
          //       Column(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               Text("${summaryMatch[1][i]}"),
          //               const SizedBox(width: 115,),
          //               Text("${summaryMatch[0][i]}"),
          //               const SizedBox(width: 115,),
          //               Text("${summaryMatch[2][i]}"),
          //             ],
          //           ),
          //           SizedBox(height: 10,),
          //           Row(
          //             children: [
          //               LinearPercentIndicator(
          //                 lineHeight: 10,
          //                 width: 185,
          //                 percent: aaaa,
          //                 linearStrokeCap: LinearStrokeCap.butt,
          //                 isRTL: true,
          //               ),
          //               LinearPercentIndicator(
          //                 lineHeight: 10,
          //                 width: 185,
          //                 percent: 0.8,
          //                 linearStrokeCap: LinearStrokeCap.butt,
          //                 isRTL: false,
          //               )
          //             ],
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
  Widget statusWidget(List context, int i){
    int index1 = int.parse(context[1][i]);
    int index2 = int.parse(context[2][i]);
    double result1 = index1/(index1+index2);
    double result2 = index2/(index1+index2);
    // print("index1:"+index1.toString()+" , index2:"+index2.toString());
    // print("result1:"+result1.toString()+" , result2:"+result2.toString());
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${statusMatch[1][i]}"),
                  // const SizedBox(width: 115,),
                  Text("${statusMatch[0][i]}"),
                  //const SizedBox(width: 115,),
                  Text("${statusMatch[2][i]}"),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                LinearPercentIndicator(
                  lineHeight: 10,
                  width: 185,
                  percent: result1,
                  linearStrokeCap: LinearStrokeCap.butt,
                  isRTL: true,
                  backgroundColor: Colors.white70,
                  progressColor: index1>index2?Colors.redAccent:Colors.grey,

                ),
                LinearPercentIndicator(
                  lineHeight: 10,
                  width: 185,
                  percent: result2,
                  linearStrokeCap: LinearStrokeCap.butt,
                  isRTL: false,
                  backgroundColor: Colors.white70,
                  progressColor: index2>index1?Colors.redAccent:Colors.grey,
                )
              ],
            ),
          ],
        )
    );
  }
}
