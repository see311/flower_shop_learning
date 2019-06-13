import 'package:flower_shop/layout/body_with_scaffold.dart';
import 'package:flower_shop/path.dart' as Path;
import 'package:flower_shop/router.dart';
import 'package:flower_shop/widget/card_box.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flower_shop/model/subject.dart' as M;
import 'package:flower_shop/test_db/db.dart' as db;
import 'package:transparent_image/transparent_image.dart';

class InnerSubject extends StatefulWidget {
  @override
  _InnerSubjectState createState() => _InnerSubjectState();
}

class _InnerSubjectState extends State<InnerSubject> {
  RefreshController refreshController;
  static List<M.Subject> subjects = db.subjects;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  Widget list() {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (BuildContext ctx, int index) {
        var subject = subjects[index];
        return GestureDetector(
          onTap: () {
            route.to(ctx, Path.SubjectDetail, {});
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            decoration: boxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: subject.imgUrl,
                  fit: BoxFit.cover,
                  height: 130,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(subject.name),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        child: list(),
        controller: refreshController,
        enablePullUp: true,
        header: ClassicHeader(
          idleIcon: Container(),
          releaseText: '释放后刷新',
          refreshingText: '刷新中...',
          completeText: '刷新完成',
          failedText: '刷新失败',
          idleText: '继续下拉进行刷新',
        ),
        footer: ClassicFooter(
          loadingText: '加载中...',
          idleText: "载入更多",
        ),
        onRefresh: onRefresh,
        onLoading: onLoading,
      ),
    );
  }

  onRefresh() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      setState(() {
        subjects.add(M.Subject(1, "test",
            "https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1"));
      });
      refreshController.refreshCompleted();
    });
  }

  onLoading() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      setState(() {
        subjects.add(M.Subject(1, "test",
            "https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1"));
      });
      refreshController.loadComplete();
    });
  }
}

var SubjectPage = () => BodyPage.fromBuild((ctx, params, router) {
      return InnerSubject();
    });
