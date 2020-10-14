import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';

class PerpetratorEntry extends StatelessWidget {
 final CheckCase checkCase;
  const PerpetratorEntry({Key key, this.checkCase}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            checkCase.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                          Text(
                            checkCase.preview,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                          ),
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
                            "Case Number: ${checkCase.policeCaseNumber}",
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "Reported by: ${checkCase.reporter.user.firstName} on ${checkCase.when}",
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
