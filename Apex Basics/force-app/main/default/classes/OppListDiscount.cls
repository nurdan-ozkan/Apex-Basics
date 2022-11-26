//Apply different discount rates based on Account Types

public without sharing class OppListDiscount {

    public static void discountUpdate(){
        
        //Get Opp Records
        List<Opportunity> opps = [SELECT Id, Amount, Discount__c, Account.Type FROM Opportunity];
        List<Opportunity> newOpps = new List<Opportunity>();

        //Calculations
        for (Opportunity o : opps) {
            if (o.Account.Type == 'Technology Partner') {
                o.Discount__c = o.Amount * 0.10;
                newOpps.add(o);
            }else if(o.Account.Type == 'Installation Partner'){
                o.Discount__c = o.Amount * 0.20;
                newOpps.add(o);

            }else if(o.Account.Type == 'Channel Partner / Reseller'){
                o.Discount__c = o.Amount * 0.25;
                newOpps.add(o);
            }else{
                o.Discount__c = o.Amount * 0.05;
                newOpps.add(o);
            }
        }

        //DML statement
        update newOpps;
    }
}

        
     

 
  
