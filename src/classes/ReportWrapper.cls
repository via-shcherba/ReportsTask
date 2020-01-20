/**
 * Created by vshcherba on 1/14/2020.
 */

public with sharing class ReportWrapper {
    String id;
    String reportName;
    String format;
    String iconName;

    public ReportWrapper(String id, String reportName, String format, String iconName) {
        this.id = id;
        this.reportName = reportName;
        this.format = format;
        this.iconName = iconName;
    }

}