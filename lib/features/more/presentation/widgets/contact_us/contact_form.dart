import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/network/api_helper.dart';
import '../../../data/models/contact_request.dart';
import '../../../data/datasources/contact_remote_data_source.dart';
import '../../../data/repositories/contact_repository.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final repository = ContactRepository(
        ContactRemoteDataSource(APIHelper()),
      );

      final request = ContactRequest(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        message: _messageController.text,
      );

      final response = await repository.sendContactMessage(request);

      if (mounted) {
        if (response.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('contact.message_sent'.tr()),
              backgroundColor: Colors.green,
            ),
          );
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _messageController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message ?? 'contact.error_message'.tr()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('contact.error_message'.tr()),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/user-group.svg',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        const Color(0xFF282A50),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'contact.send_message'.tr(),
                    style: TextStyle(
                      fontFamily: 'Madani Arabic',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'contact.form_description'.tr(),
                style: TextStyle(
                  fontFamily: 'Madani Arabic',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF666666),
                ),
              ),
              SizedBox(height: 24.h),
              _buildTextField(
                controller: _nameController,
                hint: 'contact.name_hint'.tr(),
                validator: (v) =>
                    v!.isEmpty ? 'contact.name_required'.tr() : null,
              ),
              SizedBox(height: 16.h),
              _buildTextField(
                controller: _emailController,
                hint: 'contact.email_hint'.tr(),
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v!.isEmpty || !v.contains('@')
                    ? 'contact.email_invalid'.tr()
                    : null,
              ),
              SizedBox(height: 16.h),
              _buildTextField(
                controller: _phoneController,
                hint: 'contact.phone_hint'.tr(),
                keyboardType: TextInputType.phone,
                validator: (v) =>
                    v!.isEmpty ? 'contact.phone_required'.tr() : null,
              ),
              SizedBox(height: 16.h),
              _buildTextField(
                controller: _messageController,
                hint: 'contact.message_hint'.tr(),
                maxLines: 4,
                validator: (v) =>
                    v!.isEmpty ? 'contact.message_required'.tr() : null,
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF282A50),
                    shape: RoundedRectanglePlatform.borderRadius(12.r),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'contact.send_now'.tr(),
                          style: TextStyle(
                            fontFamily: 'Madani Arabic',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Madani Arabic',
          fontSize: 14.sp,
          color: const Color(0xFF999999),
        ),
        filled: true,
        fillColor: const Color(0xFFFCFCFC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFF282A50)),
        ),
      ),
    );
  }
}

class RoundedRectanglePlatform {
  static OutlinedBorder borderRadius(double radius) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }
}
