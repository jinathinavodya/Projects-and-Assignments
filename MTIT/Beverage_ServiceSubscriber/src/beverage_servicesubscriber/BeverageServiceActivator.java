package beverage_servicesubscriber;

import java.util.Scanner;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import servicepublisher_beverage.BeverageServicePublish;

public class BeverageServiceActivator implements BundleActivator {

	ServiceReference serviceReference;

	public void start(BundleContext context) throws Exception {
		System.out.println("Start Beverage Subscriber");
		serviceReference = context.getServiceReference(BeverageServicePublish.class.getName());
		BeverageServicePublish servicePublish = (BeverageServicePublish)context.getService(serviceReference);
	
		Scanner sc = new Scanner(System.in);
		String x= "Y";
		int size,type,price;
		int full_price = 0;
		
		System.out.println("--------------\nBeverage List\n--------------");
		System.out.println("1. Milkshake Meadium");
		System.out.println("2. Milkshake Large");
		System.out.println("3. Milo Meadium");
		System.out.println("4. Milo Large");
		
		do {
			System.out.print("Choose your Favorite Beverage type: ");
			type = sc.nextInt();
			System.out.print("Portions:\n Meadium - 1\n Large - 2\n");
			System.out.print("Select your Beverage Type: ");
			size = sc.nextInt();
			
			
			System.out.print("Do you want to add  more cups: (press Y/N)");
			x=sc.next();
			
			price = servicePublish.publishService( type, size);
			full_price += price; 
		}while(x.equalsIgnoreCase("y"));
		
		System.out.print("Total Price: " + full_price + "\n");
	}

	public void stop(BundleContext context) throws Exception {
		System.out.println("Stop Beverage Subscriber");
		context.ungetService(serviceReference);
		
	}

}
