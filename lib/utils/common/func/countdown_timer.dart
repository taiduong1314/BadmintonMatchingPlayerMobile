import 'dart:async';

import 'package:flutter/material.dart';
import '../../widget/text/montserrat.dart';
import '../color.dart';
import '../data.dart';
import '../text_style.dart';

class CountDownTimer extends StatefulWidget {
  final int timeToReSendOTP;
  final VoidCallback onTap;

  const CountDownTimer({
    Key? key,
    required this.timeToReSendOTP,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _start = widget.timeToReSendOTP;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> doResendOTP() async {
    setState(() {});
    widget.onTap();
    _start = widget.timeToReSendOTP;
    _timer?.cancel();
    startTimer();

    /// Code to resend otp
  }

  String getTimeCountDown(int value) {
    final _minutes = (value ~/ 60).toInt();
    final _seconds = (value % 60).toInt();
    if (_seconds == 0 && _minutes == 0) {
      return '';
    }
    if (_seconds < 10) {
      return '0$_minutes:0$_seconds';
    }
    return '0$_minutes:$_seconds';
  }

  @override
  Widget build(BuildContext context) {
    return _start == 0
        ? GestureDetector(
            onTap: () {
              doResendOTP();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColor.colorLogo)),
              child: CustomText.textPlusJakarta(
                  text: 'Gửi lại mã',
                  style: TextAppStyle.size14W600()
                      .copyWith(color: AppColor.colorLogo)),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText.textPlusJakarta(
                  text: 'Gửi lại mã sau ',
                  style: TextAppStyle.size14W600()
                      .copyWith(color: AppColor.colorDark)),
              CustomText.textPlusJakarta(
                text: getTimeCountDown(_start),
                style: TextAppStyle.size14W600(),
              ),
            ],
          );
  }
}
