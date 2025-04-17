import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_field.dart';
import 'package:alamatku_app/features/address/provider/address_provider.dart';
import 'package:alamatku_app/features/address/views/add_pin_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddressProvider>().clearControllers();
      context.read<AddressProvider>().loadLocationAndAlamat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            BootstrapIcons.arrow_left_circle,
            color: AppColors.primary500,
          ),
        ),
        title: const Text(
          'Tambah Alamat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary500,
          ),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label Alamat
                  labelForm('Label Alamat', true),
                  AlamatkuTextField(
                    placeholder: 'Label Alamat *',
                    controller: addressProvider.labelController,
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Wajib diisi'
                                : null,
                  ),
                  const SizedBox(height: 16),

                  // Nama
                  labelForm('Nama', true),
                  AlamatkuTextField(
                    placeholder: 'Nama *',
                    controller: addressProvider.nameController,
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Wajib diisi'
                                : null,
                  ),
                  const SizedBox(height: 16),

                  // No HP
                  labelForm('No HP', true),
                  AlamatkuTextField(
                    placeholder: 'Nomor HP *',
                    controller: addressProvider.phoneController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Wajib diisi';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Hanya boleh angka';
                      } else if (value.length < 10 || value.length > 13) {
                        return 'Nomor HP tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email
                  labelForm('Email', false),
                  AlamatkuTextField(
                    placeholder: 'Email',
                    controller: addressProvider.emailController,
                    validator: (value) {
                      final emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                      );
                      if (!emailRegex.hasMatch(value!)) {
                        return 'Format email salah.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Kota Kecamatan
                  labelForm('Kota atau Kecamatan', true),
                  AlamatkuTextField(
                    placeholder: 'Kota atau Kecamatan *',
                    controller: addressProvider.kotkecController,
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Wajib diisi'
                                : null,
                  ),
                  const SizedBox(height: 16),

                  // Kode POS
                  labelForm('Kode Pos', true),
                  AlamatkuTextField(
                    placeholder: 'Kode Pos *',
                    controller: addressProvider.postalCodeController,
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Wajib diisi'
                                : null,
                  ),
                  const SizedBox(height: 16),

                  // Kota Kecamatan
                  labelForm('Alamat Lengkap', true),
                  AlamatkuTextField(
                    placeholder: 'Alamat Lengkap *',
                    controller: addressProvider.mapDetailController,
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Wajib diisi'
                                : null,
                  ),
                  const SizedBox(height: 16),

                  // Pin Map
                  labelForm('Pin Map', true),
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AddPinScreen()),
                      );

                      if (result != null) {
                        addressProvider.setMapLocation(
                          result['lat'],
                          result['lng'],
                        );
                        addressProvider.mapAddressController.text =
                            result['address'];
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.dark200),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            BootstrapIcons.pin_map_fill,
                            color: AppColors.rose500,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              addressProvider
                                      .mapAddressController
                                      .text
                                      .isNotEmpty
                                  ? addressProvider.mapAddressController.text
                                  : 'Pilih pin lokasi kamu di map',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    addressProvider
                                            .mapAddressController
                                            .text
                                            .isNotEmpty
                                        ? Colors.black87
                                        : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // NPWP
                  labelForm('No NPWP', false),
                  AlamatkuTextField(
                    placeholder: 'No NPWP',
                    controller: addressProvider.npwpController,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: addressProvider.pickNpwpFile,
                    child: const Text('Upload NPWP'),
                  ),
                  if (addressProvider.npwpFileLink != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'File uploaded: ${addressProvider.npwpFileLink}',
                      ),
                    ),
                  const SizedBox(height: 16),

                  // Button
                  AlamatkuButton(
                    text: 'Simpan Alamat',
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        try {
                          await addressProvider.addAddressData(
                            addressProvider.mapDetailController.text,
                            addressProvider.labelController.text,
                            addressProvider.nameController.text,
                            addressProvider.phoneController.text,
                            addressProvider.emailController.text,
                            addressProvider.latMap ?? 0,
                            addressProvider.longMap ?? 0,
                            addressProvider.mapAddressController.text,
                            addressProvider.npwpController.text,
                            addressProvider.npwpController.text,
                          );

                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.only(
                                top: 16,
                                left: 16,
                                right: 16,
                              ),
                              content: Text('Add Address Success'),
                              backgroundColor: AppColors.success500,
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Add Address failed')),
                          );
                        }
                      }
                    },
                  ),

                  SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Column labelForm(String title, bool isMandatory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: AppColors.black),
            children: [
              TextSpan(text: title),
              if (isMandatory)
                TextSpan(
                  text: " *",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.rose500,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                TextSpan(),
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
