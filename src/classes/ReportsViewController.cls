/**
 * Created by vshcherba on 1/14/2020.
 */

public with sharing class ReportsViewController {

    private static Map<String, String> getReportsInfo() {
        Map<String, String> reportsInfo = new Map<String, String>();
        for (MyReports__c report : MyReports__c.getAll().values()) {
            if (report.Name != null && report.Icon__c != null) {
                reportsInfo.put(report.Name, report.Icon__c);
            }
        }
        return reportsInfo;
    }

    @AuraEnabled
    public static String getReports() {
        Map<String, String> reportsInfo = getReportsInfo();
        List<ReportWrapper> reports = new List<ReportWrapper>();
        if (!reportsInfo.isEmpty()) {
            for (Report rep : [
                    SELECT Id, Name, Format
                    FROM Report
                    WHERE Name IN :reportsInfo.keySet()
                    LIMIT 1000
            ]) {
                String iconName = reportsInfo.get(rep.Name);
                ReportWrapper reportWrapper = new ReportWrapper(rep.Id, rep.Name, rep.Format, iconName);
                reports.add(reportWrapper);
            }
        }
        return JSON.serialize(reports);
    }

}