import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scratch_102021/firebase_auth_scratch/shared/theme.dart';

// widget buatan dibuat sebagai class
class PrimaryTextInput extends StatelessWidget {
  // parameter buatan sendiri agar lebih custom
  const PrimaryTextInput({
    Key? key,
    required this.label, // tulisan diatas input
    this.labelText, // teks placeholder
    this.initialValue, // value awal dalam inputan
    this.numberInput = false, // penentu inputan berupa angka
    this.inputFormatters, // formatter input
    this.isRequired = true, // penentu input wajib diisi
    required this.valueSetter, // fungsi pengubah value dengan isian inputan
    this.obscureText = false,
  }) : super(key: key);

  final String label;
  final String? labelText;
  final String? initialValue;
  final bool numberInput;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final Function(String?) valueSetter;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    InputBorder _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.white24,
        width: 1.0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textWhite,
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          keyboardType:
              (numberInput) ? TextInputType.number : TextInputType.text,
          style: textBlack,
          initialValue: initialValue,
          cursorColor: FlexColor.aquaBlueDarkPrimary,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: _inputBorder,
            errorBorder: _inputBorder,
            focusedErrorBorder: _inputBorder,
            focusedBorder: _inputBorder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: labelText ?? "Masukkan $label...",
            contentPadding: const EdgeInsets.all(16.0),
          ),

          // kalau tombol submit ditekan, validasi dengan validator
          validator: (value) {
            if ((value == null || value.isEmpty) && isRequired) {
              return 'Kolom ini wajib diisi!';
            }
            return null;
          },

          // ketika validasi berhasil dan form disimpan, set value dengan isian pada inputan
          onSaved: (String? val) {
            valueSetter(val);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
