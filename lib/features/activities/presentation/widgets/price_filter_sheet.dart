import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceFilterBottomSheet extends StatefulWidget {
  final int? initialMinPrice;
  final int? initialMaxPrice;
  final void Function(int? minPrice, int? maxPrice) onApply;

  const PriceFilterBottomSheet({
    super.key,
    this.initialMinPrice,
    this.initialMaxPrice,
    required this.onApply,
  });

  @override
  State<PriceFilterBottomSheet> createState() => _PriceFilterBottomSheetState();
}

class _PriceFilterBottomSheetState extends State<PriceFilterBottomSheet> {
  int? _minPrice;
  int? _maxPrice;
  late TextEditingController _minController;
  late TextEditingController _maxController;

  @override
  void initState() {
    super.initState();
    _minPrice = widget.initialMinPrice;
    _maxPrice = widget.initialMaxPrice;
    _minController = TextEditingController(text: _minPrice?.toString() ?? '');
    _maxController = TextEditingController(text: _maxPrice?.toString() ?? '');
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.w,
        right: 16.w,
        top: 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Price Range',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Min Price'),
                  onChanged: (val) => _minPrice = int.tryParse(val),
                  controller: _minController,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Max Price'),
                  onChanged: (val) => _maxPrice = int.tryParse(val),
                  controller: _maxController,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onApply(_minPrice, _maxPrice);
              },
              child: const Text('Apply'),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
