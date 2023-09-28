public class purchaseInsights {
    @AuraEnabled
    public static List<Object>  purchaseData(String recordId){
        //String recordId='1AL005260424345GAA';
        //String recordId='1AL005226404540GAA';
        	String unId = getAllMetadata(recordId);
			ConnectApi.CdpQueryInput input = new ConnectApi.CdpQueryInput();  
           input.sql = 'SELECT  HighestOrderAmount__c,LowestOrderAmount__c, TotalOrders__c, TotalSpend__c, AvgOrderAmount__c from Customer_Purchase_insights__cio where CustomerId__c=\'' + unId +'\'';
           ConnectApi.CdpQueryOutput Output2 = ConnectApi.CdpQuery.queryANSISql(input);
           System.debug(Output2.data);
           return Output2.data;
    }
     private static String getAllMetadata(String recordId){
        String qu='SELECT ssot__Id__c from UnifiedssotIndividualUnif__dlm Where Id=\'' + recordId +'\'';
        List<SObject> results = Database.query(qu);
        return results.isEmpty() ? null : (String) results[0].get('ssot__Id__c');
    }

}