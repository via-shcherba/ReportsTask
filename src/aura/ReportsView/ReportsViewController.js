/**
 * Created by vshcherba on 1/14/2020.
 */
({
    doInit: function (component, event, helper) {
        helper.getButtons(component);
    },

    clickOnButton: function (component, event, helper) {
        helper.redirectToReport(component, event);
    },

    getIconName: function (component, event, helper) {
        return "standard:report";
    }
})