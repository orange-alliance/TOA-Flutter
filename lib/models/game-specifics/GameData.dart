import 'package:flutter/material.dart';
import 'package:toa_flutter/models/Match.dart';
import 'package:toa_flutter/models/MatchDetails.dart';
import 'package:toa_flutter/models/game-specifics/RelicRecoveryMatchDetails.dart';
import 'package:toa_flutter/models/game-specifics/RoverRuckusMatchDetails.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:toa_flutter/ui/widgets/NoDataWidget.dart';
import 'package:toa_flutter/ui/views/match/years/MatchBreakdown1718.dart';
import 'package:toa_flutter/ui/views/match/years/MatchBreakdown1819.dart';

class GameData {

  static MatchDetails fromResponse(String seasonKey, String json) {
    if (json.toString() == 'null' || json.toString() == '[]') {
      return null;
    }
    switch (seasonKey) {
      case '1718':
        return RelicRecoveryMatchDetails.allFromResponse(json)?.elementAt(0) ?? null;
      case '1819':
        return RoverRuckusMatchDetails.allFromResponse(json)?.elementAt(0) ?? null;
      default:
        return null;
    }
  }
  
  static List<Widget> getBreakdown(Match match, BuildContext context) {
    List<Widget> noData = [NoDataWidget(MdiIcons.ballotOutline, 'No Breakdown found')];
    if (match.gameData == null) {
      return noData;
    }
    switch (match.getSessonKey()) {
      case '1718':
        return MatchBreakdown1718.getRows(match, context);
      case '1819':
        return MatchBreakdown1819.getRows(match, context);
      default:
        return noData;
    }
  }
}