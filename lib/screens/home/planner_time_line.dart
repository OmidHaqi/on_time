
import 'package:flutter/material.dart';
import 'package:on_time/resource/widgets/time_line/event_item.dart';
import 'package:on_time/resource/widgets/time_line/indicator_position.dart';
import 'package:on_time/resource/widgets/time_line/timeline.dart';
import 'package:on_time/resource/widgets/time_line/timeline_theme.dart';
import 'package:on_time/resource/widgets/time_line/timeline_theme_data.dart';

class PlannerTimeLine extends StatelessWidget {
  const PlannerTimeLine({
    super.key,
    required this.events,
  });

  final List<TimelineEventDisplay> events;

  @override
  Widget build(BuildContext context) {
    return TimelineTheme(
      data: TimelineThemeData(
          lineColor: Theme.of(context).colorScheme.primary,
          itemGap: 20,
          lineGap: 0),
      child: Timeline(
        anchor: IndicatorPosition.top,
        indicatorSize: 36,
        events: events,
      ),
    );
  }
}
