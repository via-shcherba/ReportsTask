/**
 * Created by vshcherba on 1/14/2020.
 */

@isTest
private with sharing class ReportsViewControllerTest {

    @isTest(SeeAllData=true) static void getCustomSettingsTest() {
        test.startTest();
        List<String> reports = ReportsViewController.getCustomSettings();
        test.stopTest();
        System.assertNotEquals(null, reports);
    }

    @isTest(SeeAllData=true) static void getReportsTest() {
        test.startTest();
        String json = ReportsViewController.getReports();
        test.stopTest();
        System.assertNotEquals(null, json);
    }
}