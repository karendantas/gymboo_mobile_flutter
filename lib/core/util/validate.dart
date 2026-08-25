 String? validatePassword(String value) {
  if (value.length < 8) return 'Mínimo de 8 caracteres';
  if (!RegExp(r'[A-Za-z]').hasMatch(value) || !RegExp(r'[0-9]').hasMatch(value)) {
    return 'Precisa ter letras e números';
  }
  return null;
}
