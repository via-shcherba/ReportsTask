/**
 * Created by vshcherba on 1/14/2020.
 */

@isTest
private with sharing class ReportsViewControllerTest {

    @isTest static void getReportsTest() {
        Test.startTest();
        String json = ReportsViewController.getReports();
        Test.stopTest();
        System.assertNotEquals(null, json);
    }
}