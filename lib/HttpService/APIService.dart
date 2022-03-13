import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jewelssky/Activities/CreateProductUpload/SectionB/MetalColor.dart';
import 'package:jewelssky/Model/Category/CategortRequest.dart';
import 'package:jewelssky/Model/Category/CategoryResponse.dart';
import 'package:jewelssky/Model/LabCertification/LabCertificationResponse.dart';
import 'package:jewelssky/Model/Login/LoginRequest.dart';
import 'package:jewelssky/Model/Login/LoginResonse.dart';
import 'package:jewelssky/Model/MFGType/MFGTypeResponse.dart';
import 'package:jewelssky/Model/MWCollection/MWCollectionRequest.dart';
import 'package:jewelssky/Model/MWCollection/MWCollectionResponse.dart';
import 'package:jewelssky/Model/MetalColor/MetalColorRequest.dart';
import 'package:jewelssky/Model/MetalColor/MetalColorResponse.dart';
import 'package:jewelssky/Model/ProductType/ProductTypeRequest.dart';
import 'package:jewelssky/Model/ProductType/ProductTypeResponse.dart';
import 'package:jewelssky/Model/Purity/PurityRequest.dart';
import 'package:jewelssky/Model/Purity/PurityResponse.dart';
import 'package:jewelssky/Model/SaveDesignSetFirst/SaveDesignSetFirstRequest.dart';
import 'package:jewelssky/Model/SaveDesignSetFirst/SaveDesignSetFirstResponse.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionRequest.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionResponse.dart';
import 'package:jewelssky/Model/SubCategory/SubCategoryRequest.dart';
import 'package:jewelssky/Model/SubCategory/SubCategoryResponse.dart';
import 'package:jewelssky/Model/VerifyOtp/VerifyOtpRequest.dart';
import 'package:jewelssky/Model/VerifyOtp/VerifyOtpResponse.dart';
import 'package:jewelssky/Utils/mUtils.dart';

class APIService {

  Future<LoginResonse> login(LoginRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Vendor_Login'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResonse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<VerifyOtpResponse> verifyOTP(VerifyOtpRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Validate_Login_Otp'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return VerifyOtpResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<ProductTypeResponse> prodTypeMaster(ProductTypeRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Prod_Type_Master'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ProductTypeResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<SelectCollectionResponse> GetCollection(SelectCollectionRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Get_Collection'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SelectCollectionResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<CategoryResponse> getCategory(CategortRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Getcategory'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return CategoryResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<SubCategoryResponse> getSubCategory(SubCategoryRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Get_Sub_Category'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SubCategoryResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<MWCollectionResponse> mWCollection(MWCollectionRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Vendor_Collection'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return MWCollectionResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
  Future<SaveDesignSetFirstResponse> saveDesignSetFirst(SaveDesignSetFirstRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Save_Design_Set_First'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SaveDesignSetFirstResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<PurityResponse> getPurity(PurityRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Get_Metal_Wise_Purity'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return PurityResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
  Future<MetalColorResponse> getMetalColor() async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Metal_Color'), body: null);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return MetalColorResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
  Future<LabCertificationResponse> getLabCertification() async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Lab_Certification'), body: null);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LabCertificationResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<MFGTypeResponse> getMFGType() async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Make_Type_Master'), body: null);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return MFGTypeResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
