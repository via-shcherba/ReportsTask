/**
 * Created by vshcherba on 1/14/2020.
 */

public with sharing class ReportWrapper {
    String id;
    String reportName;
    String format;

    public ReportWrapper(String id, String reportName, String format) {
        this.id = id;
        this.reportName = reportName;
        this.format = format;
    }

}