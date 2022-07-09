import 'dart:async';

import 'package:audio_fairy_tales/recursec/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:record/record.dart';
import '../../../recursec/app_colors.dart';
import '../../../utils/constants.dart';
import '../voice_page.dart';
import '../model_voise_page.dart';

class RecordingWidget extends StatefulWidget {
  static const routeName = '/recording_page';
  final void Function(String path) onStop;
  const RecordingWidget({required this.onStop});

  @override
  State<RecordingWidget> createState() => _RecordingWidgetState();
}

class _RecordingWidgetState extends State<RecordingWidget> {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;
  double _incWidth = 0;
  Timer? _timer;
  Timer? _ampTimer;
  Timer? _timerAmplitude;
  final _audioRecorder = Record();
  Amplitude? _amplitude;
  Record? _record;
  double _dcb = 0;
  List _listAmplitude = [];
  final ScrollController? _scrollController = ScrollController();

  @override
  void initState() {
    _isRecording = false;
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    _timerAmplitude!.cancel();
    super.dispose();
  }

  void _getAmplituder() {
    _timerAmplitude = Timer.periodic(
      const Duration(milliseconds: 40),
      (_) async {
        _incWidth++;
        _dcb = _amplitude!.current + 20;
        if (_dcb < 2) {
          _dcb = 2;
        }
        _listAmplitude.add(_dcb);
      },
    );
  }

  Widget _buildRecordStopControl() {
    late Widget icon;
    late Color color;

    if (_isRecording || _isPaused) {
      icon = Image.asset(
        AppIcons.stop,
        fit: BoxFit.fill,
      );
      color = Colors.red.withOpacity(0.1);
    } else {
      icon = const Icon(Icons.mic, color: AppColors.white, size: 70);
      color = AppColors.pinkRec;
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 80, height: 80, child: icon),
          onTap: () {
            _isRecording ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _amplitudRecords() {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        controller: _scrollController,
        itemCount: _listAmplitude.length,
        itemBuilder: (BuildContext context, int index) {
          _scrollController!
              .jumpTo(_scrollController!.position.maxScrollExtent);
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                height: _listAmplitude[index] * 2,
                width: 2,
                color: Colors.black,
              ),
              SizedBox(
                width: 2,
                height: 6,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildText() {
    if (_isRecording || _isPaused) {
      return _buildTimer();
    }

    return Text('00:00');
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);
    context.read<ModelRP>().setDuration(minutes, seconds);
    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }

    return numberStr;
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });

        _startTimer();
        _getAmplituder();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    final path = await _audioRecorder.stop() ?? '';

    widget.onStop(path);
    setState(() => _isRecording = false);
    context.read<ModelRP>().changeString(path);
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });

    _ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
      _amplitude = await _audioRecorder.getAmplitude();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Отменить',
                  style: twoBodyTextStyle,
                )),
          ),
        ),
        const Text(
          'Запись',
          style: bodyTextStyle,
        ),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _amplitudRecords(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: const BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildText(),
                ],
              ),
              SizedBox(height: 50),
              _buildRecordStopControl(),
              SizedBox(height: 75),
            ],
          ),
        ),
      ],
    );
  }
}
