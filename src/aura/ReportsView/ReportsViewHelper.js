/**
 * Created by vshcherba on 1/14/2020.
 */
({
    getButtons: function (component) {
        let action = component.get("c.getReports");
        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let reports = JSON.parse(response.getReturnValue());
                component.set("v.reports", reports);
            } else {
                let toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": $A.get("$Label.c.error"),
                    "message": $A.get("$Label.c.serverProblems")
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    },

    redirectToReport: function (component, event) {
        let navService = component.find("navService");
        let ind = event.getSource().get("v.name");
        let report = component.get("v.reports")[ind];
        let pageReference = {
            type: 'standard__recordPage',
            attributes: {
                recordId: report.id,
                objectApiName: 'Report',
                actionName: 'view'
            }
        };
        navService.navigate(pageReference);
    }
})