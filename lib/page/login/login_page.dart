import 'package:azlm_shop/global/app_color.dart';
import 'package:azlm_shop/global/app_path.dart';
import 'package:azlm_shop/page/login/login_controller.dart';
import 'package:azlm_shop/utils/widget_button/base_button.dart';
import 'package:azlm_shop/utils/widget_input/base_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginController get controller => Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle,
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: <Widget>[
                const SizedBox(height: 26),
                _buildTextOpenWith,
                const SizedBox(height: 24),
                _buildLoginWithOrther,
                const SizedBox(height: 32),
                _buildDivider,
                const SizedBox(height: 32),
                _buildTitleLogin,
                const SizedBox(height: 24),
                _buildInputAccount,
                const SizedBox(height: 12),
                _buildInputPassword,
                const SizedBox(height: 12),
                _buildForgetPassword,
                const SizedBox(height: 12),
                _buildButtonLogin,
                const SizedBox(height: 40),
                _buildCardRegister,
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Divider get _buildDivider => Divider(color: AppColor.lineDark, height: 1);

  // title
  Container get _buildTitle => Container(
        color: AppColor.black100,
        height: 60,
        alignment: Alignment.center,
        child: Text(
          'ログイン / 会員登録',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.primary),
        ),
      );
  // text Open WIth
  Widget get _buildTextOpenWith => Column(
        children: [
          Text(
            'SNSアカウントをお持ちの方',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.primary),
          ),
          const SizedBox(height: 10),
          Text(
            '各種SNSアカウントで会員登録 または ログイン',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.secondary),
          )
        ],
      );

  // LoginWith Fb,Line,Insta
  Widget get _buildLoginWithOrther => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              _buildButtonLoginOrther(AppPath.logoGoogle, 'Google',
                  borderColor: AppColor.black800,
                  textColor: AppColor.primary,
                  bgColor: AppColor.white),
              const SizedBox(width: 12),
              _buildButtonLoginOrther(AppPath.logoLINE, 'LINE',
                  bgColor: AppColor.bgLine)
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildButtonLoginOrther(AppPath.logoFacebook, 'Facebook',
                  bgColor: AppColor.bgFacebook),
              const SizedBox(width: 12),
              _buildButtonLoginOrther(AppPath.logoInstagram, 'Instagram',
                  bgColorGradient: AppColor.bgInstagram)
            ],
          )
        ],
      );

  // text
  Text get _buildTitleLogin => Text(
        'AZLM CONNECTED CAFE\nアカウントをお持ちの方',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.black800),
      );

  // input acc
  Widget get _buildInputAccount => BuildInputText(
        controller: controller.textAccController,
        currentNode: controller.focusNodeAcc,
        labelText: 'メールアドレス',
        hintText: 'example@example.com',
        iconNextTextInputAction: TextInputAction.next,
      );

  // input pass
  Widget get _buildInputPassword => BuildInputText(
        controller: controller.textPassController,
        currentNode: controller.focusNodePass,
        labelText: 'パスワード',
        hintText: '半角英数8文字以上',
        obscureText: true,
        iconNextTextInputAction: TextInputAction.done,
        submitFunc: () => controller.login(),
      );

  //
  Widget get _buildForgetPassword => Row(
        children: <Widget>[
          const Spacer(),
          InkWell(
              onTap: controller.onForgetPassword,
              child: Text(
                'パスワードをお忘れですか？',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primary),
              ))
        ],
      );

  //
  Widget get _buildButtonLogin => BaseButton(
        title: 'ログイン',
        onPress: () => controller.login(),
        radiusBoder: 2,
        height: 50,
      );

  //
  Widget get _buildCardRegister => Container(
        decoration: BoxDecoration(
            color: AppColor.black100, borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'アカウントをお持ちでない方',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary),
            ),
            const SizedBox(height: 12),
            BaseButton(
              title: '新規会員登録',
              onPress: () => controller.onRegister(),
              radiusBoder: 55,
              height: 50,
            ),
            const SizedBox(height: 12),
            Text(
              'はじめてご利用の方',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primary),
            ),
          ],
        ).paddingSymmetric(vertical: 24, horizontal: 16),
      );

  //
  Widget _buildButtonLoginOrther(String pathIcon, String title,
          {Color? bgColor,
          List<Color>? bgColorGradient,
          Color? textColor,
          Color? borderColor}) =>
      Expanded(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: bgColor,
              gradient: bgColorGradient == null
                  ? null
                  : LinearGradient(
                      end: Alignment.bottomRight,
                      begin: Alignment.topLeft,
                      colors: bgColorGradient,
                    ),
              borderRadius: BorderRadius.circular(5),
              border:
                  borderColor != null ? Border.all(color: borderColor) : null),
          child: Row(
            children: [
              SvgPicture.asset(pathIcon, height: 24, width: 24),
              const SizedBox(width: 8),
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: textColor ?? AppColor.white)),
            ],
          ).paddingAll(16),
        ),
      );
}
