import 'package:datfuel/ui/components/custom_button.dart';
import 'package:datfuel/utils/size_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import 'custom_select_payment_button.dart';


void orderOption(BuildContext context){
Navigator.pop(context);
chooseFuelOwner(context);
}

void locationBottomSheet(BuildContext context){

    showModalBottomSheet(context: context, builder: (context){
      return
        Container(
          height: 350,
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SvgPicture.asset("assets/mappin.svg"),
              SizedBox(height: 15,),
              Text("Deliver fuel to Banda?", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),),
              SizedBox(height: 10,),
              SizedBox(
                width: AppConstants.screenWidth(context) * 0.7,
                  child: Text("This location is based on your current location",textAlign: TextAlign.center, style: GoogleFonts.roboto(fontSize: 16, color: AppColors.text1, ),)),
             TextButton(onPressed: (){}, child:  Text("Change delivery address", style: GoogleFonts.roboto(fontSize: 16, color: AppColors.datBlue),),),
              SizedBox(height: 20,),
              CustomButton(width: AppConstants.screenWidth(context) * 0.85,
                  height: 50, color: AppColors.datBlue, content: "Confirm Location", onTap: ()=>orderOption(context))
            ],
          ),
        );
    });
}

Future chooseFuelOwner(BuildContext context){
  return
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return
        Container(
          decoration: BoxDecoration(
              color: AppColors.whiteColor,

              borderRadius: BorderRadius.only(topRight: Radius.circular(22), topLeft : Radius.circular(22))
          ),
          padding: EdgeInsets.all(20),
          height: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Order Options", style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 22),),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 SizedBox(
                   height: AppConstants.screenWidth(context) * 0.35,
                   width: AppConstants.screenWidth(context) * 0.35,
                   child: GestureDetector(
                     onTap: (){
                       chooseFuelType(context);

                     },
                     child: FuelOwner("For yourself", "assets/car1.svg"),
                   ),
                 ),
                  SizedBox(
                    height: AppConstants.screenWidth(context) * 0.35,
                    width: AppConstants.screenWidth(context) * 0.35,
                    child: GestureDetector(
                      onTap: (){
                        chooseFuelType(context);
                      },
                      child: FuelOwner("For someone", "assets/jerrycan.svg"),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
    });
}

Widget FuelOwner(String owner, String imagePath){
  return SizedBox(


    child: Card(
      color: AppColors.white,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,

              child: SvgPicture.asset(imagePath)),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0 ,10),
            child: Text(owner, style: GoogleFonts.roboto(fontWeight: FontWeight.w600),),
          )
        ],
      ),
    ),
  );
  
}

Future chooseFuelType(BuildContext context){
  return
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return
        Container(
          decoration: BoxDecoration(
              color: AppColors.whiteColor,

              borderRadius: BorderRadius.only(topRight: Radius.circular(22), topLeft : Radius.circular(22))
          ),
          padding: EdgeInsets.all(20),
          height: 350,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 IconButton(icon:  Icon(Icons.arrow_back_ios_new_rounded, size: 18,), onPressed: (){
                   Navigator.pop(context);
                 },),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Select fuel Type", style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 22),),
                  ),
                  SizedBox(width: 50,)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: AppConstants.screenWidth(context) * 0.35,
                    width: AppConstants.screenWidth(context) * 0.35,
                    child: GestureDetector(
                      onTap: (){
                        choosePaymentMethod(context);

                      },
                      child: FuelOwner("Petrol", "assets/kidomola_icon.svg"),
                    ),
                  ),

                  SizedBox(
                    height: AppConstants.screenWidth(context) * 0.35,
                    width: AppConstants.screenWidth(context) * 0.35,
                    child: GestureDetector(
                      onTap: (){

                        choosePaymentMethod(context);
                      },
                      child: FuelOwner("Diesel", "assets/fuel_icon.svg"),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
    });
}

Future choosePaymentMethod(BuildContext context){
  return
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return
        Container(
          decoration: BoxDecoration(
              color: AppColors.whiteColor,

              borderRadius: BorderRadius.only(topRight: Radius.circular(22), topLeft : Radius.circular(22))
          ),
          padding: EdgeInsets.all(20),
          height: 350,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon:  Icon(Icons.arrow_back_ios_new_rounded, size: 18,), onPressed: (){
                    Navigator.pop(context);
                  },),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Select Payment Method", style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 22),),
                  ),
                  SizedBox(width: 50,)
                ],
              ),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonSelectPayment(leftIcon:"assets/banknote_icon.svg", title:"Paying with Cash", onTap:(){},),
                  SizedBox(height: 30,),
                  CustomButtonSelectPayment(leftIcon: "assets/hand_tap_icon.svg", title:"Cashless Payment",onTap:(){},)
                ],
              ),
            ],
          ),
        );
    });
}
