package servicepublisher_beverage;

public class BeverageServicePublishImpl implements BeverageServicePublish{

	@Override
	public int publishService(int type, int size) {		
		int price = 0;
		
		if(type==1 && size==1 ) {
			price = 500;//Milkshake Meadium
		}
		else if(type==1 && size==2 ) {
			price = 700;//Milkshake Large
		}
		else if(type==2 && size==1 ) {
			price = 400; //Milo Meadium
		}
		else if(type==2 && size==2 ) {
			price = 600;//Milo Large
		}
		else {
			System.out.println("Invalid Type or Invalid  Size!!");
		}
		
		int totalprice = type * size;
		return totalprice ;
		
	}
	


}
