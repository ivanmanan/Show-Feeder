import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "styles.dart";
import "models/title_info.dart";
import "models/data.dart";
import "models/remove_scroll_glow.dart";

class TitleDetail extends StatefulWidget {
  final TitleInfo info;
  final bool favorite;

  TitleDetail(this.info, this.favorite);

  @override
  _TitleDetail createState() => _TitleDetail(favorite);
}

class _TitleDetail extends State<TitleDetail> {

  bool _favorite;
  _TitleDetail(this._favorite);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.info.title)),
      body: _buildBody(context, widget.info),
    );
  }

  Widget _buildBody(BuildContext context, TitleInfo info) {
    const pad = 5.0;
    const padContent = 40.0;
    // Separating content from each other
    const textPaddingHeader = EdgeInsets.all(pad);
    // Grouping headers with content
    const textPaddingContent = EdgeInsets.fromLTRB(pad, pad, pad ,padContent);

    return Container(
      padding: EdgeInsets.all(50.0),
      child: ScrollConfiguration(
        behavior: RemoveScrollGlow(),
        child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,            
            children: <Widget>[
              Container(
                padding: textPaddingContent,
                child: Text("${info.title}", style: Styles.headerOneText),
              ),
              Container(
                padding: textPaddingContent,
                child: Text("${info.month} ${info.day}, ${info.year}", style: Styles.regularText),
              ),
              Container(
                padding: textPaddingHeader,
                child: Text("Summary", style: Styles.headerTwoText),
              ),
              Container(
                padding: textPaddingContent,
                child: Text("Summary from titleInfo goes here.", style: Styles.regularText),
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
        child: Text(_favorite ? "Remove Show" : "Save Show", style: Styles.regularTextBold),
        onPressed: () => {
          _favorite ? _removeShow(context, info) : _addShow(context, info)
        }, 
        splashColor: Colors.redAccent,
      ),
    );
  }

  void _removeShow(BuildContext context, TitleInfo info) {
    Provider.of<Data>(context, listen: true).handleRemoveFavorite(info);
    setState(() {
      _favorite = false;
    });
  }

  void _addShow(BuildContext context, TitleInfo info) {
    Provider.of<Data>(context, listen: true).handleAddFavorite(info);
    setState(() {
      _favorite = true;
    });

  }
}