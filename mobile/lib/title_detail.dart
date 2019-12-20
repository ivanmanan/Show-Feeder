import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "styles.dart";
import "models/title_info.dart";
import "models/data.dart";
import "models/remove_scroll_glow.dart";

class TitleDetail extends StatefulWidget {
  final TitleInfo info;

  TitleDetail(this.info);

  @override
  _TitleDetail createState() => _TitleDetail();
}

class _TitleDetail extends State<TitleDetail> {

  _TitleDetail();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.info.title)),
      body: _buildBody(context, widget.info),
    );
  }

  Widget _buildBody(BuildContext context, TitleInfo info) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 150, 50, 50),
      child: ScrollConfiguration(
        behavior: RemoveScrollGlow(),
        child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: Styles.textPaddingContent,
                child: Text("${info.title}", style: Styles.headerOneText),
              ),
              Container(
                padding: Styles.textPaddingContent,
                child: Text("${info.month} ${info.day}, ${info.year}", style: Styles.regularText),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                child: _buildButton(context, info),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget _buildButton(BuildContext context, TitleInfo info) {
    return Center(
      child: MaterialButton(
        height: 75.0,
        minWidth: MediaQuery.of(context).size.width * 0.65,
        color: Colors.orange[300],
        child: Text("Remove Show", style: Styles.regularTextBold),
        onPressed: () => {
          _removeShow(context, info)
        },
        splashColor: Colors.redAccent,
      ),
    );
  }

  void _removeShow(BuildContext context, TitleInfo info) {
    Provider.of<Data>(context, listen: true).handleRemoveSpecificShow(info);
  }
}