import 'package:flutter/material.dart';

class DonationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width),
        Container(padding: const EdgeInsets.all(16), child: const Text("开发不易，赞助一下开发者。")),
        // _ActionTile(
        //   text: "微信捐赠",
        //   onTap: () async {
        //     await showDialog(context: context, builder: (context) => const _ReceiptDialog.weChat());
        //     Navigator.pop(context);
        //   },
        // ),
        // _ActionTile(
        //   text: "支付宝捐赠",
        //   onTap: () async {
        //     await showDialog(context: context, builder: (context) => const _ReceiptDialog.aliPay());
        //     Navigator.pop(context);
        //   },
        // ),
        // _ActionTile(
        //   text: "支付宝红包码",
        //   onTap: () async {
        //     await Clipboard.setData(const ClipboardData(text: HONG_BAO));
        //     final data = await Clipboard.getData(Clipboard.kTextPlain);
        //     if (data.text == HONG_BAO) {
        //       showSimpleNotification(context, const Text("已复制到粘贴板 （≧ｙ≦＊）"));
        //     } else {
        //       await showDialog(context: context, builder: (context) => const _SingleFieldDialog(text: HONG_BAO));
        //     }
        //     Navigator.of(context).pop();
        //   },
        // ),
      ],
    );
  }
}

class _SingleFieldDialog extends StatelessWidget {
  final String text;

  const _SingleFieldDialog({required this.text});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: TextField(
          maxLines: 5,
          autofocus: true,
          controller: TextEditingController(text: text),
        ),
      ),
    );
  }
}

class _ReceiptDialog extends StatelessWidget {
  final String image;

  const _ReceiptDialog({required this.image});

  const _ReceiptDialog.weChat() : this(image: "assets/wechat.png");

  const _ReceiptDialog.aliPay() : this(image: "assets/alipay.jpg");

  static final borderRadius = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: ClipRRect(borderRadius: borderRadius, child: Image.asset(image)),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final VoidCallback onTap;

  final String text;

  const _ActionTile({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
