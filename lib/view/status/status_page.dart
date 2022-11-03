import 'package:flutter/material.dart';

import 'package:game_stream/view/home/model/character_model.dart';
import 'package:game_stream/view/status/widgets/container_bottom_sheet.dart';
import 'package:game_stream/view/status/widgets/ink_well_post_status.dart';
import 'package:game_stream/view/status/widgets/row_info_status.dart';

class StatusPage extends StatefulWidget {
  static const route = "/status";
  final CharacterModel character;
  const StatusPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.indigoAccent,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Divider(
                thickness: 5,
                color: Colors.amber,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: RowInfoStatus(
                  character: widget.character,
                ),
              ),
              const SizedBox(height: 100),
              PostStatusInkWell(
                character: widget.character,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: ContainerBottomSheetStatus(),
    );
  }
}
