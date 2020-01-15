/**
 * Created by vshcherba on 1/14/2020.
 */

public with sharing class ReportsViewController {
    @testVisible
    private static List<String> getCustomSettings() {
        List<String> reportsNames = new List<String>();
        for(MyReports__c cs : MyReports__c.getAll().values()) {
            if(cs.Name != null) {
                reportsNames.add(cs.Name);
            }
        }
        return reportsNames;
    }

    @AuraEnabled
    public static String getReports() {
        List<String> reportsNames =  getCustomSettings();
        List<ReportWrapper> reports = new List<ReportWrapper>();
        if(reportsNames != null) {
            for(Report rep : [SELECT Id, Name, Format FROM Report LIMIT 1000]) {
                ReportWrapper rw = new ReportWrapper(rep.Id, rep.Name, rep.Format);
                reports.add(rw);
            }
        }
        return JSON.serialize(reports);
    }

}