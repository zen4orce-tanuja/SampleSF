public class CustomSettingCountryController {
  
    public String country {get; set;}
    public String city {get; set;}
     
     
    public List<Selectoption> getcountries(){
    	
       	
    	 
    	List<selectoption> options = new List<selectoption>();
 		Map<String , country__c> countries = country__c.getAll();
 		
 		List<String> countryNames = new List<String>();
 		
 		countryNames.addAll(countries.keySet());
 		countryNames.sort();
 		
 		for (String countryName : countryNames) {

            country__c country = countries.get(countryName);
            options.add(new SelectOption(country.Name, country.Name));

        }
        
        return options;
        
    }
         public List<Selectoption> getCities(){
    	
    	List<selectoption> options = new List<selectoption>();
 		Map<String , city__c> allcities = city__c.getAll();
 		
 		// Filter states that belong to the selected country

        Map<String, city__c> cities = new Map<String, city__c>();

        for(city__c city : allcities.values()) {
            if (city.country__c == this.country) {
               cities.put(city.name, city);
            }
        }
 		
 		
 		List<String> cityNames = new List<String>();
 		
 		cityNames.addAll(cities.keySet());
 		cityNames.sort();
 		
 		for (String cityName : cityNames ) {

            city__c city= cities.get(cityName);
            options.add(new SelectOption(city.Name, city.Name));

        }
 		   	
   
    
    	return options;
    }
}