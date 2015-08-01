public with sharing class cusController{

// Variables to store country and state selected by user
    public String state { get; set; }
    public String country {get; set;}   

    // Generates country dropdown from country settings
    public List<SelectOption> getCountriesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', '-- Select One --'));        

        // Find all the countries in the custom setting
        Map<String, Object_Name__c> countries = Object_Name__c.getAll();
        
        // Sort them by name
        List<String> countryNames = new List<String>();
        countryNames.addAll(countries.keySet());
        countryNames.sort();
        
        // Create the Select Options.
        for (String countryName : countryNames) {
            Object_Name__c country = countries.get(countryName);
            options.add(new SelectOption(country.Name, 'ans'));
        }
        return options;
    }
    
    // To generate the states picklist based on the country selected by user.
    public String getStatesSelectList() {
        System.debug('country : ' + country);
         state = country;
         ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, state );
         ApexPages.addMessage(errorMsg);
         return state;   
    }
    
    public void save(){
    System.debug('country : ' + country);
    }
}