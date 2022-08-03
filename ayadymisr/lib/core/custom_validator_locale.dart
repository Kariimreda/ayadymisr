import 'package:form_validator/form_validator.dart';

/// A custom [FormValidatorLocale] that returns custom arabic error messages.
class MyValidationLocale extends FormValidatorLocale {
  @override
  String name() => "ar";

  @override
  String required() => "الرجاء إدخال البيانات";

  @override
  String minLength(String v, int n) => ' يجب أن يكون أكثر من $n حروف';

  @override
  String maxLength(String v, int n) => ' يجب أن يكون أقل من $n حرف';

  @override
  String email(String v) => 'البريد إلكتروني غير صحيح';

  @override
  String phoneNumber(String v) => 'رقم الهاتف غير صحيح';

  @override
  String ip(String v) => 'عنوان بروتوكول الشبكة غير صحيح';

  @override
  String ipv6(String v) => 'عنوان بروتوكول الشبكة IPV6 غير صحيح';

  @override
  String url(String v) => 'عنوان URL غير صحيح';

  String password(String v) =>
      'كلمة المرور يجب أن تحتوي على القل علي \nرقم\nحرف كبير\nرمز خاص مثل @#\$%';

  String phoneEmail(String V) => 'رقم الهاتف أو البريد الإلكتروني غير صحيح';
}
