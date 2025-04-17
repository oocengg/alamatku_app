import 'package:alamatku_app/core/constant/app_colors.dart';
import 'package:alamatku_app/core/widgets/alamatku_button.dart';
import 'package:alamatku_app/core/widgets/alamatku_text_field.dart';
import 'package:alamatku_app/features/address/provider/address_provider.dart';
import 'package:alamatku_app/features/address/views/add_pin_screen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddressProvider>().loadLocationAndAlamat();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddressProvider>();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label Alamat
            labelForm('Label Alamat', true),
            AlamatkuTextField(
              placeholder: 'Label Alamat *',
              controller: provider.labelController,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),

            // Nama
            labelForm('Nama', true),
            AlamatkuTextField(
              placeholder: 'Nama *',
              controller: provider.nameController,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),

            // No HP
            labelForm('No HP', true),
            AlamatkuTextField(
              placeholder: 'Nomor HP *',
              controller: provider.phoneController,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),

            // Email
            labelForm('Email', false),
            AlamatkuTextField(
              placeholder: 'Email',
              controller: provider.emailController,
            ),
            const SizedBox(height: 16),

            // Kota Kecamatan
            labelForm('Kota atau Kecamatan', true),
            AlamatkuTextField(
              placeholder: 'Kota atau Kecamatan *',
              controller: provider.kotkecController,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),

            // Kode POS
            labelForm('Kode Pos', true),
            AlamatkuTextField(
              placeholder: 'Kode Pos *',
              controller: provider.postalCodeController,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),

            // Kota Kecamatan
            labelForm('Alamat Lengkap', true),
            AlamatkuTextField(
              placeholder: 'Alamat Lengkap *',
              controller: provider.mapDetailController,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
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
                  provider.setMapLocation(result['lat'], result['lng']);
                  provider.mapAddressController.text = result['address'];
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
                        provider.mapAddressController.text.isNotEmpty
                            ? provider.mapAddressController.text
                            : 'Pilih pin lokasi kamu di map',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              provider.mapAddressController.text.isNotEmpty
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
              controller: provider.npwpController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: provider.pickNpwpFile,
              child: const Text('Upload NPWP'),
            ),
            if (provider.npwpFileLink != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('File uploaded: ${provider.npwpFileLink}'),
              ),
            const SizedBox(height: 16),

            // Button
            AlamatkuButton(
              text: 'Simpan Alamat',
              onPressed: provider.submitAddress,
            ),

            SizedBox(height: 32),
          ],
        ),
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
