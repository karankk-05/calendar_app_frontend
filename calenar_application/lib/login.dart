// import 'package:calendar_application/core/constants/gradients.dart';
// import 'package:calendar_application/core/utils/theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:calendar_application/common/widgets/app_button.dart';
// import 'package:provider/provider.dart';

// import 'package:calendar_application/core/constants/asset_paths.dart';
// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//    @override
//   void initState() {
//     super.initState();
//     // Initialize theme after the widget is inserted into the tree
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ThemeProvider>(context, listen: false).updateTheme(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     final theme = Provider.of<ThemeProvider>(context);
//     return Scaffold(
//       backgroundColor: theme.colorScheme.surface,
//       body: SingleChildScrollView(
//       	child: Column(
//       	  children: <Widget>[
//       	    Container(
//       	      height: 400,
//       	      decoration: BoxDecoration(
//       	        image: DecorationImage(
//       	          image: theme.isDarkMode
//       	        ? const AssetImage(AssetPaths.darkBackground)
//       	        : const AssetImage(AssetPaths.lightBackground),
//       	          fit: BoxFit.fill
//       	        )
//       	      ),
//       	      child: Stack(
//       	        children: <Widget>[
//       	          Positioned(
//       	            left: 30,
//       	            width: 80,
//       	            height: 200,
//       	            child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
//       	              decoration: const BoxDecoration(
//       	                image: DecorationImage(
//       	                  image: AssetImage(AssetPaths.light1)
//       	                )
//       	              ),
//       	            )),
//       	          ),
//       	          Positioned(
//       	            left: 140,
//       	            width: 80,
//       	            height: 150,
//       	            child: FadeInUp(duration: const Duration(milliseconds: 1200), child: Container(
//       	              decoration: const BoxDecoration(
//       	                image: DecorationImage(
//       	                  image: AssetImage(AssetPaths.light2)
//       	                )
//       	              ),
//       	            )),
//       	          ),
//       	          Positioned(
//       	            right: 40,
//       	            top: 40,
//       	            width: 80,
//       	            height: 150,
//       	            child: FadeInUp(duration: const Duration(milliseconds: 1300), child: Container(
//       	              decoration: const BoxDecoration(
//       	                image: DecorationImage(
//       	                  image: AssetImage(AssetPaths.clock)
//       	                )
//       	              ),
//       	            )),
//       	          ),
//       	          Positioned(
//       	            child: FadeInUp(duration: const Duration(milliseconds: 1600), child: Container(
//       	              margin: const EdgeInsets.only(top: 50),
//       	              child: const Center(
//       	                child: Text("Login", style: TextStyle(color: Colors.white	, fontSize: 40, fontWeight: FontWeight.bold),),
//       	              ),
//       	            )),
//       	          )
//       	        ],
//       	      ),
//       	    ),
//       	    Padding(
//       	      padding: const EdgeInsets.all(30.0),
//       	      child: Column(
//       	        children: <Widget>[
//       	          FadeInUp(duration: const Duration(milliseconds: 1800), child: Container(
//       	            padding: const EdgeInsets.all(5),
//       	            decoration: BoxDecoration(
//       	              color: theme.colorScheme.surface,
//       	              borderRadius: BorderRadius.circular(10),
//       	                        border: Border.all(color: theme.colorScheme.primary),
//       	            boxShadow: const [
//       	                 BoxShadow(
//       	                  color: Color.fromRGBO(143, 148, 251, .2),
//       	                  blurRadius: 20.0,
//       	                  offset: Offset(0, 10)
//       	                )
//       	               ]
//       	            ),
//       	            child: Column(
//       	              children: <Widget>[
//       	                Container(
//       	                  padding: const EdgeInsets.all(8.0),
//       	                  decoration: BoxDecoration(
//       	                    border: Border(bottom: BorderSide(color:  theme.colorScheme.primary))
//       	                  ),
//       	                  child: TextField(
//       	                    decoration: InputDecoration(
//       	                      border: InputBorder.none,
//       	                      hintText: "Username (Enter Provided Username)",
//       	                      hintStyle: TextStyle(color: theme.colorScheme.onSurface)
//       	                    ),
//       	                  ),
//       	                ),
//       	                Container(
//       	                  padding: const EdgeInsets.all(8.0),
//       	                  child: TextField(
//       	                              obscureText: true,
//       	                    decoration: InputDecoration(
//       	                      border: InputBorder.none,
//       	                      hintText: "Password (You can leave it empty)",
//       	                      hintStyle: TextStyle(color: theme.colorScheme.onSurface)
//       	                    ),
//       	                  ),
//       	                )
//       	              ],
//       	            ),
//       	          )),
//       	          const SizedBox(height: 30,),
//       	          FadeInUp(duration: const Duration(milliseconds: 1900), child:AppButton(text: "Login", onPressed:(){}, gradient: theme.isDarkMode?DarkGradients.buttonGradient:LightGradients.buttonGradient) ),
//       	          const SizedBox(height: 30,),
//       	          FadeInUp(duration: const Duration(milliseconds: 2000), child: Text("Forgot Password?", style: TextStyle(color: theme.colorScheme.onSurface))),
//       	        ],
//       	      ),
//       	    )
//       	  ],
//       	),
//       )
//     );
//   }
// }