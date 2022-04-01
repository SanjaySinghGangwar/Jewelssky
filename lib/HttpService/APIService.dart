import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:jewelssky/Model/AddSpecification/AddSpecificationRequest.dart';
import 'package:jewelssky/Model/AddSpecification/AddSpecificationResponse.dart';
import 'package:jewelssky/Model/Category/CategortRequest.dart';
import 'package:jewelssky/Model/Category/CategoryResponse.dart';
import 'package:jewelssky/Model/ColorA/ColorARequest.dart';
import 'package:jewelssky/Model/ColorA/ColorAResponse.dart';
import 'package:jewelssky/Model/LabCertification/LabCertificationResponse.dart';
import 'package:jewelssky/Model/Login/LoginRequest.dart';
import 'package:jewelssky/Model/Login/LoginResonse.dart';
import 'package:jewelssky/Model/MFGType/MFGTypeResponse.dart';
import 'package:jewelssky/Model/MWCollection/MWCollectionRequest.dart';
import 'package:jewelssky/Model/MWCollection/MWCollectionResponse.dart';
import 'package:jewelssky/Model/MaterialType/MaterialTypeRequest.dart';
import 'package:jewelssky/Model/MaterialType/MaterialTypeResponse.dart';
import 'package:jewelssky/Model/MetalColor/MetalColorResponse.dart';
import 'package:jewelssky/Model/ProductType/ProductTypeRequest.dart';
import 'package:jewelssky/Model/ProductType/ProductTypeResponse.dart';
import 'package:jewelssky/Model/Purity/PurityRequest.dart';
import 'package:jewelssky/Model/Purity/PurityResponse.dart';
import 'package:jewelssky/Model/Quality/QualityRequest.dart';
import 'package:jewelssky/Model/Quality/QualityResponse.dart';
import 'package:jewelssky/Model/SaveDesignSetFirst/SaveDesignSetFirstRequest.dart';
import 'package:jewelssky/Model/SaveDesignSetFirst/SaveDesignSetFirstResponse.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionRequest.dart';
import 'package:jewelssky/Model/SelectCollection/SelectCollectionResponse.dart';
import 'package:jewelssky/Model/SettingA/SettingResponse.dart';
import 'package:jewelssky/Model/Shape/ShapeRequest.dart';
import 'package:jewelssky/Model/Shape/ShapeResponse.dart';
import 'package:jewelssky/Model/SizeA/SizeARequest.dart';
import 'package:jewelssky/Model/SizeA/SizeAResponse.dart';
import 'package:jewelssky/Model/SubCategory/SubCategoryRequest.dart';
import 'package:jewelssky/Model/SubCategory/SubCategoryResponse.dart';
import 'package:jewelssky/Model/VerifyOtp/VerifyOtpRequest.dart';
import 'package:jewelssky/Model/VerifyOtp/VerifyOtpResponse.dart';
import 'package:jewelssky/Model/jobWiseMaterialDetails/jobWiseMaterialDetailsRequest.dart';
import 'package:jewelssky/Model/jobWiseMaterialDetails/jobWiseMaterialDetailsResponse.dart';
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

  Future<MaterialTypeResponse> GetMaterialType(MaterialTypeRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Get_Material_Type'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return MaterialTypeResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<ShapeResponse> getShapeMaster(ShapeRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Shape_Master'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ShapeResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<SizeAResponse> getMaterialSize(SizeARequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Material_Size_Master'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SizeAResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<QualityResponse> getQuality(QualityRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Material_Quality_Master'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return QualityResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<ColorAResponse> getColor(ColorARequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Material_Color_Master'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ColorAResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<SettingResponse> getSetting() async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Setting_Master'), body: null);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SettingResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<AddSpecificationResponse> AddSpecification(AddSpecificationRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Add_Specification'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return AddSpecificationResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<jobWiseMaterialDetailsResponse> jobWiseMaterialDetails(jobWiseMaterialDetailsRequest requestModel) async {
    final response = await http.post(Uri.parse(mUtis().BaseURL + 'Job_Wise_Material_Details'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return jobWiseMaterialDetailsResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<String> uploadImage(String job_no, String user_id, Uri image) async {
    var request = http.MultipartRequest("POST", Uri.parse(mUtis().BaseURL + 'Upload_Image'));
    request.fields["job_no"] = job_no;
    request.fields["user_id"] = user_id;


    request.files.add(http.MultipartFile('image',
        File(image.path).readAsBytes().asStream(), File(image.path).lengthSync(),
        filename: image.path.split("/").last));

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    if (response.statusCode == 200 || response.statusCode == 400) {
      return String.fromCharCodes(responseData);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
