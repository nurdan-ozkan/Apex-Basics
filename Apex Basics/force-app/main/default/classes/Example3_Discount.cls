//Search Oil companies and apply pre defined discount. Also, set Account description field of opps as "Eligible for discount".

public without sharing class Example3_Discount {
    public static void searchUpdate(){
        //List of List search result Account and Opps
        List<List<SObject>> searchResult = [FIND 'Oil' IN ALL FIELDS RETURNING Account(Id, Description), Opportunity(Id, Amount, Discount__c)];

        //Separated Account and Opportunity Lists
        List<Account> accs = (List<Account>)searchResult[0];
        List<Opportunity> opps = (List<Opportunity>)searchResult[1];

        //New Empty Lists
        List<Account> newAccs = new List<Account>();
        List<Opportunity> newOpps = new List<Opportunity>();

        for (Account a : accs) {
            a.Description = 'Eligible for discount';
            newAccs.add(a);
        }

        for (Opportunity o : opps) {
            o.Discount__c = o.Amount * 0.3;
            newOpps.add(o);
        }
        update newAccs;
        update newOpps;
    }
}