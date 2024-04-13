import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/theme/color_pallete.dart';


class RoundBordersCard extends StatefulWidget {

  final String importedImage;
  final NetworkImage? networkImage;
  final String context;
  final Color primaryColor;
  final Color buttonColor;
  final Widget? backWidget;
  final String chipText2;
  final String ContentText;
  final Function() onPressed;

  const RoundBordersCard({super.key,required this.importedImage,
    this.networkImage,this.buttonColor=Colors.white,
    this.primaryColor = Colors.white,this.backWidget,this.chipText2="test2",
    this.ContentText="",
    this.context="hello",required this.onPressed
  });

  @override
  State<RoundBordersCard> createState() => _RoundBordersCardState();
}

class _RoundBordersCardState extends State<RoundBordersCard> {

  Widget _card(BuildContext context,
      {Color primary = Colors.redAccent,
        String? imgPath,
        String Content ='',
        String chipText2 = '',
        Widget? backWidget,
        required Function onPressed,
        Color chipColor = Colors.grey,
        bool isPrimaryCard = false}) {
    final width = MediaQuery.of(context).size.width;

    return Container(
        height:200,
        width: width * .80,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: primary.withAlpha(200),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  color: Colors.grey.withAlpha(40))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //add card items here
                Image.asset(widget.importedImage,fit: BoxFit.cover,height: 200,width: 200,),

                _cardInfo(context, chipText2,
                    Colors.white, chipColor,
                    isPrimaryCard: isPrimaryCard,Content:Content,onPressed: onPressed as Function()),
                SizedBox(width: 15)

              ],
            ),
          ),
        ));
  }

  //card body
  Widget _cardInfo(BuildContext context, String text,
      Color textColor, Color primary,
      {bool isPrimaryCard = false,String Content="",required Function() onPressed}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 5),

          Text(
            Content
            ,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,

            style: GoogleFonts.poppins(
              fontSize: 15,
              color: ColorSchema.darkGreen,

            ),
          ),
          SizedBox(height: 10),
          Container(

            child: OutlinedButton(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
              ),
              onPressed: onPressed,
              child: Text(text,
                style: GoogleFonts.poppins(
                fontSize: 13,
                color: ColorSchema.white,

              ),),
            ),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return _card(context,
        primary: widget.primaryColor,
        imgPath: widget.importedImage,
        chipText2: widget.chipText2,
        backWidget: widget.backWidget,
        chipColor: widget.buttonColor,
        Content: widget.ContentText,
        onPressed: widget.onPressed

    );
  }
}