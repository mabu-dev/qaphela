import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/views/case-details.dart';

class PerpetratorEntry extends StatelessWidget {
  final CheckCase checkCase;
  const PerpetratorEntry({Key key, this.checkCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return CaseDetails(checkCase: checkCase);
          }));
        },
        child: Card(
            elevation: 4,
            shadowColor: Colors.orangeAccent[100],
            child: SizedBox(
              height: 140,
              // child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Case Number: ${checkCase.policeCaseNumber}",
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.orange,
                              ),
                            ),
                            Text(
                              checkCase.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                            const Padding(
                                padding: EdgeInsets.only(bottom: 1.0)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            
                            Text(
                              checkCase.preview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              "Reported by: ${checkCase.reporter.user.firstName} on ${checkCase.when}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.green,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              // ),
            )));
  }
}
