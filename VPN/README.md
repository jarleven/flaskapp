### VPN network for ROV

 * Pi as VPN server https://www.youtube.com/watch?v=Iwoznebw88o

 * VPN client (Running on the ROV robot in our case) https://www.youtube.com/watch?v=ym6O482tDQk
 
 * OpenVPN on Ubuntu https://www.youtube.com/watch?v=3F18KT8W7CQ

```

                                                   PC with webbrowser

			       OpenVPN server       /
                                  \                /                    
                                   \              / 

                                    3DATA OpnSense	( Static route to VPN network. Port forward VPN port )				

					\

					Internet
			
                                         /                      

			VLFK Guest network   ( Created GUEST network for the Pi ROV )

	                              \

				Pi ROV running OpenVPN client

```				
