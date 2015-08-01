public with sharing class TopOpportunityControll {
 
    private List<Opportunity> topOpportunities;
    public Double opportunityTotal {get;set;}
 
    public TopOpportunityControll (){
        topOpportunities = [SELECT closeDate, TotalOpportunityQuantity, Id, Name,
                            AccountId, Account.Name, Probability, ExpectedRevenue, 
                            stageName, Amount FROM 
                            Opportunity where isClosed=false ORDER BY  
                            Account.Name, 
                            ExpectedRevenue DESC LIMIT 10]; 
    }
 
    public Component.Apex.TabPanel getTabbedView(){
        Component.Apex.TabPanel panel = new Component.Apex.TabPanel(
                                                       switchType = 'client',
                                                       title = 'Top 10 Opportunities');
 
        String lastAccountId;
        opportunityTotal = 0;
 
        for (Integer i = 0; i< topOpportunities.size(); i++){
            Opportunity o = topOpportunities[i];
            //opportunityTotal += o.ExpectedRevenue;
 
            //If we have a new Account record, need to create a new Tab
            if (lastAccountId != o.AccountId){
                Component.Apex.Tab acctTab = new Component.Apex.Tab();
                acctTab.label = o.Account.Name;
                panel.childComponents.add(acctTab);
            }    
 
            Component.Apex.OutputText oppText = new Component.Apex.OutputText(escape = false);
 
            oppText.value = '';
 
            //If this is a new tab, start a new <table>
            if (lastAccountId != o.AccountId){
                oppText.value += '<table class="customT"><thead class="customT"><tr class="customT"><th class="customT">Opportunity Name</th><th class="customT">Probability</th><th class="customT">Stage</th><th class="customT">Expected Revenue</th></tr><tBody class="customT"></thead><tBody class="customT">';
            }
 
            oppText.value += '<tr><td class="customT">' + o.Name + '</td>';
            oppText.value += '<td class="customT">' + o.Probability + '</td>';
            oppText.value += '<td class="customT">' + o.StageName + '</td>';
            oppText.value += '<td class="customT">' + o.ExpectedRevenue + '</td>';
            oppText.value += '</tr>';            
 
            if ( (i == topOpportunities.size() -1) || o.AccountId != topOpportunities[i+1].AccountId ){
                 oppText.value += '</tBody></table>';     
            } 
 
            panel.childComponents.get(panel.childComponents.size() -1 ).childComponents.add(oppText);
 
            lastAccountId = o.AccountId;
        }
        return panel;
    }
 
    public Component.Apex.OutputText getOppTotal(){
         Component.Apex.OutputText oppTotal = new Component.Apex.OutputText();
         oppTotal.expressions.value='{!opportunityTotal}';
         return oppTotal;
    }
}