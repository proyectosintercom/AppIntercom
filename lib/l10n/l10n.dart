
import 'package:flutterfire_ui/i10n.dart';

class LabelOverrides extends DefaultLocalizations
{
  const LabelOverrides();

  @override
  String get emailInputLabel=>'Correo electrónico';
  @override
  String get passwordInputLabel=>'Contraseña';
  @override
String get  signInActionText=>'Iniciar sesión';
  @override
  String get registerActionText=>'Registrarse';
  @override
   String get linkEmailButtonText=>'Siguiente';
  @override
  String get signInButtonText=>'Iniciar sesión';

  @override
  String get signInWithGoogleButtonText=>'Entrar con Google';

  @override
  String get verifyCodeButtonText=>'Verificar';

  @override
  String get unknownError=>'Ha ocurrido un error desconocido';

  @override
  String get  emailIsRequiredErrorText=> 'El correo electrónico es obligatorio';

  @override
  String get isNotAValidEmailErrorText=>'Ingresa un correo electrónico válido';

  @override
  String get  userNotFoundErrorText => 'No existe una cuenta con este usuario';

  @override
  String get   emailTakenErrorText => 'Ya existe una cuenta con este correo electrónico';

  @override
  String get  accessDisabledErrorText =>'El acceso a esta cuenta se ha inhabilitado temporalmente';
  @override
  String get wrongOrNoPasswordErrorText => 'La contraseña no es válida o el usuario no tiene contraseña.';

  @override
  String get signInText =>'Iniciar sesión';

  @override
  String get registerText => 'Registrarse';

  @override
  String get getregisterHintText => '¿No tienes una cuenta?';

  @override
  String get signInHintText => '¿Ya tienes una cuenta?';
  @override
  String get signOutButtonText => 'Cerrar sesión' ;

  @override
  String get name => 'Nombre';

  @override
  String get passwordIsRequiredErrorText => 'La contraseña es obligatoria';

  @override
  String get confirmPasswordIsRequiredErrorText => 'Confirma tu contraseña';

  @override
  String get  confirmPasswordDoesNotMatchErrorText => 'Las contraseñas no coinciden';

  @override
  String get confirmPasswordInputLabel => 'Confirma la contraseña';
  @override
  String get forgotPasswordButtonLabel => '¿Has olvidado tu contraseña?';

  @override
  String get  forgotPasswordViewTitle =>'Contraseña olvidada';

  @override
  String get  resetPasswordButtonLabel => 'Restablecer contraseña';

  @override
  String get verifyItsYouText => 'Verifica que eres tú';

  @override
  String get findProviderForEmailTitleText =>
  'Introduce su correo electrónico para continuar';

  @override
  String get continueText => 'Continuar';

  @override
  String get provideEmail => 'Proporcione su correo electrónico y contraseña';

  @override
  String get goBackButtonLabel => 'Volver';

  @override
  String get passwordResetEmailSentText =>
  'Le enviamos un correo electrónico con un enlace para restablecer su contraseña. Por favor revise su correo electrónico.';

  @override
  String get forgotPasswordHintText =>
  'Introduce su correo electrónico y le enviaremos un enlace para restablecer su contraseña';
  @override
  String get registerHintText=> "No tienes cuenta?";

}

