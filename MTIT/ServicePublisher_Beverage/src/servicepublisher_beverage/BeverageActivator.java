package servicepublisher_beverage;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceRegistration;

public class BeverageActivator implements BundleActivator {
	
		ServiceRegistration publishServiceRegistration;
		

	public void start(BundleContext context) throws Exception {
		System.out.println("Beverage publisher start");
		BeverageServicePublish publisherService = new BeverageServicePublishImpl();
		publishServiceRegistration = context.registerService(
				BeverageServicePublish.class.getName(), publisherService, null);
	}

	public void stop(BundleContext bundleContext) throws Exception {
		System.out.println("Beverge publisher stop");
		publishServiceRegistration.unregister();
	
	}

}
