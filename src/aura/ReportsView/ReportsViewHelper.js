/**
 * Created by vshcherba on 1/14/2020.
 */
({
    getButtons : function (component) {
        let action = component.get("c.getReports");
        action.setCallback(this, function (response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                let reports = JSON.parse(response.getReturnValue());
                component.set("v.reports", reports);
            }
        });
        $A.enqueueAction(action);
    },

    redirectToReport : function (component, event) {
        let ind = event.getSource().get("v.name");
        let report = component.get("v.reports")[ind];
        window.open("/" + report.id);
    }
})